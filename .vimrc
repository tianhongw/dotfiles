" -------------------------------Vundle begin---------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-syntastic/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Valloric/YouCompleteMe'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"-----------------------------Vundle end----------------------------

"-----------------------------General setting begin----------------
set shell=/bin/bash
let mapleader = ','
noremap \ ,
syntax enable
syntax on
filetype indent on
set nobackup
set noerrorbells
set novisualbell
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
"-----------------------------General setting end---------------------

"----------------------------UI seting begin-------------------------
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
set background=dark
colorscheme solarized

set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode
set cursorline                  " Highlight current line
highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode

set ruler
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespacek
set laststatus=2
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
"----------------------------UI seting end-------------------------

"----------------------------Formatting begin----------------------

set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set smartindent
set cindent
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set smarttab
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
"set matchpairs+=<:>            "Match, to be used with %
"set pastetoggle=<F12>          "pastetoggle (sane indentation on pastes)
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

"----------------------------Formatting end----------------------

"----------------------------Plugin begin----------------------

"----nathanaelkane/vim-indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_enable_on_vim_startup = 1

"----vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"----Youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_min_num_identifier_candidate_chars = 2
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"开启 YCM 标签引擎
"let g:ycm_collect_identifiers_from_tags_files=1
"引入 C++ 标准库tags
"set tags+=/data/misc/software/misc./vim/stdcpp.tags
let g:ycm_python_binary_path = '/usr/bin/python3'
"语义补全
let g:ycm_semantic_triggers =  {'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],'cs,lua,javascript': ['re!\w{2}'],}


"----vim-syntastic/syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_cpp_checkers = ['syntastic-checkers-cpp']
"disable all style messages:
let g:syntastic_quiet_messages = { "type": "style"  }

"----------------------------Plugin end----------------------

"---------------------------Key map begin--------------------

"---------------------------Key map end--------------------


"---------------------------Quick run begin------------------
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!./%<"
    elseif &filetype == 'python'
        exec "!python %"
    endif
endfunc
"---------------------------Quick run end------------------
