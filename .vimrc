nnoremap <SPACE> <Nop>
let mapleader=" "

" Escape sequences to start and stop italics
set t_ZH=[3m
set t_ZR=[23m

" Caret shapes
let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

" disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

filetype on
syntax enable
set backspace=indent,eol,start
set autoindent
set cursorlineopt=number
set encoding=utf-8
set expandtab
set foldcolumn=0
set nowrap
set hidden
set nohlsearch
set incsearch
set ignorecase
set laststatus=2
set mouse=c
set nobackup
set noeol
set nowritebackup
set noshowmode
set nonumber
set norelativenumber
set ruler
set showcmd
set smartcase
set shortmess+=c
set signcolumn=yes
set shiftwidth=4
set softtabstop=4
set termguicolors
set updatetime=300
set visualbell
set wildignorecase
set wildmenu
set wildmode=longest:full,full
set wildignore+=**/node_modules/**,**/vendor/**,**/out/**,**/dist/**
set path+=**
set visualbell t_vb=
set novisualbell
set foldmethod=manual
set foldlevel=9
set ttimeoutlen=0

if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync
endif

call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'github/copilot.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'nelsyeung/twig.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-abolish'
" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-unimpaired'

call plug#end()

packadd comment
let g:dracula_italic = 1
colorscheme dracula

nnoremap <leader>v :vsplit ~/.vimrc<CR>
nnoremap <leader>S :so %<CR>
nnoremap Y yg_
vnoremap p "_dP
nnoremap <leader>O :%bd\|e#\|bd#<cr>
nnoremap <leader>s :w<CR>
nnoremap <leader>w :set wrap!<CR>

let g:copilot_workspace_folders = ["/Users/danielwolf/dev"]

highlight Sneak guifg=black guibg=white ctermfg=black ctermbg=white
highlight SneakScope guifg=black guibg=white ctermfg=black ctermbg=white

let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6 } }
let g:fzf_preview_window = ['right:hidden', '?']
let g:fzf_history_dir = '~/.vim/fzf-history'
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
let g:fzf_action = {
    \ 'ctrl-q': function('s:build_quickfix_list'),
    \ 'ctrl-x': 'split',
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_OPTS = '--bind ctrl-g:select-all'
nnoremap <leader>d :Files .<CR>
nnoremap <leader>l :Buffers<CR>
nnoremap <leader>F :BLines<CR>
nnoremap <leader>f :Ag<CR>

let g:coc_global_extensions = [
    \ 'coc-prettier',
    \ 'coc-css',
    \ 'coc-eslint',
    \ 'coc-emmet',
    \ 'coc-htmldjango',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-snippets',
    \ 'coc-html',
    \ 'coc-react-refactor',
    \ 'coc-pyright',
    \ 'coc-stylelintplus',
    \ '@yaegassy/coc-tailwindcss3',
  \ ]
let g:coc_filetype_map = {
    \ }
inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-@> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :vsp<CR>gd
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)
xmap <leader>gq  <Plug>(coc-codeaction-refactor-selected)
nmap <leader>gq  <Plug>(coc-codeaction-refactor-selected)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>cl  <Plug>(coc-codelens-action)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
augroup filetypesgroup
  autocmd!
  autocmd BufRead,BufNewFile *.ejs setfiletype html
  autocmd BufNewFile,BufRead *.njk set ft=htmldjango
  autocmd BufNewFile,BufRead *.twig set ft=htmldjango
  autocmd BufNewFile,BufRead *.twig set syntax=html.twig.js.css
  autocmd BufNewFile,BufRead *.twig set shiftwidth=2 softtabstop=2
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

autocmd FileType typescript,javascript inoremap <c-l> console.log({});<left><left><left>

augroup shortcutz
  autocmd!
  nnoremap ]<space> :set paste<CR>m`o<Esc>``:set nopaste<CR>
  nnoremap [<space> :set paste<CR>m`O<Esc>``:set nopaste<CR>
  nnoremap <leader>n :set number!<CR>
  nnoremap gn :cnext<CR>
  nnoremap gp :cprev<CR>
augroup end
