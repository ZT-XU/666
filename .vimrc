" 基本配置
"autocmd FileType tex setlocal spell spelllang=en_us,cjk
" 开启24bit颜色
" 配色主题
set termguicolors
colorscheme onedark
"colorscheme molokai
"colorscheme PaperColor
set background=dark
let g:solarized_termcolors=256
"基础配置
"设置字体"
"set guifont=Monaco:h13 
"隐藏顶部标签栏"
set cursorline      "突出显示当前行"
"set cursorcolumn        "突出显示当前列
set mouse=v     "启用鼠标"
set laststatus=2
set showtabline=0
set nocompatible
syntax on
set spell
"hi link cCommentUnderscore cComment
"syn match cCommentUnderscore display '\k\+_\w\+'
"syn cluster cCommentGroup add=cCommentUnderscore
filetype plugin indent on
set showmatch " 括号匹配
set hlsearch
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,GB2312,big5
set incsearch " 聪明查找
"set autoindent " 自动缩进
set smartindent  
set tabstop=4  
set shiftwidth=4  
set expandtab  
set softtabstop=4
set autowrite " 自动保存
set autochdir " 自动切换当前路径为文件所在目录
set smartindent
set scrolloff=5 " 光标移动到buffer的顶部和底部时保持4行距离
set nu
set tabstop=4
set softtabstop=4
set foldenable
set fdm=indent
" 隐藏滚动条"
set guioptions-=r
set guioptions-=L
set guioptions-=b
"隐藏顶部标签栏"
set showtabline=0
"设置键盘映射，通过空格设置折叠
"nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>
" 不要闪烁
set gcr=a:block-blinkon0
"浅色显示当前行
autocmd InsertLeave * se nocul
"用浅色高亮当前行
autocmd InsertEnter * se cul
" 解决插入模式下delete/backspce键失效问题
set backspace=2

" 保持代码在屏幕中间
" 为python的特殊配置
"let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99

" 插件目录
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" 文件树目录 --- nerdtree
Plug 'scrooloose/nerdtree'
" 状态栏 --- airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 代码检测，以及格式化
Plug 'w0rp/ale'
" 自动括号
Plug 'jiangmiao/auto-pairs'
" 彩色括号
Plug 'kien/rainbow_parentheses.vim'
" 代码格式化 --- vim-autoformat
Plug 'Chiel92/vim-autoformat'
" sublime多鼠标
Plug 'terryma/vim-multiple-cursors'
" 自动格式化工具，安装后在Normal模式输入:Autopep8或按F8就可以自动依照pep8的标准自动格式化代码。
Plug 'tell-k/vim-autopep8'
" indentLine是一款缩进指示线
Plug 'Yggdroot/indentLine'
" 注释
Plug 'scrooloose/nerdcommenter'
" 自动折叠
Plug 'tmhedberg/SimpylFold'
" Papercolor Theme
"Plug 'NLKNguyen/papercolor-theme'
" gdb调试
let g:SimpylFold_docstring_preview = 1
" Enable folding with the spacebar
nnoremap <space> za
"au BufWinLeave * silent mkview
"au BufWinEnter * silent loadview
call plug#end()


" ========================================================================
" 插件配置
" 文件树目录 --- nerdtree
"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25
" 状态配置 --- vim-airline-colorthemes
let g:airline_theme='simple'
" ========================================================================
" 代码格式化F6 --- vim-autoformat
nnoremap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
" ========================================================================
" 彩虹括号 ---- rainbow
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" ========================================================================
" sublime 鼠标插件
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<C-a>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<C-a>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
" ========================================================================
"缩进指示线" --- indentLine
let g:indentLine_char='┆'
let g:indentLine_enabled = 1
" ========================================================================
"autopep8设置"
let g:autopep8_disable_show_diff=1
" ========================================================================
" 命令窗口 --- nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
