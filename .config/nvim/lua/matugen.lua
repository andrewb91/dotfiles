 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#121412',
    base01 = '#1e201e',
    base02 = '#292a28',
    base03 = '#8c928b',
    base04 = '#c2c8c0',
    base05 = '#e3e3df',
    base06 = '#e3e3df',
    base07 = '#e3e3df',
    base08 = '#ffb4ab',
    base09 = '#b8c7e8',
    base0A = '#bccabc',
    base0B = '#abcfb2',
    base0C = '#b8c7e8',
    base0D = '#abcfb2',
    base0E = '#bccabc',
    base0F = '#d8e6d8',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#e3e3df',          bg = '#121412' })
  hi('TelescopeBorder',         { fg = '#8c928b',             bg = '#121412' })
  hi('TelescopePromptNormal',   { fg = '#e3e3df',          bg = '#121412' })
  hi('TelescopePromptBorder',   { fg = '#8c928b',             bg = '#121412' })
  hi('TelescopePromptPrefix',   { fg = '#abcfb2',             bg = '#121412' })
  hi('TelescopePromptCounter',  { fg = '#c2c8c0',  bg = '#121412' })
  hi('TelescopePromptTitle',    { fg = '#121412',             bg = '#abcfb2' })
  hi('TelescopePreviewTitle',   { fg = '#121412',             bg = '#bccabc' })
  hi('TelescopeResultsTitle',   { fg = '#121412',             bg = '#b8c7e8' })
  hi('TelescopeSelection',      { fg = '#e3e3df',          bg = '#292a28' })
  hi('TelescopeSelectionCaret', { fg = '#abcfb2',             bg = '#292a28' })
  hi('TelescopeMatching',       { fg = '#abcfb2',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#e3e3df',          bg = '#121412' })
  hi('MiniPickBorder',         { fg = '#8c928b',             bg = '#121412' })
  hi('MiniPickPrompt',   { fg = '#e3e3df',          bg = '#121412' })
  hi('MiniPickPromptPrefix',   { fg = '#abcfb2',             bg = '#121412' })
  hi('MiniPickBorderText',    { fg = '#121412',             bg = '#abcfb2' })
  hi('MiniPickMatchCurrent',      { fg = '#e3e3df',          bg = '#292a28' })
  hi('MiniPickPromptCaret', { fg = '#abcfb2',             bg = '#292a28' })
  hi('MiniPickMatchRanges',       { fg = '#abcfb2',             bold = true })
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
