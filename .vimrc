set nocompatible
filetype off

let mapleader = ","

"let g:neocomplete#enable_at_startup = 1
"let g:phpcomplete_index_composer_command='/opt/local/bin/composer'
"autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Bundle 'gmarik/vundle'

"command-t for finding files
Bundle 'wincent/command-t' 

"twig syntax
Bundle 'lumiliet/vim-twig' 

"emmet short cuts
Bundle 'mattn/emmet-vim' 

"phpdoc generator
Bundle 'tobyS/vmustache'
Bundle 'tobyS/pdv'

"TODO these need vetting
"Bundle 'Shougo/vimproc'
"Bundle 'Shougo/unite.vim'
"Bundle 'm2mdas/phpcomplete-extended'
"Bundle 'Shougo/neocomplete.vim'

call vundle#end()

filetype on
syntax on
set showcmd
set hlsearch
set ignorecase
set smartcase
set autoindent
set visualbell
set mouse=c
set number
set shiftwidth=4
set softtabstop=4
set expandtab

" make backspace work like other programs
set backspace=indent,eol,start

"folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=5

" always show status line
set laststatus=2

set statusline=%t       "tail of the filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=\ %{&ff}] "file format
set statusline+=\ %h      "help file flag
set statusline+=\ %m      "modified flag
set statusline+=\ %r      "read only flag
set statusline+=\ %y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

"ctrl-s saves from visual mode
inoremap <c-s> <Esc>:update<CR>

"set emmet short cut
let g:user_emmet_leader_key='<leader>'

"pdv (phpdoc) templates directory
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates"
"shortcut for pdv (phpdoc)
nnoremap <buffer> <C-p> :call pdv#DocumentCurrentLine()<CR>
