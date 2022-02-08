"""""""""Vim settings"""""""""
syntax on
set wrap
"set showbreak=↪
set ignorecase
set nocompatible
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set autoread
set laststatus=2
set ruler
set wildmenu
set tabpagemax=40
set number
set noswapfile
set undodir=~/.vim/undodir
set undofile
set list
"set listchars=tab:▸\ ,trail:·
"set listchars=trail:·

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

set noerrorbells
set t_vb=
set mouse=a
set scrolloff=10
set timeoutlen=200

set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set splitbelow
set splitright

set laststatus=0
set hlsearch
set incsearch
set clipboard=unnamedplus
filetype plugin on

"""""""""Shortcuts, mappings"""""""""
map <F1> :NERDTreeToggle<CR>
map <F2> :RangerWorkingDirectoryNewTab<CR>
map <F3> :shell<CR>

map <F5> :w<CR>

let mapleader = "\<Space>"

nnoremap <leader>/ #*
nnoremap <leader>d :bd 
nnoremap <leader>D :%bd\|e#<CR>
nnoremap <leader>f :SideSearch --fixed-strings "
nnoremap <leader>F :SideSearch --fixed-strings --no-ignore "
nnoremap <Leader>g :SideSearch <C-r><C-w><CR> | wincmd p
nnoremap <Leader>G :SideSearch --no-ignore <C-r><C-w><CR> | wincmd p
nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>n :cnext<CR>
nnoremap <leader>N :cprev<CR>
nnoremap <leader>o :Files<CR>
nnoremap <leader>p viwpb
nnoremap <leader>q :q<CR>
nnoremap <leader>r :source ~/.vimrc<CR>
nnoremap <leader>R :source ~/.vimrc \| :PlugInstall<CR>
nnoremap <leader>s :vsplit<CR>
nnoremap <leader>S :split<CR>
nnoremap <leader>y viwy

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>b <Plug>AirlineSelectNextTab
nmap <leader>B <Plug>AirlineSelectPrevTab

let localmapleader = ","

"keep visual mode after indent
vnoremap > >gv
vnoremap < <gv



"""""""""Plugins"""""""""
call plug#begin('~/.vim/plugged')
"""""""""""""""""""""""""

"Common
Plug 'seagoj/last-position.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'easymotion/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)
map  <Leader>e <Plug>(easymotion-bd-w)
Plug 'francoiscabrol/ranger.vim'
let g:ranger_map_keys = 0
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
Plug 'ddrscott/vim-side-search'
let g:side_search_prg = 'rg'
  \. " --ignore='*.js.map'"
  \. " --heading --stats -B 0 -A 0"
  \. " --line-number"
  \. " --ignore-case"
let g:side_search_splitter = 'new'
let g:side_search_split_pct = 0.4
Plug 'Valloric/ListToggle'
let g:lt_location_list_toggle_map = '<leader>c'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_preview_window = 'right:60%'
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

"Themes and colors
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffers_label = ''

"Plug 'flazz/vim-colorschemes'
Plug 'arcticicestudio/nord-vim'

"Languages
Plug 'sheerun/vim-polyglot'
Plug 'vim-erlang/vim-erlang-tags'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'edkolev/erlang-motions.vim'
Plug 'syed/erlcscope'
Plug 'solarnz/thrift.vim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
let g:pymode_python = 'python3'
let g:pymode_run = 0
let g:pymode_run_bind = ''
let g:pymode_lint = 0
Plug 'OmniSharp/omnisharp-vim'
Plug 'gregsexton/MatchTag'
""""""""""""""""""""""""""""
call plug#end()
"""""""""Plugins end"""""""""



"""""""""Colorscheme"""""""""
colorscheme nord
"colorscheme alduin

"""""""""Custom colors over coloscheme"""""""""
hi Search ctermfg=red ctermbg=NONE cterm=underline

set cursorline
hi CursorLine guibg=NONE ctermfg=NONE ctermbg=NONE cterm=bold
hi CursorLineNr guibg=NONE ctermfg=9  ctermbg=NONE cterm=bold

"""""""""Erlang"""""""""
hi erlangComment        guibg=NONE ctermfg=250 ctermbg=NONE cterm=NONE
hi erlangType           guibg=NONE ctermfg=213 ctermbg=NONE cterm=NONE
hi erlangAttribute      guibg=NONE ctermfg=213 ctermbg=NONE cterm=NONE
hi erlangInclude        guibg=NONE ctermfg=213 ctermbg=NONE cterm=NONE
hi erlangAtom           guibg=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi erlangQuotedAtom     guibg=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi erlangLocalFuncCall  guibg=NONE ctermfg=230 ctermbg=NONE cterm=NONE 
hi erlangLocalFuncRef   guibg=NONE ctermfg=230 ctermbg=NONE cterm=NONE
hi erlangGlobalFuncCall guibg=NONE ctermfg=002 ctermbg=NONE cterm=NONE
hi erlangGlobalFuncRef  guibg=NONE ctermfg=002 ctermbg=NONE cterm=NONE
hi erlangBif            guibg=NONE ctermfg=213 ctermbg=NONE cterm=NONE
hi erlangBoolean        guibg=NONE ctermfg=075 ctermbg=NONE cterm=NONE
hi erlangVariable       guibg=NONE ctermfg=081 ctermbg=NONE cterm=NONE
hi erlangString         guibg=NONE ctermfg=166 ctermbg=NONE cterm=NONE
hi erlangOperator       guibg=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi erlangOperator       guibg=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi erlangBracket        guibg=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi erlangPipe           guibg=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi erlangRightArrow     guibg=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi erlangMap            guibg=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi erlangKeyword        guibg=NONE ctermfg=213 ctermbg=NONE cterm=NONE
hi erlangMacro          guibg=NONE ctermfg=213 ctermbg=NONE cterm=NONE 
hi erlangDefine         guibg=NONE ctermfg=213 ctermbg=NONE cterm=NONE 
hi erlangNumberInteger  guibg=NONE ctermfg=151 ctermbg=NONE cterm=NONE 
hi erlangNumberFloat    guibg=NONE ctermfg=151 ctermbg=NONE cterm=NONE 
hi erlangRecord         guibg=NONE ctermfg=166 ctermbg=NONE cterm=bold
hi erlangQuotedRecord   guibg=NONE ctermfg=166 ctermbg=NONE cterm=bold 
hi erlangTodo           guibg=NONE ctermfg=003 ctermbg=NONE cterm=NONE

augroup GEORGE
    autocmd!
    "autocmd VimEnter *.{c,cpp,go,py,js,ts} NERDTree " open nerdtree when vim starts
    "autocmd VimEnter *.{c,cpp,go,py,js,ts} wincmd p " switch back the focus to the previous window
    "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close the nerdtree window if nothing else is open
    "autocmd FileType nerdtree setlocal conceallevel=3
                "\ | setlocal nocursorline
                "\ | syntax match NERDTreeHideCWD #^[</].*$# conceal
                "\ | setlocal concealcursor=n

    " File formatting related
    "autocmd BufWritePre * :call TrimWhitespace()

    "let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1	" Support cursor change in neovim via vitality plugin
    ":autocmd InsertEnter * set cul
    ":autocmd InsertLeave * set nocul
    "set guicursor=a:blinkon1		" Blink cursor

    " Workaround for not working of gruvbox_transparent_bg in iterm
    autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
        \ |    highlight LineNr     ctermbg=NONE guibg=NONE
        \ |    highlight SignColumn ctermbg=NONE guibg=NONE

    autocmd InsertEnter * set cursorline
    autocmd InsertEnter * hi CursorLine guibg=NONE ctermfg=NONE ctermbg=NONE cterm=bold
    autocmd InsertEnter * hi CursorLineNr guibg=NONE ctermfg=9 ctermbg=NONE cterm=bold
    autocmd InsertLeave * set cursorline
    autocmd InsertLeave * hi CursorLine guibg=NONE ctermfg=NONE ctermbg=NONE cterm=bold
    autocmd InsertLeave * hi CursorLineNr guibg=NONE ctermfg=9  ctermbg=NONE cterm=bold

augroup END
