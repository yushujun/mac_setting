" vim-plug install list
call plug#begin('~/.vim/autoload')
" Declare the list of plugins.
Plug 'tomasr/molokai' " molokai vim主题
Plug 'vim-airline/vim-airline' " airline状态栏美化
Plug 'vim-airline/vim-airline-themes' " 状态栏主题包
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " 加入NERDTree
Plug 'scrooloose/nerdcommenter' " 代码注释
Plug 'Valloric/YouCompleteMe' " 补全插件
Plug 'terryma/vim-multiple-cursors' " 多光标操作
Plug 'christoomey/vim-tmux-navigator' " tmux - vim中Ctrl + h, j, k, l光标冲突解决
Plug 'alvan/vim-closetag' " html自动补全
Plug 'jiangmiao/auto-pairs' " 符号自动补全
Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' } " mardown实时预览插件
Plug 'dense-analysis/ale' " 语法提示
Plug 'majutsushi/tagbar' " tagbar显示文件大纲
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } "异步搜索fzf基础依赖
Plug 'junegunn/fzf.vim' " 异步搜索fzf vim 插件
Plug 'posva/vim-vue' " vue语法提示
Plug 'wavded/vim-stylus' " stylus语法提示
Plug 'junegunn/vim-easy-align' " 文件对齐
Plug 'skywind3000/asyncrun.vim'  " vim异步执行命令
Plug 'davidhalter/jedi-vim', { 'for': 'python'} " python代码补全及跳转定义
Plug 'ludovicchabant/vim-gutentags' " tags管理
Plug 'ternjs/tern_for_vim' " js语法补全
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" 开启文件类型侦测
" 根据侦测到的不同类型加载对应的插件
filetype plugin indent on
" 开启语法识别
syntax enable
" 定义快捷键的前缀，即<leader>
let mapleader = "\<Space>"
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
" 开启/关闭taglist
nmap <F8> :TagbarToggle<CR>
" 修改窗口交换键
nnoremap <silent> <C-x> <c-w>x
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
" 设置删除空格数
set backspace=2

" 设置tags
set tags=./.tags;,.tags

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <leader>y "+y
nmap <leader>y "+y
" 剪切到系统粘贴板
vnoremap <leader>d "+dd
nmap <leader>d "+dd
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <leader>p "+p

" save files
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>
" quit discarding changes
nnoremap <C-q> :q<cr>
nnoremap <leader>Q :qa!<cr>

" 解决stty会与<C-s> <C-q>冲突
silent !stty -ixon > /dev/null 2>/dev/null

" 禁止Q进入EX模式
nnoremap Q <Nop>

" 配色方案
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
" 设置状态栏主题风格
let g:airline_theme = 'bubblegum'
let g:airline_powerline_fonts = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:gui_med_gray_hi = '#1c1c1c'

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
nnoremap <leader>u :bp<CR>
nnoremap <leader>o :bn<CR>
nnoremap <leader>x :bd<CR>
" 映射<leader > num到num buffer
nmap <leader>1 :b1<CR>
nmap <leader>2 :b2<CR>
nmap <leader>3 :b3<CR>
nmap <leader>4 :b4<CR>
nmap <leader>5 :b5<CR>
nmap <leader>6 :b6<CR>
nmap <leader>7 :b7<CR>
nmap <leader>8 :b8<CR>
nmap <leader>9 :b9<CR>

" python格式化
autocmd FileType python nnoremap <leader>= :0,$!yapf --style='{column_limit=120}'<CR>

"为不同的文件类型设置不同的空格数替换TAB
autocmd FileType java,javascript,html,css,xml set ts=2
autocmd FileType java,javascript,html,css,xml set shiftwidth=2
autocmd FileType java,javascript,html,css,xml set softtabstop=2

autocmd FileType python,shell,bash set ts=4
autocmd FileType python,shell,bash set shiftwidth=4
autocmd FileType python,shell,bash set softtabstop=4

" 对于markdown文件需要进行换行方便书写
autocmd FileType markdown set wrap

" fzf搜索文件设置
nmap <leader>s :GFiles<CR>
" fzf搜索内容设置
nmap <leader>g :Ag<Space>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>a <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>a <Plug>(EasyAlign)

" NERDTree config
nmap <leader>f :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() == "primary") | q | endif

" 默认开启NERDTree
"autocmd vimenter * NERDTree

" 隐藏不需要显示的文件，如pyc
let NERDTreeIgnore=['\.pyc$']


" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'vuejs': ['eslint']
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'html': ['tidy-html5'],
\   'vuejs': ['eslint', 'vls']
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" 保存时候在进行语法提示
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1

" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims = 1

" markdown peview settings
let g:mkdp_auto_start = 0

" 用于解决vim-closetag和delimitMate在写html导致<html></html>>多一个>的情况
let g:closetag_filenames="*.xml,*.html,*.xhtml,*.phtml,*.php,*.vue,*.js"
auto FileType xml,html,php,xhtml,js let b:delimitMate_matchpairs="(:),[:],{:}"
" 解决空格键和leader键冲突
let g:AutoPairsMapSpace=0

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.git', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
 endif
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazSl', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--python-kinds=-iv']
let g:gutentags_ctags_exclude = ['node_modules']

" nerdcommenter vue文件注释
let g:SynDebug = 0
nmap <leader>cd :call ToggleDebug()<CR>
xmap <leader>c$ :call Comment('ToEOL', 'x')<cr>
nmap <leader>c$ :call Comment('ToEOL', 'n')<cr>
xmap <leader>cA :call Comment('Append', 'x')<cr>
nmap <leader>cA :call Comment('Append', 'n')<cr>
xmap <leader>cs :call Comment('Sexy', 'x')<cr>
nmap <leader>cs :call Comment('Sexy', 'n')<cr>
xmap <leader>ci :call Comment('Invert', 'x')<cr>
nmap <leader>ci :call Comment('Invert', 'n')<cr>
xmap <leader>cm :call Comment('Minimal', 'x')<cr>
nmap <leader>cm :call Comment('Minimal', 'n')<cr>
xmap <leader>c<space> :call Comment('Toggle', 'x')<cr>
nmap <leader>c<space> :call Comment('Toggle', 'n')<cr>
xmap <leader>cl :call Comment('AlignLeft', 'x')<cr>
nmap <leader>cl :call Comment('AlignLeft', 'n')<cr>
xmap <leader>cb :call Comment('AlignBoth', 'x')<cr>
nmap <leader>cb :call Comment('AlignBoth', 'n')<cr>
xmap <leader>cc :call Comment('Comment', 'x')<cr>
nmap <leader>cc :call Comment('Comment', 'n')<cr>
xmap <leader>cn :call Comment('Nested', 'x')<cr>
nmap <leader>cn :call Comment('Nested', 'n')<cr>
xmap <leader>cu :call Comment('Uncomment', 'x')<cr>
nmap <leader>cu :call Comment('Uncomment', 'n')<cr>
xmap <leader>cy :call Comment('Yank', 'x')<cr>
nmap <leader>cy :call Comment('Yank', 'n')<cr>
let g:NERDCreateDefaultMappings=0
let g:NERDSpaceDelims=1
let g:NERDCustomDelimiters = {'pug': { 'left': '//-', 'leftAlt': '//' }}
function! ToggleDebug()
  let g:SynDebug = !g:SynDebug
  echo 'Syntax Debug Mode: '.g:SynDebug
endfunction
function! Comment(...) range
  let mode = a:0
  let type = a:1
  let ft = &ft
  let stack = synstack(line('.'), col('.'))
  if g:SynDebug
    echo ft
    echo map(stack, 'synIDattr(v:val, "name")')
  endif
  if ft == 'vue'
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        let syn = tolower(syn)
        if g:SynDebug
          echo syn
        endif
        exe 'setf '.syn
      endif
    endif
  endif
  if type == 'AltDelims'
    exe "normal \<plug>NERDCommenterAltDelims"
  elseif type == 'Insert'
    call NERDComment('i', "insert")
  else
    exe 'silent '.a:firstline.','.a:lastline.'call NERDComment(mode, type)'
  endif
  if g:SynDebug
    echo &ft
  endif
  exe "setf ".ft
endfunction

" ycm close preview
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_server_python_interpreter='/usr/bin/python2.7'
let g:ycm_python_interpreter_path = '/usr/local/bin/python3'
let g:ycm_python_sys_path = ['/usr/local/lib/python3.7/site-packages']
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf='~/.vim/autoload/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

" vim-vue stop check preprocessor
let g:vue_disable_pre_processors = 1
" reslove vim-vue highlight randomly not work
autocmd FileType vue syntax sync fromstart

" jedi configuration
let g:jedi#goto_command = "<C-]>"
let g:jedi#usages_command = "<leader>n"
let g:jedi#goto_stubs_command = ""
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = ""
let g:jedi#completions_command = ""
let g:jedi#rename_command = ""
let g:jedi#completions_enabled = 0

" vim async run rs window
let g:asyncrun_open = 8

" <F5>或leader r 运行shell、python、javascript、c等程序
nmap <leader>r :call CompileRunFileAsync()<CR>
func! CompileRunFileAsync()
  exec 'w'
  if &filetype == 'c'
    exec "AsyncRun! gcc % -o % && ./%<"
  elseif &filetype == 'cpp'
    exec "AsyncRun! g++ % -o % && ./%<"
  elseif &filetype == 'python'
    exec "AsyncRun! python3.7 %"
  elseif &filetype == 'javascript'
    exec "AsyncRun! node %"
  elseif &filetype == 'sh'
    exec "AsyncRun! bash %"
  endif
endfunc

map <F5> :call CompileRunFileSync()<CR>
func! CompileRunFileSync()
  exec 'w'
  if &filetype == 'c'
    exec '!clear && gcc % -o %< && ./%<'
  elseif &filetype == 'cpp'
    exec '!clear && g++ % -o %< && ./%<'
  elseif &filetype == 'python'
    exec '!clear && python3.7 %'
  elseif &filetype == 'javascript'
    exec '!clear && node %'
  elseif &filetype == 'sh'
    exec '!clear && bash %'
  endif
endfunc

" abbreviation
iabbrev pdb import pdb;pdb.set_trace()

