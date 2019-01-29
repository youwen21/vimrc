set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'shawncplus/phpcomplete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'scrooloose/nerdcommenter'
  
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
  
" Optional:
Plugin 'honza/vim-snippets'
  
  
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'vim-scripts/cscope.vim'
Plugin 'vim-scripts/taglist.vim'


" Plugin 'vim-scripts/AutoComplPop'  

" Bundle 'Valloric/YouCompleteMe'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

  
syntax on " 自动语法高亮
set number " 显示行号
set cursorline " 突出显示当前行
" set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set tabstop=4 expandtab " 设定 tab 长度为 4 个空格
set nobackup " 覆盖文件时不备份
" set autochdir " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes " 设置备份时的行为为覆盖
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan " 禁止在搜索到文件两端时重新搜索
" set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set magic " 设置魔术
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ " 设置在状态行显示的信息
set errorformat=%m\ in\ %f\ on\ line\ %l
set autoindent 
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
  
colorscheme molokai
set t_Co=256

set isfname+=32
set path=/opt/php-src/,/opt/php-src/main/
" Add the current file's directory to the path if not already present.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path+=".s:tempPath

"set paste
set pastetoggle=<F3>


"-----------------------------------------------------------------
" 获取当前系统类型
"------------------------------------------------------------------
function! MySys()
  if has("win16") || has("win32") || has("win64") || has("win95")
    return "windows"
  elseif has("unix")
    return "linux"
  endif
endfunction
  
" 用户目录变量$VIMFILES
if MySys() == "windows"
  let $VIMFILES = $VIM.'/vimfiles'
  set backupdir=D://Vim/tmp
elseif MySys() == "linux"
  let $VIMFILES = $HOME.'/.vim'
  set backupdir=/tmp
endif
  
" 设置字体 以及中文支持
if has("win32")
  set guifont=Inconsolata:h14:cANSI
endif
  
" 配置多语言环境
if has("multi_byte")
  " UTF-8 编码
  set encoding=utf-8
  set termencoding=utf-8
  set formatoptions+=mM
  set fencs=utf-8,gbk
  
  if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
  endif
  
  if has("win32")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
  endif
else
  echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif
  
" 光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
  
"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>1 :set filetype=xhtml<CR>
nnoremap <leader>2 :set filetype=css<CR>
nnoremap <leader>3 :set filetype=javascript<CR>
nnoremap <leader>4 :set filetype=php<CR>
  
"-----------------------------------------------------------------
" 折叠配置
"
" manual 手工定义折叠
" indent 更多的缩进表示更高级别的折叠
" expr 用表达式来定义折叠
" syntax 用语法高亮来定义折叠
" diff 对没有更改的文本进行折叠
" marker 对文中的标志折叠
"------------------------------------------------------------------
set foldenable
set foldmethod=manual
set foldlevel=100 " 启动vim时不要自动折叠代码
set foldcolumn=0 " 设置折叠栏宽度
  
  
" Python 文件的一般设置，比如不要 tab 等
" autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
" autocmd FileType python map <F12> :!python %<CR>
  
" 设置数据字典 ~/.vim/dict/文件的路径
set complete-=k complete+=k
" autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict
" autocmd filetype css set dictionary=$VIMFILES/dict/css.dict
au FileType php setlocal dict+=$VIMFILES/dict/php.dict
  
  
"-----------------------------------------------------------------
" plugin - winManager 配置 (弃用，很多小bug)
"-----------------------------------------------------------------
" let g:winManagerWindowLayout="NERDTree,TagList"
" let g:winManagerWidth = 35
" let g:NERDTree_title="[NERDTree]"
" 
" nmap <silent> <C-m> :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR>
" " nmap <C-m> :WMToggle<CR>
" 
" function! NERDTree_Start()
" exec 'NERDTree'
" endfunction
" 
" function! NERDTree_IsValid() 
" return 1
" endfunction
  
  
"-----------------------------------------------------------------
" plugin - doxygen toolkit 配置
"-----------------------------------------------------------------
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@return "
  
let g:DoxygenToolkit_authorName="jiangyh <jiangyahui@360.cn>"
let g:DoxygenToolkit_briefTag_funcName="no"
let g:doxygen_enhanced_color=1
  
map fg : Dox<cr>
map ffg : DoxAuthor<cr>
  
  
"-----------------------------------------------------------------
" plugin - NERDTree 配置
"-----------------------------------------------------------------
let NERDTreeWinPos="left"
let NERDTreeWinSize=30
" let NERDTreeChDirMode=1 " 改变tree目录的同时改变工程的目录
  
nnoremap <silent><F6> :NERDTreeToggle<CR>
  
"-----------------------------------------------------------------
" plugin - ctags程序
"-----------------------------------------------------------------
if MySys() == "windows"
  let Tlist_Ctags_Cmd = '"'.$VIMRUNTIME.'/ctags.exe"'
elseif MySys() == "linux"
  let Tlist_Ctags_Cmd = '/usr/local//bin/ctags'
endif
  
set tags+=~/acl/tags;
set tags+=/opt/php-src/tags;
nnoremap <silent><F8> :!ctags -R --exclude=*.js --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
  
  
"-----------------------------------------------------------------
" plugin - taglist.vim 
"-----------------------------------------------------------------
let Tlist_Show_One_File = 1 " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1 " 在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1 " 自动折叠当前非编辑文件的方法列表
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Compact_Format = 1
" let Tlist_Display_Prototype = 0
  
nnoremap <silent><F7> :TlistToggle<CR>
  
  
"-----------------------------------------------------------------
" plugin - cscope设置
"-----------------------------------------------------------------
set cscopequickfix=s-,c-,d-,i-,t-,e-  
if has("cscope")  
  set csprg=/usr/bin/cscope  
  set csto=1  
  set cst  
  set nocsverb  
  
  " add any database in current directory   
  " if filereadable("cscope.out")  
  " cs add cscope.out  
  " endif 
  " set csverb  
  " endif 
      
  nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
  
  
"-----------------------------------------------------------------
" plugin - project.vim 组织项目列表
" \C 递归读取子目录 \c 读取当前文件
" \l (列出所有当前层文件)\L(递归),按任何键停止
" \w (关闭当前层文件)\W(递归)
" \g (在项目当前层文件搜索)\G(递归)
" \r 关闭子文件夹并刷新当前文件夹下文件，\R递归打开文件夹并刷新所有文件
" \s 关闭文件夹并创建，\S递归打开文件夹并创建
" \s 将文件在水平打开多个窗口显示，打开或关闭文件夹列表
" \o 将文件在一个窗口打开，打开或关闭文件夹列表
" \v 在右窗口显示指针停留在project窗口的文件内容
" \i 显示文件或文件夹的设置参数，如filter="*"
" \I 显示文件或文件夹的决对路径和参数
" \1 - \9，\f1-\f9，\F1-\F9执行指定命令，\0查询1-9命令，\f0查询f1-f9，F1-F9命令
" <space>空格扩大project窗口的宽度，恢复宽度
"-----------------------------------------------------------------
" let proj_window_width=24
" let proj_window_increment=12
" let loaded_project = 1 " 停用插架
" let proj_flags="imstcg" " 自动隐藏project列表
" nnoremap <silent><F5> :Project<CR> " F5 打开project窗口
  
  
"-----------------------------------------------------------------
" plugin - NERD_commenter.vim 注释代码用的，
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let NERDSpaceDelims=1 " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1 " 多行注释时样子更好看
  
"-----------------------------------------------------------------
" plugin - ctrlp 设置
"-----------------------------------------------------------------
nnoremap <silent> <C-p> :ClearAllCtrlPCache<CR>\|:CtrlP<CR>






