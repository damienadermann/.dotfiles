" Damien Adermanns vimrc
"
" Notes
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"

" --- Set Up ---
set nocompatible    "run in vim mode
filetype off        "Required for vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" --- \Set Up ---


" --- Settings ---

set expandtab       "expand tabs into spaces
set autoindent      "auto-indent new lines
set smartindent     "return ending brackets to proper locations
set softtabstop=4   "indentation level of soft-tabs
set tabstop=4       "indentation leves of normal tabs
set shiftwidth=4    "how many columns to re-indent with << and >>
set bs=2            "fix backspace on some consoles
set showmatch       "show matching brackets
set ruler           "show cursor position at all times
set nohls           "don't highlight the previous search term
set number          "turn on line numbering
set wrap            "turn on visual word wrapping
set linebreak       "only break lines on 'breakat' characters
set hlsearch        "highlight search matches"
set wildchar=<Tab> wildmenu wildmode=full "wildmenu for easier buffer switching"
syntax on           "turn on syntax highlighting
"set autochdir       "turn on auto change directory"

" --- \Settings ---


" --- Vundle ---
Bundle 'gmarik/vundle'

"Vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'tobyS/vmustache'
Bundle 'tobyS/pdv'

"Git Repos
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-ragtag'
Bundle 'scrooloose/syntastic'
Bundle 'Raimondi/delimitMate'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'AD7six/vim-independence'
Bundle 'mattn/emmet-vim'
Bundle 'bling/vim-airline'
Bundle 'kchmck/vim-coffee-script'

" --- \Vundle ---

" --- Vundle Config ---

"ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"pdv
let g:pdv_template_dir = $HOME."/.vim/bundle/pdv/templates_snip"
nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>

" solarized options
syntax enable
set background=dark
colorscheme solarized

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

" --- Extras ---

augroup filetypedetect
    au! BufRead,BufNewFile *nc setfiletype nc "http://www.vim.org/scripts/script.php?script_id=1847
    "html.ep now handled by https://github.com/yko/mojo.vim
augroup END


"Show trailing white space"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"Show Tabs
set list
set listchars=tab:\|\ 

" For vim-coffee-script
filetype plugin indent on
syntax enable
filetype off
filetype on

" --- \Extras ----
