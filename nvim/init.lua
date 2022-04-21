




-- Global settings
vim.o["backup"] = false -- Don't create a backup file before overwriting a file
vim.o["completeopt"] = "noinsert,menuone,noselect" -- Do not insert anything until the user selects it; Show the menu when there is just one match; Force the user to select something from the menu
vim.o["encoding"] = "UTF-8" -- Set encoding to UTF-8
vim.o["errorbells"] = false -- Disable error bell & screen flashing
vim.o["foldlevel"] = 99 -- The higher, the more folded regions are open (0 = all folds closed)
vim.o["foldlevelstart"] = 99 -- Inital fold level; close all folds when opening a new buffer
vim.o["guicursor"] = "n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor" -- Cursor shapes
vim.o["hidden"] = true -- Don't kill buffers, when exiting, keep them around in the background
vim.o["hlsearch"] = false -- Highlighting on search
vim.o["ignorecase"] = true -- Ignore case in searches
vim.o["inccommand"] = "split" -- Show preview of substitute
vim.o["incsearch"] = true -- Directly jump to next match when searching
vim.o["mouse"] = 'a' -- Enable mouse support
vim.o["pumheight"] = 20 -- Max completion menu height
vim.o["sessionoptions"] = "blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal" -- Session management options
vim.o["shortmess"] = vim.api.nvim_get_option("shortmess") .. "c" -- Avoid prompts for auto-complete
vim.o["showmode"] = false -- Hide the -- INSERT -- at the bottom
vim.o["smartcase"] = true -- Don't ignore case in searches when using case in search
vim.o["swapfile"] = false -- Don't create swapfiles
vim.o["undodir"] = vim.fn.expand("~/.local/share/nvim/undodir") -- File to store undo stacks in

-- Window settings
vim.wo["number"] = true
vim.wo["relativenumber"] = true
vim.wo["cursorcolumn"] = false -- Indicate current column
vim.wo["cursorline"] = true -- Indicate current line
vim.wo["foldmethod"] = "syntax" -- Auto fold method set to syntax (Determine folds based on file specific syntax)
vim.wo["foldnestmax"] = 20 -- Deepest possible fold
vim.wo["wrap"] = false -- Long lines are displayed as one line (Horizontal scrolling required)

-- Buffer Setttings
vim.bo["expandtab"] = true -- Insert spaces instead of tab
vim.bo["shiftwidth"] = 4 -- Affects <<, >>, and auto indent
vim.bo["smartindent"] = true -- Automatically indent on a new line
vim.bo["softtabstop"] = 4 -- Number of spaces a <Tab> accounts for when editing
vim.bo["tabstop"] = 4 -- How many spaces a <Tab> in a file accounts for
vim.bo["undofile"] = true -- Keep a file with the undo stack

-- Show invisible characters
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

vim.opt.scrolloff = 2 -- Lines of context
vim.opt.sidescrolloff = 4 -- Columns of context
vim.opt.signcolumn = "yes" -- Always show signcolumn
