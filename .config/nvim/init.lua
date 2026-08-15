-- =============================================
--  init.lua - Clean Neovim 0.12 config
-- =============================================

-- Set leader key early
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Load modular configs

require("config.options")
require("config.keymap")
require("config.statusline")

-- ====================== Plugins ======================
vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
--  "https://github.com/echasnovski/mini.statusline",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  "https://github.com/chomosuke/typst-preview.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/voldikss/vim-floaterm",
  "https://github.com/nvimdev/lspsaga.nvim",
})

-- ====================== Plugin Setup ======================

--require("mini.statusline").setup()
require("mason").setup()
require("fzf-lua").setup()
require("which-key").setup()
require("lspsaga").setup({})
require("oil").setup({
  default_file_explorer = true, 

  view_options = {
    -- Show hidden files by default (dotfiles)
    show_hidden = true,

    -- Optional: hide annoying folders even when show_hidden = true
    is_always_hidden = function(name, _)
      return name == ".git"          -- hide .git always
          or name == "node_modules"
    end,
  },

  -- Other options you might like
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
})

-- Treesitter (recommended basic setup)
require("nvim-treesitter.configs").setup({
  ensure_installed = { "bash", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "typst" },
  highlight = { enable = true },
  indent = { enable = true },
})

-- ====================== LSP (New Native 0.12 way) ======================
vim.lsp.config("bashls", {})
vim.lsp.enable("bashls")

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

vim.lsp.enable("lua_ls")

-- ====================== Appearance ======================

local ok, err = pcall(vim.cmd.colorscheme, "Darkaneon-green")

if not ok then
    vim.notify(
        "Could not load colorscheme Darkaneon-green: " .. err,
        vim.log.levels.WARN
    )
end

-- ====================== Final Messages ======================
--vim.notify("✓ Config loaded successfully", vim.log.levels.INFO)
