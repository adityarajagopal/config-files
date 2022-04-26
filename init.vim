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
    Plug 'chrisbra/csv.vim'
    Plug 'plasticboy/vim-markdown'
    Plug 'lervag/vimtex'
    Plug 'vimwiki/vimwiki'
    Plug '~/.fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'michal-h21/vim-zettel'
    Plug 'voldikss/vim-floaterm'
    Plug '/home/ar4414/.opam/default/share/merlin/vim'
    Plug 'neoclide/coc.nvim', {'branch':'release'}
call plug#end()

"Settings from vimrc"
set nocompatible
syntax enable
filetype plugin indent on
set background=dark
colorscheme OceanicNext
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set autoindent
set number
set clipboard=unnamed
set foldmethod=indent
set hlsearch
set hidden
set colorcolumn=100
set wrap
set textwidth=99

"key remaps"
imap <C-c> <Esc>
:nmap <c-h> <c-w>h
:nmap <c-j> <c-w>j
:nmap <c-k> <c-w>k
:nmap <c-l> <c-w>l
:nmap <c-p> :FZF ~/<CR>
nnoremap <leader>b :b
:nmap :vb :vertical sb
nnoremap <silent> :E :Explore
:nnoremap <c-q> :UndotreeToggle<CR>
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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
let g:python3_host_prog = '/usr/bin/python3.8'

let g:vimwiki_list = [{'path': '~/Documents/personal.wiki'}]

"vimtex configs
let g:vimtex_fold_enabled = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_autoclose_after_keystrokes = 1
let g:vimtex_complete_bib_simple = 1
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'aux',
            \}
nnoremap <leader>toc :VimtexTocOpen

autocmd FileType tex set spell spelllang=en_gb
autocmd FileType tex hi clear SpellBad 
autocmd FileType tex hi SpellBad cterm=underline

"vimwiki and vimzettel commands
let g:vimwiki_list = [{'path': '/home/ar4414/Documents/zettelkasten'}]
let g:zettel_format = "%y%m%d%H%M_%title"
let g:zettel_default_title = ""
let g:zettel_options = [{"template" : "~/.config/nvim/custom/vimzettel/new_note.tpl"}]

"floatterm commands
nnoremap <silent> <leader>tn :FloatermNew<CR>
nnoremap <silent> <leader>tt :FloatermToggle<CR>
tnoremap <silent> <leader>th <C-\><C-n>:FloatermHide<CR>
tnoremap <silent> <leader>tk <C-\><C-n>:FloatermKill<CR>
tnoremap <silent> <leader>tp <C-\><C-n>:FloatermPrev<CR>
tnoremap <silent> <leader>tn <C-\><C-n>:FloatermNext<CR>
tnoremap <silent> <leader>tp <C-\><C-n>:FloatermPrev<CR>
tnoremap <silent> <leader>tt <C-\><C-n>:FloatermToggle<CR>

"FZF config
let $FZF_DEFAULT_COMMAND='ag --hidden -l -g ""'

"ocaml-lsp merlin settings
let no_ocaml_maps=1
