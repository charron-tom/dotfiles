" This is my .vimrc. Take it or leave it
"
filetype plugin indent on

" Enable syntax highlighting
syntax on

set nobackup
set nowritebackup
set noswapfile
set ruler         " Always show the cursor position
set number        " Display line numbers
set hlsearch      " Highlight searches (use <C-L> to temporarily turn off highlighting)
set laststatus=2  " Always display status line
set autowrite     " Automatically :write before running commands
set mouse=a       " Enable use of mouse for all modes
set autoindent    " Keep the same indent as the line you're currently on(Useful for README's etc.)
set backspace=indent,eol,start " Allow backspace
set guifont=0xProto\ Nerd\ Font:h14

" Helpful for rendering devicons
set encoding=UTF-8

" Indentation settings for using 4 spaces instead of tabs.
set softtabstop=2
set expandtab
set shiftwidth=2
" set smarttab

" Open new split panes to the right and bottom which feels more natural
set splitbelow
set splitright

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 80 chars is
set textwidth=80
set colorcolumn=+1
" set nowrap

" Use system clipboard
set clipboard=unnamed

" Ignore directories for searching
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
set wildignore+=*/node_modules/**
set wildignore+=*/.idea/**
set wildignore+=*DS_Store*
set wildignore+=*/build/**
set wildignore+=*/coverage/**
set wildignore+=*/logs/**
set wildignore+=*/bin/**

" Dont throw those annoying messages when w or q is accidentally capitalized
" Just do what I meant
:command WQ wq!
:command Wq wq!
:command W w!
:command Q q!

" Moving between panes
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

"""""""""""""""""""""""""
" plugins
"""""""""""""""""""""""""
source ~/.vimrc.bundles

colorscheme nightfox

"""""""""""""""""""""""""
" Begin NERDTree config
"""""""""""""""""""""""""
" Let Ctrl+n toggle NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Open NERDTree to directory of file not current directory
autocmd BufEnter * lcd %:p:h

"""""""""""""""""""""""""
" Begin tagbar config
"""""""""""""""""""""""""
nnoremap <C-t> :TagbarToggle<CR>
