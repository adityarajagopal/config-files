set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin()
    " Plug 'neoclide/coc.nvim', {'branch':'release'}
    Plug 'neovim/nvim-lspconfig'
    Plug 'junegunn/vim-easy-align'
    Plug 'tpope/vim-surround'
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
    Plug 'LnL7/vim-nix'
    Plug 'rhysd/vim-grammarous'
    Plug 'vim-airline/vim-airline'
    " Haskell plugins
    Plug 'neovimhaskell/haskell-vim'
    " Racket plugins
    Plug 'benknoble/vim-racket'
    Plug 'gpanders/nvim-parinfer'
    Plug 'Olical/conjure'
call plug#end()

"Settings from vimrc"
set nocompatible
syntax on
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
:nmap <c-p> :FZF <CR> 
nnoremap <leader>b :b
:nmap :vb :vertical sb
nnoremap <silent> :E :Explore
:nnoremap <c-q> :UndotreeToggle<CR>
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
:noremap <Leader>y "*y
:let maplocalleader = ";"

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
"general begin end completion with current word
noremap <silent> <leader>b caw\begin{<C-R>"}<CR>\end{<C-R>"}
"specific begin minipage
noremap <silent> <leader>bmp i\begin{minipage}{\linewidth}<CR>\scriptsize<CR>\end{minipage}
"specific begin frame
noremap <silent> <leader>bf i\begin{frame}{}<CR>\end{frame}

autocmd FileType tex set spell spelllang=en_gb
autocmd FileType tex hi clear SpellBad 
autocmd FileType tex hi SpellBad cterm=underline

"vimwiki and vimzettel commands
let g:vimwiki_list = [{'path': '/home/ar4414/Documents/zettelkasten'}]
let g:zettel_format = "%y%m%d%H%M_%title"
let g:zettel_default_title = ""
let g:zettel_options = [{"template" : "~/.config/nvim/custom/vimzettel/new_note.tpl"}]
noremap <silent> <leader>zn = :ZettelNew

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

lua << EOF
  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true }
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
  
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  end
  
  require('lspconfig')['hls'].setup{
    filetypes = { 'haskell', 'lhaskell', 'cabal' },
    on_attach = on_attach
  }
EOF

"coc shortcuts"
" map <Leader>ggd <Plug>(coc-definition)
" map <Leader>ggi <Plug>(coc-implementation)
" map <Leader>ggt <Plug>(coc-type-definition)
" map <Leader>gh :call CocActionAsync('doHover')<cr>
" map <Leader>gn <Plug>(coc-diagnostic-next)
" map <Leader>gp <Plug>(coc-diagnostic-prev)
" map <Leader>gr <Plug>(coc-references)
" 
" map <Leader>rn <Plug>(coc-rename)
" map <Leader>rf <Plug>(coc-refactor)
" map <Leader>qf <Plug>(coc-fix-current)
" 
" map <Leader>al <Plug>(coc-codeaction-line)
" map <Leader>ac <Plug>(coc-codeaction-cursor)
" map <Leader>ao <Plug>(coc-codelens-action)
" 
" nnoremap <Leader>kd :<C-u>CocList diagnostics<Cr>
" nnoremap <Leader>kc :<C-u>CocList commands<Cr>
" nnoremap <Leader>ko :<C-u>CocList outline<Cr>
" nnoremap <Leader>kr :<C-u>CocListResume<Cr>
" 
" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
" 
" autocmd CursorHold * silent call CocActionAsync('highlight')
" autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
