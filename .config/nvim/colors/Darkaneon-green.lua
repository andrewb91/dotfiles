-- neon-grove.lua  (GTK-accurate version)
local colors = {
    bg       = "#093d21",   -- your exact bg_color
    bg2      = "#052413",   -- base_color
    bg3      = "#041e10",   -- panel_bg (shade 0.5)
    bg4      = "#0a4927",   -- sidebar / lighter panels
    fg       = "#e6e6e6",   -- alpha(white, 0.8)
    fg_dim   = "#a8b8a8",   -- muted fg

    accent   = "#09b358",
    accent2  = "#10e56f",
    border   = "#1e4a32",

    sel_bg   = "#09b358",
    sel_fg   = "#ffffff",

    warning  = "#ffc224",
    error    = "#ed1919",
    success  = "#19ed76",
}

local h = vim.api.nvim_set_hl

-- Core editor
h(0, "Normal",          { fg = colors.fg, bg = colors.bg })
h(0, "NormalFloat",     { fg = colors.fg, bg = colors.bg2 })
h(0, "FloatBorder",     { fg = colors.border, bg = colors.bg2 })
h(0, "CursorLine",      { bg = colors.bg3 })
h(0, "ColorColumn",     { bg = colors.bg3 })
h(0, "LineNr",          { fg = colors.fg_dim })
h(0, "CursorLineNr",    { fg = colors.accent, bold = true })
h(0, "VertSplit",       { fg = colors.border })
h(0, "WinSeparator",    { fg = colors.border })

-- Syntax
h(0, "Comment",         { fg = colors.fg_dim, italic = true })
h(0, "String",          { fg = "#a3d977" })
h(0, "Number",          { fg = "#ff9e64" })
h(0, "Keyword",         { fg = colors.accent, bold = true })
h(0, "Function",        { fg = "#7ec0ee", bold = true })
h(0, "Type",            { fg = "#a3d977" })
h(0, "Identifier",      { fg = colors.fg })

-- Treesitter
h(0, "@variable",           { fg = colors.fg })
h(0, "@function",           { fg = "#7ec0ee", bold = true })
h(0, "@keyword",            { fg = colors.accent, bold = true })
h(0, "@string",             { fg = "#a3d977" })
h(0, "@number",             { fg = "#ff9e64" })
h(0, "@type",               { fg = "#a3d977" })

-- UI
h(0, "Visual",          { bg = "#1e5c45", fg = "#ffffff" })
h(0, "Search",          { bg = colors.warning, fg = colors.bg })
h(0, "IncSearch",       { bg = colors.accent2, fg = colors.bg })
h(0, "Pmenu",           { fg = colors.fg, bg = colors.bg2 })
h(0, "PmenuSel",        { fg = colors.sel_fg, bg = colors.sel_bg })
h(0, "StatusLine",      { fg = colors.fg, bg = colors.bg4 })
h(0, "StatusLineNC",    { fg = colors.fg_dim, bg = colors.bg2 })
h(0, "TabLineSel",      { fg = "#ffffff", bg = colors.accent, bold = true })

-- Diagnostics & Git
h(0, "DiagnosticError", { fg = colors.error })
h(0, "DiagnosticWarn",  { fg = colors.warning })
h(0, "DiagnosticInfo",  { fg = "#7ec0ee" })
h(0, "DiagnosticHint",  { fg = "#a3d977" })

-- Terminal colors
vim.g.terminal_color_0  = colors.bg
vim.g.terminal_color_2  = colors.success
vim.g.terminal_color_10 = "#10e56f"
-- ... (others can stay default or add more if you want)
