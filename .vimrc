nnoremap <SPACE> <Nop>

let mapleader=" "

filetype on
syntax enable
set backspace=indent,eol,start
set autoindent
set encoding=utf-8
set expandtab
set foldcolumn=0
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
set shiftwidth=4
set showcmd
set smartcase
set shortmess+=c
set signcolumn=yes
set softtabstop=4
set termguicolors
set updatetime=300
set visualbell
set wildignorecase
set wildmenu
set wildmode=longest:full,full
set wildignore+=**/node_modules/**,**/vendor/**
set guifont=FiraCode-Retina:h14
"set macligatures
set path+=**
set visualbell t_vb=
set novisualbell
set foldmethod=manual
set foldlevel=9
set ttimeoutlen=0


" NIGHTFOX (BROKEN: colorscheme not found at startup)
" require('nightfox')
" colorscheme nightfox

" GRUVBOX
" set background=dark
" let g:gruvbox_italic = 1
" let g:gruvbox_sign_column = "bg0"
"let g:gruvbox_invert_signs = 1
" let g:gruvbox_transparent_bg = 1
" autocmd vimenter * ++nested colorscheme gruvbox


let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

"set fillchars+=vert:

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}


Plug 'christoomey/vim-tmux-navigator'

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nikvdp/ejs-syntax'

" MOVING AROUND
"Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
" Plug 'ggandor/lightspeed.nvim'

"Plug 'will133/vim-dirdiff'

" Plug 'SirVer/ultisnips'
"Plug 'mlaursen/vim-react-snippets'
"Plug 'leafgarland/typescript-vim'
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'
"Plug 'lumiliet/vim-twig'
Plug 'lepture/vim-jinja'

" LANGUAGE SERVERS
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'

" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Plug 'sbdchd/neoformat'

" AUTOCOMPLETE
" Plug 'vim-denops/denops.vim'
" Plug 'Shougo/ddc.vim'
" Plug 'Shougo/ddc-ui-native'
" Plug 'Shougo/ddc-around'
" Plug 'shun/ddc-vim-lsp'
" Plug 'matsui54/ddc-ultisnips'
"Plug 'LumaKernel/ddc-file'

" FOR TROUBLESHOOTING DENOPS
" Plug 'rhysd/vim-healthcheck'
" Plug 'vim-denops/denops-helloworld.vim'

" ddc filters
" Plug 'tani/ddc-fuzzy'
" Plug 'Shougo/ddc-matcher_head'
" Plug 'Shougo/ddc-sorter_rank'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'EdenEast/nightfox.nvim'
"Plug 'morhetz/gruvbox'
"Plug 'shinchu/lightline-gruvbox.vim'

call plug#end()

" COLORSCHEMES --------

" DRACULA
let g:dracula_italic = 1
" packadd! dracula
colorscheme dracula
" let g:dracula_italic = 0

" grep
" if (executable('ag'))
"     set grepprg=ag\ --vimgrep\ '$*'
"     set grepformat^=%f:%l:%c:%m
" endif

nnoremap <leader>S :so %<CR>


" asyncomplete
let g:asyncomplete_min_chars = 2

" Neoformat
" let g:neoformat_try_node_exe = 1

" lsp
" set omnifunc=lsp#complete
" set tagfunc=lsp#tagfunc


let g:lsp_ignorecase = 1
let g:lsp_use_native_client = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_diagnostics_float_cursor = 1


let g:lsp_diagnostics_highlights_delay = 0
let g:lsp_diagnostics_signs_delay = 0
let g:lsp_semantic_enabled = 1


" nmap <leader>qf :LspCodeAction<cr>
" nmap <silent> [g :LspNextDiagnostic<cr>
" nmap <silent> ]g :LspPreviousDiagnostic<cr>
" nmap <silent> gd :LspDefinition<cr>
" nmap <silent> gD :vsplit<cr>:LspDefinition<cr>
" nmap <silent> gh :LspHover<cr>
" nnoremap <silent> K :LspHover<cr> 
" nmap <silent> gD :LspPeekDefinition<cr>
" nmap <silent> gt :LspTypeDefinition<cr> 
" nmap <silent> gT :LspPeekTypeDefinition<cr> 
" nmap <silent> gi :LspImplementation<cr>
" nmap <silent> gI :LspPeekImplementation<cr>
" nmap <silent> gr :LspReferences<cr>
" nmap <silent> gR :LspRename<cr>

" pum
" inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
" inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
" inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
" inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
" inoremap <PageDown> <Cmd>call pum#map#insert_relative_page(+1)<CR>
" inoremap <PageUp>   <Cmd>call pum#map#insert_relative_page(-1)<CR>

" sneak
let g:sneak#label = 1
" let g:sneak#use_ic_scs = 1
highlight Sneak guifg=black guibg=white ctermfg=black ctermbg=white
highlight SneakScope guifg=black guibg=white ctermfg=black ctermbg=white
highlight SneakLabel guifg=black guibg=white ctermfg=black ctermbg=white


" ddc
" call ddc#custom#patch_global('ui', 'native')
" call ddc#custom#patch_global('sources', ['ultisnips', 'vim-lsp', 'around'])
" call ddc#custom#patch_global('sources', ['vim-lsp', 'around'])
"

" <TAB>: completion.
" Note: It does not work for pum.vim
" inoremap <silent><expr> <TAB>
" \ pumvisible() ? '<C-n>' :
" \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
" \ '<TAB>' : ddc#map#manual_complete()
" <S-TAB>: completion back.
" Note: It does not work for pum.vim
" inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
" call ddc#custom#patch_global('sourceOptions', {
" \ '_': {
" \   'matchers': ['matcher_fuzzy'],
" \   'sorters': ['sorter_fuzzy'],
" \   'converters': ['converter_fuzzy'], },
" \ 'vim-lsp': { 'mark': 'L' },
" \ 'around': { 'mark': 'A' },
" \ })
" \ 'ultisnips': { 'mark': 'U' },
"
" call ddc#custom#patch_global('sourceParams', {
" \   'around': { 'maxSize': 500 },
" \ })

" <TAB>: completion.
" inoremap <silent><expr> <TAB>
" \ pumvisible() ? '<C-n>' :
" \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
" \ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
" inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

" Use ddc.
" call ddc#enable()

" fugitive / git
"set diffopt+=vertical
"nmap <leader>gs :2,'}s/pick/s<CR>:wq<CR>
"nmap <leader>gw :g/wip/d<CR>:wq<CR>
"nmap <leader>gD :Gdiffsplit!
"nmap <leader>gf :diffget //2<CR>
"nmap <leader>gj :diffget //3<CR>

" vim-session
"let g:session_autosave = 'yes'
"let g:session_default_to_last = 1
"let g:session_autoload = 'yes'
"nmap <leader>s :wa<CR>:call feedkeys(':OpenSession<space><tab>','t')<cr>

" ragtag
" inoremap <M-o>       <Esc>o
" inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

" dispatch
" nnoremap <leader>D :Focus<space>
" nnoremap <leader>pD :up<CR>:Focus python -m unittest %<cr>:Dispatch<CR>
" nnoremap <leader>d :up<CR>:AbortDispatch<CR>:Dispatch<CR>

" let g:dispatch_quickfix_height = 20
" nnoremap <leader>n 3<c-w>jG

" Y copies to end of line
nnoremap Y yg_

" Put in visual mode doesn't capture
vnoremap p "_dP

" edit vimrc
nnoremap <leader>v :vsplit ~/.vimrc<CR>

" fzf
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
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.4 } }
let g:fzf_preview_window = ['right:hidden', '?']

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
    \ 'ctrl-q': function('s:build_quickfix_list'),
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_OPTS = '--bind ctrl-g:select-all'

nnoremap <leader>t :Files .<CR>
nnoremap <leader>d :Files .<CR>
" nnoremap <leader>t :Files .<CR>
nnoremap <leader>l :Buffers<CR>
nnoremap <leader>F :AgIn<space>
nnoremap <leader>f :Ag<CR>

" AgIn: Start ag in the specified directory
" :AgIn .. foo
" @see https://github.com/junegunn/fzf.vim/issues/27#issuecomment-608294881
function! s:ag_in(bang, ...)
  if !isdirectory(a:1)
    throw 'not a valid directory: ' .. a:1
  endif

  " Press `?' to enable preview window.
  "call fzf#vim#ag(join(a:000[1:], ' '), fzf#vim#with_preview({'dir': a:1}, 'up:50%:hidden', '?'), a:bang)

  " If you don't want preview option, use this
  call fzf#vim#ag(join(a:000[1:], ' '), {'dir': a:1}, a:bang)
endfunction

command! -bang -nargs=+ -complete=dir AgIn call s:ag_in(<bang>0, <f-args>)


" Save shortcut
nnoremap <leader>s :w<CR>
" nnoremap <leader>S :wqa<CR>

" Delete all but current buffer
nnoremap <leader>O :%bd\|e#\|bd#<cr>

" Trim white space on save
"autocmd BufWritePre * %s/\s\+$//e

" incsearch
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" COC
let g:coc_global_extensions = [
    \ 'coc-prettier',
    \ 'coc-eslint',
    \ 'coc-emmet',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-snippets',
    \ 'coc-htmldjango',
    \ 'coc-html',
    \ 'coc-react-refactor',
  \ ]
    " \ 'coc-phpls',
    " \ 'coc-pyright',
    " \ 'coc-ultisnips',
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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
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

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  autocmd BufRead,BufNewFile *.ejs setfiletype html
  autocmd BufNewFile,BufRead *.njk set ft=htmldjango

  " Setup formatexpr specified filetype(s).
  " autocmd FileType scss,sass,ejs,javascript,typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

fu! GetShortFilePath()
  return bufname()
  return substitute(getcwd(), "/Users/.*/dev/", "", "") . "/" . bufname()
  return pathshorten(substitute(getcwd(), "/Users/.*/dev/", "", "") . "/" . bufname())
endfu

let g:lightline = {
    \ 'colorscheme': 'dracula',
    \ 'active': {
    \   'left': [ [ 'filename' ] ],
    \   'right': [ [ 'modified', 'lineinfo' ], [ 'cocstatus' ]  ]
    \ },
    \ 'inactive': {
    \   'left': [ [ 'filename' ] ],
    \   'right': [ [ 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'shortfilepath': 'GetShortFilePath',
    \   'longmodified': 'GetLongModified',
    \   'cocstatus': 'coc#status'
    \ },
    \ }


" Use autocmd to force lightline update.
" autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" cycle through grep results with C-n and C-p
nmap <silent> <C-n> :cnext<CR>
nmap <silent> <C-p> :cprev<CR>

" set emmet short cut
" let g:user_emmet_leader_key='<c-e>'

" ultisnips configuration
" let g:UltiSnipsExpandTrigger="<nop>"
" let g:UltiSnipsJumpForwardTrigger="<c-n>"
" let g:UltiSnipsJumpBackwardTrigger="<c-p>"
" let g:UltiSnipsEditSplit="vertical"
" let g:snips_author="DWolf"
" let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME."/dev/dotfiles/vim-snippets"]
" let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit=$HOME."/dev/dotfiles/vim-snippets"
nnoremap <leader>ue :CocCommand snippets.editSnippets<CR>

" nerdtree
" nnoremap <leader>e :NERDTreeToggle<cr>
" nnoremap <leader>E :NERDTreeToggle %<cr>
" let NERDTreeQuitOnOpen=1

" " easy-motion
" map <Leader> <Plug>(easymotion-prefix)
" let g:EasyMotion_do_mapping = 0
" <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)
" noremap s <Plug>(easymotion-s)
" nnoremap <Leader>s <Plug>(easymotion-s)

" Vdebug
" if !exists('g:vdebug_options')
"     let g:vdebug_options = {}
" endif
" let g:vdebug_options.port = 9000
" let g:vdebug_options.break_on_open = 0

" corsorline only on current buffer
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" File specific
autocmd FileType gitcommit set textwidth=50

" autocmd FileType python nnoremap <leader>y :call CocAction('format')<CR>
" autocmd FileType python let b:coc_root_patterns = ['app', '.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']
"
"
autocmd FileType typescript,javascript inoremap <c-l> console.log();<left><left>
