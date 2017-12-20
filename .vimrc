" vundle 环境设置
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle  # begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " 插件管理
Plugin 'tomasr/molokai' " molokai vim主题
Plugin 'vim-airline/vim-airline' " airline状态栏美化
Plugin 'vim-airline/vim-airline-themes' " 状态栏主题包
Plugin 'nathanaelkane/vim-indent-guides' " 代码块竖线
Plugin 'scrooloose/nerdtree' " 加入NERDTree
Plugin 'scrooloose/nerdcommenter' " 代码注释
Plugin 'dyng/ctrlsf.vim' " 搜索功能
Plugin 'SirVer/ultisnips' " 预定义模板
Plugin 'honza/vim-snippets' " 模板库
Plugin 'Valloric/YouCompleteMe' " 补全插件
Plugin 'terryma/vim-multiple-cursors' " 多光标操作
Plugin 'christoomey/vim-tmux-navigator' " tmux - vim中Ctrl + h, j, k, l光标冲突解决
Plugin 'tpope/vim-fugitive' " 显示git branch
Plugin 'alvan/vim-closetag' " html自动补全
Plugin 'Raimondi/delimitMate' " 符号自动补全
Plugin 'godlygeek/tabular' " 按符号自动对齐如: Tab \= , : Tab \|
Plugin 'iamcco/mathjax-support-for-mkdp' " mardown实时预览辅助插件
Plugin 'iamcco/markdown-preview.vim' " mardown实时预览插件
Plugin 'kien/ctrlp.vim' " CtrlP文件搜索
"Plugin 'marijnh/tern_for_vim' " js语法支持
Plugin 'w0rp/ale' " 语法提示
" 插件列表结束
call vundle#end()

" 开启文件类型侦测
" 根据侦测到的不同类型加载对应的插件
filetype plugin indent on

" 定义快捷键的前缀，即<leader>
let mapleader = ";"
" 映射esc为jk
inoremap jk <esc>

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" F2切换开启或者关闭行号
nnoremap <F2> :set number!<CR>
" F3切换开启列高亮显示
nnoremap <F3> :set cursorcolumn!<CR>
" F4格式化json字符串
map <F4> :%!python -m json.tool<CR>
" 开启/关闭格式化粘贴
set pastetoggle=<F9>

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" 设置查看历史条数
set history=200

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <leader>Q :qa!<CR>


" 配色方案
let g:molokai_original=1
let g:rehash256=1
syntax enable
colorscheme molokai
" 设置状态栏主题风格
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
" set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 禁止折行
set nowrap

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=2
" 设置格式化时制表符占用空格数
set shiftwidth=2
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=2
" 自动缩进代码
set autoindent
" 开启智能对齐
set smartindent
" 缩进代码量
set shiftwidth=2

" 映射切换buffer的键位
nnoremap <leader>g :bp<CR>
nnoremap <leader>h :bn<CR>
nnoremap <leader>x :bd<CR>
" 映射<leader > num到num buffer
map <leader>1 :b1<CR>
map <leader>2 :b2<CR>
map <leader>3 :b3<CR>
map <leader>4 :b4<CR>
map <leader>5 :b5<CR>
map <leader>6 :b6<CR>
map <leader>7 :b7<CR>
map <leader>8 :b8<CR>
map <leader>9 :b9<CR>
set laststatus=2

" python格式化
autocmd FileType python nnoremap <leader>= :0,$!yapf<CR>

" CtrlSF搜索
" 默认程序为ACK而不是AG
let g:ctrlsf_ackprg='ack'
" 修改ctrlsf快捷键
nnoremap <leader>p :CtrlSF<Space>
" ctrlsf搜索忽略目录
let g:ctrlsf_ignore_dir=["node_modules", "static"]

" CtrlP文件搜索
let g:ctrlp_custom_ignore='\v[\/](node_modules|static|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_map='<leader>s'
"let g: ctrlp_match_window = 'min:4,max:10,results:100'


" NERDTree config
    map <leader>f :NERDTreeToggle<CR>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() == "primary") | q | endif

" 默认开启NERDTree
"autocmd vimenter * NERDTree

" 隐藏不需要显示的文件，如pyc
let NERDTreeIgnore=['\.pyc$']

"为不同的文件类型设置不同的空格数替换TAB
autocmd FileType java,javascript,html,css,xml set ts=2
autocmd FileType java,javascript,html,css,xml set shiftwidth=2
autocmd FileType java,javascript,html,css,xml set softtabstop=2

autocmd FileType python,shell,bash set ts=4
autocmd FileType python,shell,bash set shiftwidth=4
autocmd FileType python,shell,bash set softtabstop=4

" 对于markdown文件需要进行换行方便书写
autocmd FileType markdown set wrap

" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'html': ['tidy-html5'],
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

set backspace=2

" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1

" markdown peview settings
let g:mkdp_auto_start = 1

