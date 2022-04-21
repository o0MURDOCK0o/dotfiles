vim.api.nvim_set_option("termguicolors", true) -- Enable 24-bit color
vim.g.syntax = true -- Enable syntax highlighting

-- Leader Key
vim.g.mapleader = ' '
vim.b.mapleader = ' '


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

-- Plugins
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Nvim fennel integration
    use 'rktjmp/hotpot.nvim'
    -- Orgmode
    use {
        'nvim-neorg/neorg',
        requires = 'nvim-lua/plenary.nvim',
    }
    -- Dracula colour scheme
    use {
        'Mofiqul/dracula.nvim',
        config = function()
            vim.cmd("colorscheme dracula")
        end
    }
    -- Smart parentheses
    use {
        'eraserhd/parinfer-rust',
        run = "cargo build --release",
    }
    -- Coloured parentheses
    use {
        'p00f/nvim-ts-rainbow',
    }
    -- Slime for vim
    use {
        'vlime/vlime',
        --[[ config = function()
        vim.api.nvim_exec("autocmd TextChangedI lisp call feedkeys(\"\\<c-x>\\<c-o>\")", false)
        end, ]]
    }
    -- Show indent guides
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("indent_blankline").setup {
                char = "|",
                space_char_blankline = " ",
                show_current_context = true,
                buftype_exclude = {"terminal"}
            }
        end
    }
    -- Treesitter support
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
                highlight = {
                    enable = true,              -- false will disable the whole extension
                },
                indent = {
                    enable = true
                }
                rainbow = {
                    enable = true,
                    colors = {
                        "#bd93f9",
                        "#50fa7b",
                        "#ffb86c",
                        "#ff79c6",
                        "#8be9fd",
                        "#f1fa8c",
                    },
                },
            }
        end,
    }
    use {
        'neovim/nvim-lspconfig',
    } -- Common configs for the in-built lsp client

    use {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lsp_signature_help' },
                    { name = 'neorg' },
                    { name = 'luasnip' },
                    { name = 'path' },
                    { name = 'omni' },
                    { name = 'buffer' },
                }),
                sorting = {
                    comparators = {
                        cmp.config.compare.score,
                    }
                }
            })
        end,
    } -- Completion
    use {
        'hrsh7th/cmp-nvim-lsp',
        requires = 'hrsh7th/nvim-cmp',
        requires = 'neovim/nvim-lspconfig',
    }
    use {
        'hrsh7th/cmp-nvim-lsp-signature-help',
        requires = 'hrsh7th/nvim-cmp',
        requires = 'hrsh7th/cmp-nvim-lsp',
        requires = 'neovim/nvim-lspconfig',
    }
    use {
        'hrsh7th/cmp-buffer',
        after = 'nvim-cmp',
        requires = 'hrsh7th/nvim-cmp',
    }
    use {
        'hrsh7th/cmp-path',
        after = 'nvim-cmp',
        requires = 'hrsh7th/nvim-cmp',
    }
    use {
        'hrsh7th/cmp-omni',
        after = 'nvim-cmp',
        requires = 'hrsh7th/nvim-cmp',
    }
    use {
        'saadparwaiz1/cmp_luasnip',
        requires = 'hrsh7th/nvim-cmp',
        requires = 'L3MON4D3/LuaSnip',
    }

    use {
        'L3MON4D3/LuaSnip',
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    } -- Snippet Engine

    use {
        'rafamadriz/friendly-snippets',
    } -- Snippets

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} },
    } -- Fuzzy Finding

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end,
    } -- Auto pairs

    use  {
        'tpope/vim-repeat',
    } -- Repeat commands by plugins

    use {
        'tpope/vim-surround',
    } -- Surround text object

    use {
        'b3nj5m1n/kommentary',
    } -- Comment out text

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    } -- Highlight color codes

    use {
        'editorconfig/editorconfig-vim',
    } -- Editor config

    use {
        'beauwilliams/statusline.lua',
    } -- Statusline

    use {
        'tpope/vim-fugitive',
    } -- Vim git integration

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup()
        end
    }
end)
