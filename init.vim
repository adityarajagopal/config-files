set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin()
    Plug 'junegunn/vim-easy-align'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'kshenoy/vim-signature'
    Plug 'bling/vim-bufferline'
    Plug 'mhartington/oceanic-next'
    Plug 'mbbill/undotree'
    Plug 'plasticboy/vim-markdown'
    Plug 'lervag/vimtex'
    Plug 'vimwiki/vimwiki'
call plug#end()

"Settings from vimrc"
set nocompatible
syntax enable
filetype plugin indent on
set background=dark
colorscheme OceanicNext
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set autoindent
"autocmd BufEnter * lcd %:p:h
set number
set clipboard=unnamed
set foldmethod=marker
set hlsearch
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
:nmap <c-h> <c-w>h
:nmap <c-j> <c-w>j
:nmap <c-k> <c-w>k
:nmap <c-l> <c-w>l
:nmap :vb :vertical sb
:nnoremap <c-q> :UndotreeToggle<CR>
imap <C-c> <Esc>
nnoremap <silent> :E :Explore
nnoremap <leader>b :b
set hidden
set completeopt=longest,menuone

"FZF customisations"
nnoremap <silent> <leader>f :FZF
nnoremap <silent> <leader>fp :FZF /home/ar4414/pytorch_training/src/ar4414/pruning <cr>

"vim-surround customisations"
let b:surround_{char2nr('c')} = "#{{{\r#}}}"

"vim-easy-align customisations"
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"vim-bufferline configurations
let g:bufferline_echo = 0
autocmd VimEnter *
  \ let &statusline='%{bufferline#refresh_status()}'
    \ .bufferline#get_status_string()

let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3.6'

"vim-tex plugins"
let g:vimtex_fold_enabled = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_complete_bib_simple = 1
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'aux',
            \}

autocmd FileType tex set spell spelllang=en_gb



