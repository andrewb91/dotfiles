 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#131412',
    base01 = '#1f201e',
    base02 = '#2a2a28',
    base03 = '#8f9289',
    base04 = '#c5c8be',
    base05 = '#e4e2df',
    base06 = '#e4e2df',
    base07 = '#e4e2df',
    base08 = '#ffb4ab',
    base09 = '#b2cbcb',
    base0A = '#c4c8bc',
    base0B = '#becbb1',
    base0C = '#b2cbcb',
    base0D = '#becbb1',
    base0E = '#c4c8bc',
    base0F = '#e0e4d7',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#e4e2df',          bg = '#131412' })
  hi('TelescopeBorder',         { fg = '#8f9289',             bg = '#131412' })
  hi('TelescopePromptNormal',   { fg = '#e4e2df',          bg = '#131412' })
  hi('TelescopePromptBorder',   { fg = '#8f9289',             bg = '#131412' })
  hi('TelescopePromptPrefix',   { fg = '#becbb1',             bg = '#131412' })
  hi('TelescopePromptCounter',  { fg = '#c5c8be',  bg = '#131412' })
  hi('TelescopePromptTitle',    { fg = '#131412',             bg = '#becbb1' })
  hi('TelescopePreviewTitle',   { fg = '#131412',             bg = '#c4c8bc' })
  hi('TelescopeResultsTitle',   { fg = '#131412',             bg = '#b2cbcb' })
  hi('TelescopeSelection',      { fg = '#e4e2df',          bg = '#2a2a28' })
  hi('TelescopeSelectionCaret', { fg = '#becbb1',             bg = '#2a2a28' })
  hi('TelescopeMatching',       { fg = '#becbb1',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#e4e2df',          bg = '#131412' })
  hi('MiniPickBorder',         { fg = '#8f9289',             bg = '#131412' })
  hi('MiniPickPrompt',   { fg = '#e4e2df',          bg = '#131412' })
  hi('MiniPickPromptPrefix',   { fg = '#becbb1',             bg = '#131412' })
  hi('MiniPickBorderText',    { fg = '#131412',             bg = '#becbb1' })
  hi('MiniPickMatchCurrent',      { fg = '#e4e2df',          bg = '#2a2a28' })
  hi('MiniPickPromptCaret', { fg = '#becbb1',             bg = '#2a2a28' })
  hi('MiniPickMatchRanges',       { fg = '#becbb1',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
