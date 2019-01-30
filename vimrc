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
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fatih/vim-go'

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
set shell=/bin/zsh
let mapleader = ','
syntax on
set history=30
set viminfo='30
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
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"-----------------------------General setting end---------------------

"----------------------------UI seting begin-------------------------
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=l
    set guioptions-=r
    set guioptions-=b
    set showtabline=0
    if has("unix")
        set guifont=Source\ Code\ Pro\ 13
        set guifontwide=WenQuanYi\ Micro\ Hei\ Mono\ 13
    endif
endif
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
let g:solarized_termtrans=1
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

"----vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_go_checkers = ['govet']
let g:syntastic_quiet_messages = { "type": "style"  }   "disable all style messages

"----Youcompleteme
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_semantic_triggers =  {'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],'cs,lua,javascript': ['re!\w{2}'],}

"----Nerdtree
noremap <c-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"----CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc|reg|mp3|jpg|png|jpeg)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
let g:ctrlp_show_hidden = 1

"----Vim-go
let g:go_fmt_command = "goimports"

"----------------------------Plugin end----------------------

"---------------------------Key map begin--------------------
noremap \ ,
nnoremap <leader>s :up<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>\| :vs<CR>
nnoremap <leader>- :sp<CR>
nnoremap <leader>r :bro ol<CR>
nnoremap <Tab> <C-W>w
nnoremap <leader>d <C-W>c
nnoremap <C-L> :!clear<CR>
nnoremap <F2> :e ~/.vimrc<CR>
"---------------------------Key map end--------------------

"---------------------------Quick run begin------------------
nnoremap <silent> <F5> :call SaveAndExecuteCode()<CR>
vnoremap <silent> <F5> :<C-u>call SaveAndExecuteCode()<CR>

function! SaveAndExecuteCode()
    " save and reload current file
    silent execute "update | edit"

    " get file type
    if &filetype == 'python'
        let s:current_file_type = "python"
    elseif &filetype == 'go'
        let s:current_file_type = "go"
    elseif &filetype == 'cpp'
        let s:current_file_type = "cpp"
    else
        return
    endif

    " get file path of current file
    let s:current_buffer_file_path = expand("%")

    let s:output_buffer_name = "OUTPUT"
    let s:output_buffer_filetype = "output"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'split new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'split new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    if s:current_file_type == "python"
        silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)
    elseif s:current_file_type == "go"
        silent execute ".!go run " . shellescape(s:current_buffer_file_path, 1)
    elseif s:current_file_type == "cpp"
        silent execute ".!g++ -std=c++17 -o /tmp/a.out " . shellescape(s:current_buffer_file_path, 1)
        silent execute ".!/tmp/a.out"
    endif

    " resize window to content length
    " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
    "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
    "       But if you close the output buffer then it returns to using the default size when its recreated
    " execute 'resize' . line('$')

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable
endfunction
"---------------------------Quick run end------------------
