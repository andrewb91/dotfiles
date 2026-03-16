
#!/usr/bin/env bash
# =============================================================================
# Mount VeraCrypt volume - reasonably secure & convenient version
# 2024–2026 edition
# =============================================================================

set -u
set -e

# ──────────────────────────────────────────────────────────────────────────────
#  CONFIGURATION - change these values
# ──────────────────────────────────────────────────────────────────────────────

#VOLUME_FILE="/path/to/your/container.vc"           # or /dev/sdb3 etc.
VOLUME_FILE= /dev/sda5
MOUNT_POINT="/mnt/secure"                           # must already exist

# Which slot to use (usually 1 is fine)
SLOT=1

# Options you almost always want:
VC_OPTIONS=(
    --text
    --protect-hidden=no
    --pim=0                                     # change if using PIM
    --slot="$SLOT"
    --mount-options=uid=$(id -u),gid=$(id -g),umask=077
)

# ──────────────────────────────────────────────────────────────────────────────
#  You usually don't need to change anything below
# ──────────────────────────────────────────────────────────────────────────────

# Safety checks
if [[ ! -f "$VOLUME_FILE" && ! -b "$VOLUME_FILE" ]]; then
    echo "❌ Volume file/block device not found:" >&2
    echo "    $VOLUME_FILE" >&2
    exit 1
fi

if [[ ! -d "$MOUNT_POINT" ]]; then
    echo "❌ Mount point does not exist: $MOUNT_POINT" >&2
    echo "    sudo mkdir -p '$MOUNT_POINT'" >&2
    echo "    sudo chown $USER: '$MOUNT_POINT'" >&2
    exit 1
fi

# ──────────────────────────────────────────────────────────────────────────────
#  Main logic
# ──────────────────────────────────────────────────────────────────────────────

echo "→  VeraCrypt volume: $(basename "$VOLUME_FILE")"
echo "   Mount point:     $MOUNT_POINT"
echo

# Check if already mounted
if veracrypt --text --slot="$SLOT" --list 2>/dev/null | grep -q "$MOUNT_POINT"; then
    echo "→  Volume already mounted on $MOUNT_POINT"
    exit 0
fi

# ── Interactive password entry ──────────────────────────────────────────────
echo "Enter password (will not be echoed):"
read -s -r PASSWORD
echo

if [[ -z "$PASSWORD" ]]; then
    echo "❌ No password entered. Aborting." >&2
    exit 1
fi

# ── Try to mount ────────────────────────────────────────────────────────────
echo "Mounting..."

if printf '%s' "$PASSWORD" | \
    sudo veracrypt \
        "${VC_OPTIONS[@]}" \
        --password=/dev/stdin \
        "$VOLUME_FILE" \
        "$MOUNT_POINT" 2>&1; then

    echo
    echo "✓  Successfully mounted"
    echo "   Location:  $MOUNT_POINT"
    echo

    # Optional: show content
    ls -la "$MOUNT_POINT" | head -n 8
    [[ $(find "$MOUNT_POINT" -maxdepth 1 | wc -l) -gt 8 ]] && echo "   …"
else
    echo
    echo "❌  Mount failed" >&2
    exit 1
fi

# ── Clean sensitive data from memory ────────────────────────────────────────
unset PASSWORD
