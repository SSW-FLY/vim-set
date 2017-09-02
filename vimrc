" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"显示行号
set nu
"tap键宽度
set tabstop=3
"统一缩进
set softtabstop=3
set shiftwidth=3
"自动缩进
set autoindent
set cindent

set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
set cursorline
set ruler
set showcmd
set magic
"编码设置
set enc=utf-8
set fencs=utf-8,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
"命令行高度
set cmdheight=2
"高亮显示匹配的括号
set showmatch
"匹配括号高亮的时间
set matchtime=1
"C程序提供自动缩进
set smartindent
"设置字体
set guifont=Courier_New:h10:cANSI
"允许折叠
set foldenable
"手动折叠
set foldmethod=indent
"代码补全
set completeopt=preview,menu
"允许插件
filetype plugin on
"从不备份
set nobackup
"自动保存
set autowrite

""set foldcolumn=0
""set foldmethod=indent
""set foldlevel=3
set foldenable

"禁止生成临时文件
set nobackup
set noswapfile

"自动补全
:inoremap ( ()<ESC>i
			:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
	:inoremap } <c-r>=ClosePair('}')<CR>
	:inoremap [ []<ESC>i
	:inoremap ] <c-r>=ClosePair(']')<CR>
	:inoremap " ""<ESC>i
	:inoremap ' ''<ESC>i
	function! ClosePair(char)
	    if getline('.')[col('.') - 1] == a:char
	        return "\<Right>"
		else
			return a:char
	    endif
endfunction
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

if &term=="xterm"
set t_Co=8
        set t_Sb=^[[4%dm
set t_Sf=^[[3%dm
endif
