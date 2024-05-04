"
" Notes
" Install vim-plug https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Language server support
" :CocInstall coc-flow

" --- VimPlug ---

call plug#begin('~/.vim/plugged')

"Vim-scripts repos

"enhance
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
" crs -> snake_case
" crc -> camelCase
Plug 'tpope/vim-abolish'
Plug 'airblade/vim-gitgutter'
"Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Raimondi/delimitMate'
Plug 'bling/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'jcherven/jummidark.vim'
Plug 'kien/ctrlp.vim'
Plug 'adelarsq/vim-matchit'

"language support

" Language server
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Javascript and friends
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'

" Elixir
Plug 'slashmili/alchemist.vim'
"Plug 'mhinz/vim-mix-format'

"Disabled Repos
"Plug 'elixir-lang/vim-elixir'
"Plug 'zxqfl/tabnine-vim'

call plug#end()


" --- Settings ---

set expandtab       "expand tabs into spaces
set shiftround
set autoindent      "auto-indent new lines
set smartindent     "return ending brackets to proper locations
set softtabstop=2   "indentation level of soft-tabs
set tabstop=2       "indentation leves of normal tabs
set shiftwidth=2    "how many columns to re-indent with << and >>
set bs=2            "fix backspace on some consoles
set showmatch       "show matching brackets
set ruler           "show cursor position at all times
set nohls           "don't highlight the previous search term
set number          "turn on line numbering
set wrap            "turn on visual word wrapping
set linebreak       "only break lines on 'breakat' characters
set hlsearch        "highlight search matches"
set wildchar=<Tab> wildmenu wildmode=full "wildmenu for easier buffer switching
set colorcolumn=121  "Adds a divide showing when a column is wider than 80 characters
syntax on           "turn on syntax highlighting

" Disable swp files
set noswapfile

" Coc Settings
set updatetime=300

" ---- Tabs vs Spaces ---
au BufRead,BufNewFile *.blade.php set filetype=html
au FileType rb setl shiftwidth=2 tabstop=2 softtabstop=2 et
au FileType html setl shiftwidth=2 tabstop=2 softtabstop=2 et
au FileType php setl shiftwidth=4 tabstop=4 softtabstop=4 et
au FileType js setl shiftwidth=2 tabstop=2 softtabstop=2 et
" ---- \Tabs vs Spaces ---

" --- \Settings ---

" --- Vundle Config ---

" Alie
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'css': ['prettier', 'eslint'],
\}
let g:ale_fix_on_save = 1


" ctrlp
" Speed Up!
" Persist cache
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" Use the silver searcher for speed
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"Ignore certain types of files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp|node_modules\',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }


" Ale

"vim-airline
set laststatus=2

"Nerdtree
"Close Nerdtree if only remaining window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 
"Toggle Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Flow
let g:javascript_plugin_flow = 1

" --- \Vundle Config --

" --- Key Mappings ---

"Leader"
let mapleader = "\\"

"edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Show Tabs and trailing spaces
set list
set listchars=tab:→\ ,trail:·,nbsp:·

" Escape shortcut
imap jj <Esc>

" vim-mix-format
" let g:mix_format_on_save = 1 " Still broken

set termguicolors     " enable true colors support
colorscheme jummidark

" Make background darker
hi Normal ctermbg=16 guibg=#000000
hi LineNr ctermbg=16 guibg=#000000
" Make Visual selector lighter
hi Visual ctermbg=239 guibg=#4e4e4e

" --- \Extras ----
