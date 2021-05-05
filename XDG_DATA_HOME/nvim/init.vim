set ic
set noerrorbells
set number
set backspace=indent,eol,start
set showcmd
set noswapfile
set nowritebackup
set encoding=utf-8
set autoread
set ruler
set nocursorcolumn
set nocursorline
set wrap
set textwidth=140
set autoindent
set smartindent
set showmatch
set smarttab
if has('mouse')
  set mouse=a
endif

" If linux then set ttymouse
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux" && !has('nvim')
  set ttymouse=xterm
endif
syntax enable

nnoremap <SPACE> <Nop>
let mapleader=" "

nnoremap <leader>n :noh<cr>
nnoremap <C-n> :bprevious!<CR>
nnoremap <C-m> :bnext!<CR>
nnoremap <C-d> :bp\|:bd #<CR>

call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'slim-template/vim-slim'
Plug 'pangloss/vim-javascript'
Plug 'nfnty/vim-nftables'
call plug#end()

let g:airline#extensions#tabline#enabled = 1

colorscheme nord

nnoremap <c-f> :FZF<CR>
nnoremap <c-p> :NERDTreeToggle<CR>
nnoremap <C-j> :BLines<CR>

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

nnoremap <c-s> :Rg<CR>
nnoremap <c-a> :Rg 
