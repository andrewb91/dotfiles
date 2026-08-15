-- ~/.config/nvim/colors/earthgreen.lua
-- Earth Green Neovim Colorscheme for v0.12+ with transparency support

local colors = {
    accent      = "#202b15",  -- black-olive
    bg_alt      = "#485131",  -- verdigris
    fg          = "#bfc5c6",  -- silver-sand
    muted       = "#8c999b",  -- granny-smith
    bg          = "#7ea55b",  -- asparagus (highlight)
    accent2     = "#70815c",  -- limed-ash
    dark        = "#4a713f",  -- fern-green
    warm        = "#ac9843",  -- husk
    border      = "#4a5a56",  -- nandor
    comment     = "#70815c",
}

local hl = vim.api.nvim_set_hl

-- Safely clear highlights
pcall(vim.cmd, "highlight clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "earthgreen"

-- Core UI with transparency
hl(0, "Normal",          { fg = colors.fg, bg = "NONE" })
hl(0, "NormalFloat",     { fg = colors.fg, bg = "NONE" })
hl(0, "NormalNC",        { fg = colors.fg, bg = "NONE" })

hl(0, "CursorLine",      { bg = "#2c3a22" })
hl(0, "LineNr",          { fg = colors.muted, bg = "NONE" })
hl(0, "CursorLineNr",    { fg = colors.accent, bold = true, bg = "NONE" })
hl(0, "SignColumn",      { bg = "NONE" })
hl(0, "VertSplit",       { fg = colors.border })
hl(0, "WinSeparator",    { fg = colors.border })
hl(0, "StatusLine",      { fg = colors.fg, bg = colors.bg_alt })
hl(0, "StatusLineNC",    { fg = colors.muted, bg = colors.bg_alt })

-- Syntax
hl(0, "Comment",         { fg = colors.comment, italic = true })
hl(0, "Constant",        { fg = colors.warm })
hl(0, "String",          { fg = "#9eb68c" })
hl(0, "Number",          { fg = colors.warm })
hl(0, "Boolean",         { fg = colors.accent })
hl(0, "Function",        { fg = colors.accent })
hl(0, "Keyword",         { fg = colors.accent, bold = true })
hl(0, "Type",            { fg = colors.accent2 })

-- Visual & Search
hl(0, "Visual",          { bg = "#4a5a56" })
hl(0, "Search",          { bg = colors.warm, fg = "#202b15" })
hl(0, "IncSearch",       { bg = colors.accent, fg = "#202b15", bold = true })

-- Popup menu
hl(0, "Pmenu",           { fg = colors.fg, bg = colors.bg_alt })
hl(0, "PmenuSel",        { fg = "#202b15", bg = colors.accent })

-- Diagnostics
hl(0, "DiagnosticError", { fg = "#e06c75" })
hl(0, "DiagnosticWarn",  { fg = colors.warm })
hl(0, "DiagnosticInfo",  { fg = colors.muted })
hl(0, "DiagnosticHint",  { fg = colors.accent })

-- Treesitter
hl(0, "@variable",       { fg = colors.fg })
hl(0, "@function",       { fg = colors.accent })
hl(0, "@keyword",        { fg = colors.accent, bold = true })
hl(0, "@string",         { fg = "#9eb68c" })
hl(0, "@comment",        { fg = colors.comment, italic = true })

--print("🌿 Earth Green colorscheme with transparency loaded")
