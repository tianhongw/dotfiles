if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" --- UI and Theme ---
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" --- Files and navigation ---
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" --- Edit ---
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'

" --- Coc ---
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ============================================================================
" 3. General settings
" ============================================================================
set encoding=utf-8
set fileencoding=utf-8
set mouse=a
set clipboard=unnamed
set history=1000
set nobackup
set nowritebackup
set noswapfile
set updatetime=300
set shortmess+=c
set signcolumn=yes
set splitright
set splitbelow
set hidden
set lazyredraw
set ttyfast
set scrolloff=8
set sidescrolloff=8
set wildmenu
set wildmode=longest:full,full

" Persistent undo
set undofile
set undodir=~/.vim/undodir

set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

" ============================================================================
" 4. UI settings
" ============================================================================
syntax on
set number
set cursorline
set laststatus=2
set background=dark

if (has("termguicolors"))
  set termguicolors
endif

colorscheme solarized8_high

" --- Airline settings ---
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1 " 顶部显示 buffer tab

" ============================================================================
" 5. Key Mappings
" ============================================================================
let mapleader = ","

inoremap jk <Esc>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <Tab> <C-w>w
nnoremap <F2> :e $MYVIMRC<CR>
nnoremap <C-L> :nohlsearch<CR>:diffupdate<CR>:syntax sync fromstart<CR><c-l>
nnoremap <leader>r :History<CR>

" --- Plugin ---
" NERDTree
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
nnoremap <leader>n :NERDTreeToggle<CR>
" Tagbar
if executable('/opt/homebrew/bin/ctags')
    let g:tagbar_ctags_bin = '/opt/homebrew/bin/ctags'
elseif executable('/usr/local/bin/ctags')
    let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
endif
nnoremap <leader>l :TagbarToggle<CR>
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <C-f> :Rg<CR>

" ============================================================================
" 6. CoC.nvim
" ============================================================================
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Diagnostic navigation
nmap <silent> <C-j> <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap <leader>rn <Plug>(coc-rename)

" --- Other ---
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TRIM_WHITESPACE
    autocmd!
    autocmd BufWritePre * if &ft != 'markdown' | call TrimWhitespace() | endif
augroup END
