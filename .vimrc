r
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

" Use the .vimrc.bundles file to load all Vundle plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

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

colorscheme lucario
let g:airline_theme = 'tender'
let macvim_skip_colorscheme=1

"""""""""""""""""""""""""
" Begin NERDTree config
"""""""""""""""""""""""""

" Let Ctrl+n toggle NERDTree 
map <C-n> :NERDTreeToggle<CR>

" Automatically start NERDTree when vim is opened
"autocmd vimenter * NERDTree

" Close vim if NERDTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ignore .pyc files in NERDTree
let NERDTreeIgnore = ['\.pyc$']

"""""""""""""""""""""""""
" Begin ack config
"""""""""""""""""""""""""
" Use ag instead of ack for searching
let g:ackprg = 'ag --vimgrep'

"""""""""""""""""""""""""
" Begin vim-airline config
"""""""""""""""""""""""""
" let g:airline_section_c = '%{getcwd()}'
"""""""""""""""""""""""""
" Begin tagbar config
"""""""""""""""""""""""""

" Let Ctrl+t toggle tagbar
map <C-t> :TagbarToggle<CR>

" OBSOLTE FOR NOW "

" Key mappings
"map <C-p>o :CtrlP<CR>
"map gm :call cursor(0, len(getline('.'))/2)<CR>

" go directly to line numbers in normal mode when numbers then
" enter is typed
"nnoremap <CR> G
"nnoremap <C-S-T> :tabprevious<CR>
"nnoremap <C-T>   :tabnext<CR>

" shortcut to write file and get back to the spot in insert mode
"imap jw <Esc>:w <CR>a

"inoremap <C-S-T> <Esc>:tabprevious<CR>i
"inoremap <C-T>   <Esc>:tabnext<CR>i


"let g:ctrlp_cmd = 'CtrlPMRUFiles'
