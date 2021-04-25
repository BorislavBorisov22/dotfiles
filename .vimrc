let mapleader = ","

syntax on
filetype on
set nocompatible
set number                " Show numbers on the left
set hlsearch              " Highlight search results
set ignorecase            " Search ingnoring case
set smartcase             " Do not ignore case if the search patter has uppercase
set tabstop=2             " Tab size of 2 spaces
set softtabstop=2         " On insert use 2 spaces for tab
set shiftwidth=2
set expandtab             " Use apropiate number of spaces
set nowrap                " Wrapping sucks (except on markdown)
autocmd BufRead,BufNewFile *.md,*.txt setlocal wrap " DO wrap on markdown files
set noswapfile            " Do not leve any backup files
set clipboard=unnamed,unnamedplus     " Use the OS clipboard
set showmatch             " Highlights matching parentheses
set termguicolors
set splitright splitbelow " Opening new windows on the right or below
set list lcs=tab:\¦\
set list lcs=trail:·,tab:»·

" Initializing and installing vim-plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
" Plugins here !!!!
Plug 'tpope/vim-sensible' " This gives some sensible default config
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " best file and text search tool ever!
Plug 'airblade/vim-rooter'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'

call plug#end()

colorscheme gruvbox
set bg=dark

nnoremap <C-t> :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :INERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " closes nerd tree automatically if it's the last open tab/window

" key mappings for fzf
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-p> :GFiles<CR>


" coc config
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

