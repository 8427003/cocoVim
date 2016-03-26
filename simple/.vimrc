"快捷键映射
let mapleader = "\<Space>"

" ------------------------------------------------------------------
" 字体设置
" ------------------------------------------------------------------
" set default guifont
if has('gui_running')
    augroup ex_gui_font
        " check and determine the gui font after GUIEnter.
        " NOTE: getfontname function only works after GUIEnter.
        au!
        au GUIEnter * call s:set_gui_font()
    augroup END

    " set guifont
    function! s:set_gui_font()
        if getfontname( 'DejaVu Sans Mono for Powerline' ) != ''
            set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h15
        elseif getfontname( 'DejaVu Sans Mono' ) != ''
            set guifont=DejaVu\ Sans\ Mono:h15
        endif
    endfunction
endif

" ------------------------------------------------------------------
" 显示设置
" ------------------------------------------------------------------
set nu " show line number
set guioptions-=L "隐藏左侧滚动条


" ------------------------------------------------------------------
" 编码设置
" ------------------------------------------------------------------
let &termencoding=&encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,big5


" ------------------------------------------------------------------
" tab 缩进设置
" ------------------------------------------------------------------
set cindent shiftwidth=4 " set cindent on to autoinent when editing c/c++ file, with 4 shift width
set tabstop=4 " set tabstop to 4 characters
set softtabstop=4
set expandtab " set expandtab on, the tab will be change to space automaticaly
set ve=block " in visual block mode, cursor can be positioned where there is no actual character

set backspace=indent,eol,start


















" ------------------------------------------------------------------
" vundle 插件区域 head
" ------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" ---------------------------------------------------
"vim-airline
Plugin 'bling/vim-airline'
if has('gui_running')
 let g:airline_powerline_fonts = 1
else
 let g:airline_powerline_fonts = 0
endif

let g:airline#extensions#tabline#enabled = 0 " NOTE: When you open lots of buffers and typing text, it is so slow.
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" " let g:airline_section_b = "%{fnamemodify(bufname('%'),':p:.:h').'/'}"
" " let g:airline_section_c = '%t'
" " let g:airline_section_warning = airline#section#create(['whitespace']) " NOTE: airline#section#create has no effect in .vimrc initialize pahse
" " let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#whitespace#check(),0)}'
 let g:airline_section_warning = ''
set laststatus=2 " always have status-line


 " ---------------------------------------------------
 " ctrlp: invoke by <ctrl-p>
 Plugin 'kien/ctrlp.vim'
 let g:ctrlp_working_path_mode = ''
 let g:ctrlp_match_window = 'bottom,order:ttb,min:30,max:30,results:30'
 let g:ctrlp_follow_symlinks = 2
 let g:ctrlp_max_files = 0 " Unset cap of 10,000 files so we find everything
 let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
 nnoremap <unique> <leader>bs :CtrlPBuffer<CR>
 let g:ctrlp_regexp = 1


 " ---------------------------------------------------
 " nerdtree: invoke by :NERDTreeToggle
 Plugin 'scrooloose/nerdtree'
 let g:NERDTreeWinSize = 30
 let g:NERDTreeMouseMode = 1
 let g:NERDTreeMapToggleZoom = '<Space>'
 let g:NERDTreeMinimalUI=1 "不显示帮助面板
 let g:NERDTreeDirArrows=1 "目录箭头 1 显示箭头  0传统+-|号
 "autocmd vimenter * NERDTree "自动以当前目录打开tree
 nmap nf :NERDTreeFind<CR>"锁定文件对应目录树位置
 nmap <F3> :NERDTreeToggle<CR>


" ---------------------------------------------------
" vim-easymotion: invoke by <leader><leader> w,b,e,ge,f,F,h,i,j,k,/
Plugin 'Lokaltog/vim-easymotion'
map ff <Plug>(easymotion-sn)
map <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" ---------------------------------------------------
" undotree: invoke by <Leader>u
Plugin 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1
let g:undotree_WindowLayout = 4

" NOTE: this will prevent undotree closed then jump to minibufexpl
function! g:CloseUndotree()
    call UndotreeHide()
    call ex#window#goto_edit_window()
endfunction

function g:Undotree_CustomMap()
    if has('gui_running')
        nnoremap <silent> <script> <buffer> <ESC> :call g:CloseUndotree()<CR>
    else
        nnoremap <silent> <script> <buffer> <leader><ESC> :call g:CloseUndotree()<CR>
    endif
endfunction

" ---------------------------------------------------
Plugin 'Yggdroot/indentLine'
let g:indentLine_leadingSpaceChar = '.'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_char = '┆'

" ---------------------------------------------------
Plugin 'Valloric/YouCompleteMe'


" ---------------------------------------------------
Plugin 'othree/xml.vim' "html closeTag is ok

" ---------------------------------------------------
Plugin 'Raimondi/delimitMate' "() {} 括号匹配 is ok
let delimitMate_expand_cr = 1 "let -R indent
au FileType mail let b:delimitMate_expand_cr = 1
"inoremap <expr> <Tab> <C-Tab>

" ---------------------------------------------------
" vim-javascript 代码高亮
Plugin 'pangloss/vim-javascript'


 " ---------------------------------------------------
 " ex-showmarks: invoke by m... or <leader>mm, <leader>ma
 Plugin 'exvim/ex-showmarks'
 " TODO: bootleq/ShowMarks on github is well organized in code, but have lots
 " bugs, consider merge his code and fixes the bugs
 let g:showmarks_enable = 1
 let g:showmarks_include = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
 let g:showmarks_ignore_type = 'hqm'

 " Hilight lower & upper marks
 let g:showmarks_hlline_lower = 1
 let g:showmarks_hlline_upper = 0

 " ---------------------------------------------------
 Plugin 'terryma/vim-expand-region'
 vmap v <Plug>(expand_region_expand)
 vmap <C-v> <Plug>(expand_region_shrink)


" ---------------------------------------------------
Plugin 'ntpeters/vim-better-whitespace'
nnoremap <unique> <leader>w :StripWhitespace<CR>


" ---------------------------------------------------
Plugin 'roman/golden-ratio'

" ---------------------------------------------------
Plugin 'heavenshell/vim-jsdoc' " 函数注释
nmap <silent> tt <Plug>(jsdoc)

" ---------------------------------------------------
Plugin 'vim-scripts/nerdtree-ack'

" ---------------------------------------------------
Plugin 'mileszs/ack.vim'


" ---------------------------------------------------
" ex-colorschemes
Plugin '8427003/vim-colorschemes'




" ---------------------------------------------------
"系统粘贴版
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" define the copy/paste judged by clipboard
if &clipboard ==# 'unnamed'
    " fix the visual paste bug in vim
    " vnoremap <silent>p :call g:()<CR>
else
    " general copy/paste.
    " NOTE: y,p,P could be mapped by other key-mapping
    map <leader>y "*y
    map <leader>p "*p
    map <leader>P "*P
endif

" copy folder path to clipboard, foo/bar/foobar.c => foo/bar/
nnoremap <silent> <leader>y1 :let @*=fnamemodify(bufname('%'),":p:h")<CR>

" copy file name to clipboard, foo/bar/foobar.c => foobar.c
nnoremap <silent> <leader>y2 :let @*=fnamemodify(bufname('%'),":p:t")<CR>

" copy full path to clipboard, foo/bar/foobar.c => foo/bar/foobar.c
nnoremap <silent> <leader>y3 :let @*=fnamemodify(bufname('%'),":p")<CR>



" ---------------------------------------------------
"自动跳转到粘贴文本的最后
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" ---------------------------------------------------
"我经常复制一段内容，在 visual 模式下选中一段文本并粘贴来实现替换，
"此时“剪贴板”中的内容会被替换成被删掉的文本，如果想粘贴第二次就很不方便了。
"这个映射解决了这个问题。
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()




" ---------------------------------------------------
call vundle#end()            " required
filetype plugin indent on    " required
" ------------------------------------------------------------------
" vundle 插件区域 结束
" ------------------------------------------------------------------




" ------------------------------------------------------------------
" 颜色主题设置
" ------------------------------------------------------------------
colorscheme molokai


" ------------------------------------------------------------------
" 其它设置
" ------------------------------------------------------------------
:set wildmode=list ":tabe 能显示目录树
:set linespace=2 "行间距
:set autochdir "自动设当前编辑的文件所在目录为当前工作路径

vnoremap <leader>w <c-w>w
nnoremap <leader>w <c-w>w
