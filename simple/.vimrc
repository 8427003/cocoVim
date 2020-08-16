"快捷键映射
let mapleader = "\<Space>"

" ------------------------------------------------------------------
" 显示设置
" ------------------------------------------------------------------
set nu! " show line number


" ------------------------------------------------------------------
" 编码设置
" ------------------------------------------------------------------
let &termencoding=&encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,big5


" ------------------------------------------------------------------
" tab 缩进设置
" ------------------------------------------------------------------
set cindent shiftwidth=2 " set cindent on to autoinent when editing c/c++ file, with 4 shift width
set tabstop=2 " set tabstop to 4 characters
set softtabstop=2
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
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 0
"let g:airline_theme='monochrome'
let g:airline_theme='hybrid'
let g:airline_section_z = '%l:%c'
let g:airline_section_warning=''
let g:airline_section_x=''
set laststatus=2 " always have status-line

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#formatter = 'short_path'

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>w :bdelete<cr>


"------------------------------------------------------
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'


 " ---------------------------------------------------
 " ctrlp: invoke by <ctrl-p>
 Plugin 'ctrlpvim/ctrlp.vim'
 let g:ctrlp_match_window = 'bottom,order:ttb,min:30,max:30,results:30'
 let g:ctrlp_follow_symlinks = 2
 let g:ctrlp_max_files = 0 " Unset cap of 10,000 files so we find everything
 let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
 let g:ctrlp_regexp = 1
 let g:ctrlp_working_path_mode = 'rc'

 " ignore
 set wildignore+=*/tmp/*,*/node_modules/*,*\\bower_components\\*,*.so,*.swp,*.zip     " MacOSX/Linux
 set wildignore+=*\\tmp\\*,*\\node_modules\\*,*\\bower_components\\*,*.swp,*.zip,*.exe  " Windows
 let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|project_files$\|test$|\public$\',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

 nmap <CR> :CtrlPBuffer<CR>


 " ---------------------------------------------------
 " nerdtree: invoke by :NERDTreeToggle
 Plugin 'scrooloose/nerdtree'
 let g:NERDTreeWinSize = 30
 let g:NERDTreeWinSizeMax=30
 let g:NERDTreeMouseMode = 1
 let g:NERDTreeMapToggleZoom = '<Space>'
 let g:NERDTreeMinimalUI=1 "不显示帮助面板
 let g:NERDTreeDirArrows=1 "目录箭头 1 显示箭头  0传统+-|号
 let g:NERDTreeShowHidden=1 "显示隐藏文件
 let g:NERDTreeWinPos = "left"
 let g:NERDTreeAutoDeleteBuffer=1
 let g:NERDTreeQuitOnOpen=1 "打开后关闭tree

 "autocmd BufWinEnter * NERDTreeFind

"autocmd vimenter * NERDTree "自动以当前目录打开tree
 nmap nf :NERDTreeFind<CR>"锁定文件对应目录树位置
 nmap <F3> :NERDTreeToggle<CR>
 nmap <c-[><c-[> :NERDTreeToggle<CR>


 " --------------------------------------------------
 " 智能注释代码，会根据代码的类型自动选择注释类型 leader + //
 Plugin 'scrooloose/nerdcommenter'
 vnoremap <leader>// :call NERDComment(0,"toggle")<CR>
 nnoremap <leader>// :call NERDComment(0,"toggle")<CR>


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
" 缩进显示规则
Plugin 'Yggdroot/indentLine'
let g:indentLine_leadingSpaceChar = '.'
"let g:indentLine_leadingSpaceEnabled = 1 "此项打开会引起jsx里的html缩进问题
"let g:indentLine_char = ''
"let g:indentLine_char = ' '
"let g:indentLine_first_char = ''
"let g:indentLine_showFirstIndentLevel = 1

" ---------------------------------------------------
Plugin 'Valloric/YouCompleteMe'
" must complier in .vim/YouCompleteMe
let g:ycm_key_list_select_completion = ['<c-j>', '<Down>','<Tab>']
let g:ycm_key_list_previous_completion = ['<Up>','<c-k>']
let g:ycm_disable_for_files_larger_than_kb = 1024

" add css complete
let g:ycm_semantic_triggers = {
   \   'css': [ 're!^\s{4}', 're!:\s+' ],
   \ }

set completeopt-=preview


" -------------------------------------------------
"  自动补全，由于youcompolteMe依赖tern已经内置，所以不需要额外安装。但是配置是需要的
"  只能是出现的关键字。tern可以提示api，比如window.getElemenById
"  使用方法参考https://wxnacy.com/2017/09/22/vim-plugin-tern/
"  Plugin 'marijnh/tern_for_vim'
"  and add ~/.tern_project
"  配置参考https://medium.com/vim-drops/javascript-autocompletion-on-vim-4fea7f6934e2
 "{
  "libs": [
    "browser",
    "ecmascript",
    "jquery",
    "react",
    "underscore"
  "],
  "plugins": {
    "node": {},
    "esmodules": {}
  "}
"}




" ---------------------------------------------------
Plugin 'Raimondi/delimitMate' "() {} 括号匹配 is ok
let delimitMate_expand_cr = 1 "let -R indent
inoremap <expr> <Tab> <C-Tab>



 " ---------------------------------------------------
 Plugin 'terryma/vim-expand-region'
 vmap v <Plug>(expand_region_expand)
 vmap <C-v> <Plug>(expand_region_shrink)


" ---------------------------------------------------
Plugin 'ntpeters/vim-better-whitespace'


" ---------------------------------------------------
"Plugin 'roman/golden-ratio'

" ---------------------------------------------------
Plugin 'heavenshell/vim-jsdoc' " 函数注释
nmap <silent> tt <Plug>(jsdoc)
"required
"cd to <vim-jsdoc path>
"make install



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


" ========================主题颜色 start=========================
"template
Plugin '8427003/vim-template'

" ex-colorschemes
Plugin 'tomasr/molokai'
let g:rehash256 = 1

" ex-colorschemes
Plugin 'w0ng/vim-hybrid'

""==============================主题颜色 end===================


"====================================语言相关处理 start==========================================
"
" 语法高亮，所有语言，经测试不靠谱，所以去掉, 还是每种语言引入单独的
"Plugin 'sheerun/vim-polyglot'

" ---------------------------------------------------
Plugin 'othree/xml.vim' "html closeTag is ok

" ---------------------------------------------------
" 默认的json显示会把引号去除，这个插件会加上
"Plugin 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

" ---------------------------------------------------
" vim-javascript 代码高亮
Plugin 'pangloss/vim-javascript'

"ts 语法不然会出现缩进错误--------------------------------------------------
Plugin 'leafgarland/typescript-vim'

"tsx不然xml标签无法缩进
Plugin 'peitalin/vim-jsx-typescript'
"set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx



"
"---------------------------ts语法报错提示-------------------
"错误时详细提示底部多行，不过youcompleMe 或dense-analysis/ale 已支持简单（底部单行)提示
"Plugin 'Quramy/tsuquyomi'

"项目文里.eslintrc.js这种提示,
"不过youcompleMe已经支持ts的报错，但是像末尾是否应该加分号这种youcompleteme不支持，所以可以关闭
"Plugin 'dense-analysis/ale'
"====================================语言相关处理 end==========================================


" --------------------------------------------------
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
" 搜索
" ------------------------------------------------------------------
set showmatch " show matching paren
set incsearch " do incremental searching
set hlsearch " highlight search terms
set ignorecase " set search/replace pattern to ignore case
set smartcase " set smartcase mode on, If there is upper case character in the search patern, the 'ignorecase' option will be override.


" ------------------------------------------------------------------
" 备份
" ------------------------------------------------------------------
" 禁止保存临时文件
set nobackup
set nowritebackup

"取消交换文件
set noswapfile

" ------------------------------------------------------------------
" 其它设置
" ------------------------------------------------------------------
:set wildmode=list ":tabe 能显示目录树
:set linespace=2 "行间距

"自动设置进入的目录为当前目录
"autocmd BufEnter * silent! lcd %:p:h
"autocmd vimenter * silent! lcd %:p:h



syntax on "语法高亮


" 小程序文件类型
au BufRead,BufNewFile *.wxss set ft=css syntax=css
au BufRead,BufNewFile *.wxml set ft=xml syntax=xml



" 高亮显示当前的行和列
set cursorline


" ------------------------------------------------------------------
" Automatically set paste mode in Vim when pasting in insert mode
" ------------------------------------------------------------------
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
"
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction




" ------------------------------------------------------------------
" undo 持久化
" ------------------------------------------------------------------
if has('persistent_undo')      "check if your vim version supports it
  set undofile
  set undodir=~/.vim/undodir  "directory where the undo files will be stored
endif 



" ------------------------------------------------------------------
" 重新打开文件后，光标在先前的位置 ---start
" ------------------------------------------------------------------
set viminfo='10,\"100,:20,%,n~/.viminfo 
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 

" ------------------------------------------------------------------
" 主题配色
" ------------------------------------------------------------------
let g:molokai_original = 1
"colorscheme molokai
"colorscheme dracula

set background=dark

let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
colorscheme hybrid
"colorscheme gruvbox


" ------------------------------------------------------------------
" 自定义颜色一定要在主题配色之后，有个优选级覆盖问题---start
" ------------------------------------------------------------------
"取消行号背景色
hi LineNr ctermbg=none guifg=#BCBCBC guibg=#232526
"visual 背景效果加强
hi Visual ctermbg=240 guibg=#808080

" mark 背景色
hi ShowMarksHLl ctermfg=161 ctermbg=235 cterm=bold guifg=red guibg=#232526
hi ShowMarksHLu ctermfg=161 ctermbg=235 cterm=bold guifg=red guibg=#232526
hi ShowMarksHLo ctermfg=161 ctermbg=235 cterm=bold guifg=red guibg=#232526
hi ShowMarksHLm ctermfg=161 ctermbg=235 cterm=bold guifg=red guibg=#232526

" 自定义颜色一定要在主题配色之后，有个优选级覆盖问题---end
" ------------------------------------------------------------------




" ------------------------------------------------------------------
" 键位映射
" ------------------------------------------------------------------

" 切换窗口
"ctrl+w -> leader + w
"vnoremap <leader>w <c-w>w
"nnoremap <leader>w <c-w>w


" ------------------------------------------------------------------
" 开启语法高亮后，速度特别慢
" http://superuser.com/questions/302186/vim-scrolls-very-slowly-when-a-line-is-too-long
" http://stackoverflow.com/questions/4775605/vim-syntax-highlight-improve-performance
" ------------------------------------------------------------------
set synmaxcol=200 "太小了会有缩进问题
set ttyfast " u got a fast terminal
" set ttyscroll=3
set lazyredraw

set nocursorcolumn
set cursorline!
set norelativenumber
syntax sync minlines=256


" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
set wildmode=longest:list,full

" ------------------------------------------------------------------
" 脚本选择，比如在fish脚本中安装插件，vundle就会报错
" ------------------------------------------------------------------
set shell=/bin/bash "must be the shell, or the vundle run error
"
"how-to-temporarily-exit-vim-and-go-back
"https://stackoverflow.com/questions/1879219/how-to-temporarily-exit-vim-and-go-back?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa

"set shell=/bin/zsh "commond :sh can change to zsh

