-- ===================== Keymaps ========================

-- Terminal
vim.keymap.set("n", "<leader>t", "<cmd>FloatermToggle floaterm1<CR>", {
    desc = "Toggle terminal",
})

-- File operations
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", {
    desc = "Save file",
})

vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>", {
    desc = "Quit",
})

-- Clipboard
vim.keymap.set({"n", "v"}, "<leader>y", '"+y', {
    desc = "Yank to clipboard",
})

vim.keymap.set({"n", "v"}, "<leader>d", '"+d', {
    desc = "Delete to clipboard",
})

-- Fzf-lua
vim.keymap.set("n", "<leader>p", "<cmd>FzfLua live_grep<CR>", {
    desc = "Search text",
})

vim.keymap.set("n", "<leader>f", "<cmd>FzfLua files<CR>", {
    desc = "Find files",
})

vim.keymap.set("n", "<leader>h", "<cmd>FzfLua helptags<CR>", {
    desc = "Search help",
})

-- Oil
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", {
    desc = "Open Parent Directory in Oil",
})

-- LSP
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {
    desc = "Format buffer",
})

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", {
    desc = "Move line down",
})

vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", {
    desc = "Move line up",
})

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", {
    desc = "Move selection down",
})

vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", {
    desc = "Move selection up",
})

-- Splitting
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", {
    desc = "Split window vertically",
})

vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", {
    desc = "Split window horizontally",
})

-- Window resizing
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", {
    desc = "Increase window height",
})

vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", {
    desc = "Decrease window height",
})

vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", {
    desc = "Decrease window width",
})

vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", {
    desc = "Increase window width",
})

-- Buffer navigation
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", {
    desc = "Next buffer",
})

vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", {
    desc = "Previous buffer",
})
