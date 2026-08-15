vim.o.number = true -- line number
vim.o.relativenumber = true -- relative line numbers
vim.o.cursorline = true -- highlight current line
vim.o.wrap = false -- do not wrap lines by default
vim.o.scrolloff = 10 -- keep 10 lines above/below cursor
vim.o.sidescrolloff = 10 -- keep 10 lines to left/right of cursor

vim.o.tabstop = 2 -- tabwidth
vim.o.shiftwidth = 2 -- indent width
vim.o.softtabstop = 2 -- soft tab stop not tabs on tab/backspace
vim.o.expandtab = true -- use spaces instead of tabs
vim.o.smartindent = true -- smart auto-indent
vim.o.autoindent = true -- copy indent from current line

vim.o.ignorecase = true -- case insensitive search
vim.o.smartcase = true -- case sensitive if uppercase in string
vim.o.hlsearch = true -- highlight search matches
vim.o.incsearch = true -- show matches as you type

vim.o.signcolumn = "yes" -- always show a sign column
vim.o.colorcolumn = "100" -- show a column at 100 position chars
vim.o.showmatch = true -- highlights matching brackets
vim.o.cmdheight = 1 -- single line command line
vim.o.completeopt = "menuone,noinsert,noselect" -- completion options
vim.o.showmode = false -- do not show the mode, instead have it in statusline
vim.o.laststatus = 2 -- per-window statusline (pairs with lualine's globalstatus = false)
vim.o.pumheight = 10 -- popup menu height
vim.o.pumblend = 10 -- popup menu transparency
vim.o.winblend = 0 -- floating window transparency
vim.o.conceallevel = 2 -- obsidian requirement
vim.o.concealcursor = "" -- do not hide cursorline in markup
vim.o.synmaxcol = 300 -- syntax highlighting limit
--vim.o.fillchars = { eob = " " } -- hide "~" on empty lines

vim.o.backup = false -- do not create a backup file
vim.o.writebackup = false -- do not write to a backup file
vim.o.swapfile = false -- do not create a swapfile
--vim.o.undofile = true -- do create an undo file
--vim.o.undodir = ~/.config/nvim_undodir -- set the undo directory
vim.o.updatetime = 300 -- faster completion
vim.o.timeoutlen = 500 -- timeout duration
vim.o.ttimeoutlen = 50 -- key code timeout
vim.o.autoread = true -- auto-reload changes if outside of neovim
vim.o.autowrite = false -- do not auto-save

vim.o.hidden = true -- allow hidden buffers
vim.o.errorbells = false -- no error sounds
vim.o.backspace = "indent,eol,start" -- better backspace behaviour
vim.o.autochdir = false -- do not autochange directories

vim.o.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175" -- cursor blinking and settings

vim.o.splitbelow = true -- horizontal splits go below
vim.o.splitright = true -- vertical splits go right

vim.o.wildmenu = true -- tab completion
vim.o.wildmode = "longest:full,full" -- complete longest common match, full completion list, cycle through with Tab
vim.o.maxmempattern = 20000 -- increase max memory
