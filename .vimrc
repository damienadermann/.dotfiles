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
"

" --- Vundle ---
Bundle 'gmarik/vundle'

"Vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'

"Git Repos
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'tobyS/vmustache'
Bundle 'tobyS/pdv'
Bundle 'tpope/vim-rails'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Raimondi/delimitMate'
Bundle 'altercation/vim-colors-solarized'
Bundle 'AD7six/vim-independence'
Bundle 'mattn/emmet-vim'
Bundle 'bling/vim-airline'
Bundle 'kchmck/vim-coffee-script'

" --- \Vundle ---


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
set wildchar=<Tab> wildmenu wildmode=full "wildmenu for easier buffer switching"
syntax on           "turn on syntax highlighting

au BufRead,BufNewFile *.blade.php set filetype=html
au FileType coffee setl shiftwidth=2 tabstop=2 softtabstop=2 et
au FileType rb setl shiftwidth=2 tabstop=2 softtabstop=2 et
au FileType html setl shiftwidth=2 tabstop=2 softtabstop=2 et
au FileType php setl shiftwidth=4 tabstop=4 softtabstop=4 et
au FileType js setl shiftwidth=4 tabstop=4 softtabstop=4 et

" --- \Settings ---

" --- Vundle Config ---

"  syntastic
let g:syntastic_mode_map = { 'mode': 'active',
                \ 'active_filetypes': ['ruby', 'php'],
                \ 'passive_filetypes': ['puppet'] }

" solarized options
syntax enable
set background=dark
colorscheme solarized

"ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"pdv
let g:pdv_template_dir = $HOME."/.vim/bundle/pdv/templates_snip"
nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>

"vim-airline
set laststatus=2

"Nerdtree
"Close Nerdtree if only remaining window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 
"Toggle Nerdtree
map <C-n> :NERDTreeToggle<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

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

"Show Tabs and trailing spaces
set list
set listchars=tab:→\ ,trail:·,nbsp:·

" For vim-coffee-script
filetype plugin indent on
syntax enable
filetype off
filetype on

" --- \Extras ----
