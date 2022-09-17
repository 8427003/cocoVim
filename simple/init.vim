" File: init.vim
" Desption:
" Author: 
" Last Change: 2022/07/09

if exists('loaded_init')
    finish
endif
let loaded_init=1

" Plugins will be downloaded under the specified directory.
" ~/.local/share/nvim
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')


let mapleader="<Space>"

Plug 'terryma/vim-expand-region'
Plug 'windwp/nvim-autopairs'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

""""""""""""""""""""""""""""""""""ctrl-p start""""""""""""""""""""""""""""""""""""""
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-lua/plenary.nvim' " 工具依赖库, 非核心功能
Plug 'nvim-telescope/telescope.nvim' "全文件搜索，取代ctrl-p
""""""""""""""""""""""""""""""""""ctrl-p end""""""""""""""""""""""""""""""""""""""

Plug 'EdenEast/nightfox.nvim' "支持自定义主题配色扩展

""""""""""""""""""""""""""""""""""lsp start""""""""""""""""""""""""""""""""
Plug 'williamboman/nvim-lsp-installer' "lsp 服务端管理
Plug 'neovim/nvim-lspconfig' "lsp 客户端配置

" autocomplation 和 complation 是有区别的
" Autocompletion (not built-in) vs. completion (built-in)
" 简单来说lspconfig本身做不到自动补全，需要通过ctrl+o(且额外需要把配置开启)来手动触发才能打开自动补全窗口.
"lsp client 自动补全比较弱，nvim-cmp这一套是一个增强 
"参考https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp' "等于代理了lspconfig
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/nvim-cmp' "core 模块

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

"Plug 'glepnir/lspsaga.nvim' "lsp 更高性能sug UI 没用
""""""""""""""""""""""""""""""""""lsp end""""""""""""""""""""""""""""""""

Plug 'lewis6991/gitsigns.nvim' "git 显示最近一行代码被谁修改过
Plug 'akinsho/toggleterm.nvim' "ctrl + t 弹出shell命令行

Plug 'moll/vim-bbye' " 暂时没有，用来删除当前tab，可以自动锁定到下一个tab，区别与:q 不能定位到下一个tab

Plug 'lukas-reineke/indent-blankline.nvim' "缩进

Plug 'numToStr/Comment.nvim' "leader + / 批量注释代码
"Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'ahmedkhalf/project.nvim' " 暂时没用 

Plug 'akinsho/bufferline.nvim' "控制配置上面tab样式
" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering


"语法高亮，缩进
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


set nu! " show line number

let &termencoding=&encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,big5

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

nnoremap <silent><TAB> :BufferLineCycleNext<CR>
nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
nnoremap <CR><CR> <C-^>

" ------------------------------------------------------------------
" undo 持久化
" ------------------------------------------------------------------
if has('persistent_undo')      "check if your vim version supports it
  set undofile
  set undodir=~/.config/.nvim/undodir  "directory where the undo files will be stored
endif 



" ------------------------------------------------------------------
" tab 缩进设置
" ------------------------------------------------------------------
set cindent shiftwidth=2 " set cindent on to autoinent when editing c/c++ file, with 4 shift width
set tabstop=2 " set tabstop to 4 characters
set softtabstop=2
set expandtab " set expandtab on, the tab will be change to space automaticaly
set ve=block " in visual block mode, cursor can be positioned where there is no actual character

set backspace=indent,eol,start



set clipboard+=unnamedplus

set cursorline

" 禁止保存临时文件
set nobackup
set nowritebackup

"取消交换文件
set noswapfile



set completeopt=menu,menuone,noselect

let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_show_end_of_line = v:false
let g:indent_blankline_char = '¦'

nnoremap nf <cmd>NvimTreeFindFile<cr>


lua << EOF
--fix indent 垂直虚线不可见问题
vim.cmd [[highlight IndentBlanklineChar guifg=#60728a gui=nocombine]]

--fix tree open first to right
vim.opt.splitright = true

require("toggleterm").setup({
  size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
	},
  open_mapping = [[<c-t>]],
})


require('gitsigns').setup({
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 3000,
    ignore_whitespace = false,
  },
})

--[[
require("project_nvim").setup {
  manual_mode = true,
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
--[[
require('Comment').setup {
  pre_hook = function(ctx)
    local U = require 'Comment.utils'

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require('ts_context_commentstring.utils').get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require('ts_context_commentstring.utils').get_visual_start_location()
    end

    return require('ts_context_commentstring.internal').calculate_commentstring {
      key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
      location = location,
    }
  end,
}
--]]

require("bufferline").setup{
  options = {
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
  }
}


require("indent_blankline").setup {
    show_end_of_line = false,
    space_char_blankline = " ",
}

require("nvim-autopairs").setup {}
require("nvim-lsp-installer").setup {
  automatic_installation = true
}


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local actions = require('telescope.actions')
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
  defaults = {
    layout_config = {
      width = 0.75,
      prompt_position = "top",
      preview_cutoff = 120,
      horizontal = {mirror = false},
      vertical = {mirror = false}
    },
    find_command = {
      'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
    },
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
      }
    }
  }
}
require('telescope').load_extension('fzf')
require('telescope.builtin').buffers({ sort_lastused = true, ignore_current_buffer = true })







local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        --require('snippy').expand_snippet(args.body) -- For `snippy` users.
        --vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
      end,
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      {name = 'nvim_lsp_signature_help'},
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
  }


vim.o.updatetime = 800
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = false,
})


require('nvim-treesitter.configs').setup({
  highlight = {
    enable=true
  },
  indent = {
    enable=true
  }
})


require('nightfox').setup({
  options = {
    styles = {
      comments = "italic",
    }
  },
  palettes = {
      nightfox = {
           bg1 = "#121820", -- Black background
           bg0 = "#121820", -- Alt backgrounds (floats, statusline, ...)
           bg3 = "#121820", -- 55% darkened from stock
      },
  },
})

vim.cmd("colorscheme nightfox")



require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
require("nvim-tree").setup({
update_cwd = true,
respect_buf_cwd = true,
update_focused_file = {
  enable = true,
  update_cwd = true
  },

hijack_directories = {
    enable = true,
    auto_open = true,
    },
view = {
    adaptive_size = false,
    side = "left",
    },
  filters = {
    dotfiles = false,
    exclude = {
      filetype = { "ts" },
    }
  },
renderer = {
    icons = {
        webdev_colors = true,
        show ={
            file =  false,
            folder = true,
            folder_arrow = true,
            git = false,
        }
    }

}
})



-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Navigate buffers
-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<leader>w", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-g>", ":Telescope live_grep<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')


EOF



