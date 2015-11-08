set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'vim-scripts/Pydiction'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'

call vundle#end()            " required
filetype plugin indent on    " required

filetype plugin on
syntax on
let python_highlight_all=1

" This makes statusline appear all the time
" instead of only when a split is created
set laststatus=2
set encoding=utf-8
set foldmethod=indent
set foldlevel=99
set nu
set noswapfile
set clipboard=unnamed

set wildmenu
set incsearch
set hlsearch

set ignorecase
set smartcase

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '!'

" Show function signatures in Vim's command line during insert
" mode to preserve undo history.
let g:jedi#show_call_signatures = "2"

" Hybrid line numbers - absolute on current, relative
" otherwise.
set relativenumber
set number

colorscheme Zenburn

" Open/close tabs with space
nnoremap <space> za
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <C-N> :NERDTreeToggle<CR>

au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set softtabstop=4

au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set fileformat=unix

autocmd BufWritePost *.py call Flake8()
