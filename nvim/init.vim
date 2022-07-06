"-------------------------------------------------------------------------------
" ************************* NeoVim Configuration *******************************
"-------------------------------------------------------------------------------

let s:plugin_dir = '~/.config/nvim/plugged'
let s:plug_file = '~/.config/nvim/autoload/plug.vim'

 if empty(glob(s:plug_file))
     silent execute '!curl -fLo ' . s:plug_file . ' --create-dirs -k ' .
         \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
 endif


"-------------------------------------------------------------------------------
" Plug-ins
"-------------------------------------------------------------------------------

call plug#begin(s:plugin_dir)

    Plug 'neoclide/coc.nvim', { 'branch': 'release' }                           " Language Server Protocol
    Plug 'junegunn/fzf', {'do': './install' } | Plug 'junegunn/fzf.vim'         " A command-line fuzzy finder
    Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'      " Status bar
    Plug 'https://github.com/preservim/tagbar'                                  " Tagbar for code navigation
    Plug 'https://github.com/tc50cal/vim-terminal'                              " Vim Terminal

    Plug 'https://github.com/tpope/vim-commentary'                              " For Commenting gcc & gc
    Plug 'https://github.com/ryanoasis/vim-devicons'                            " Developer Icons
    Plug 'https://github.com/mkitt/tabline.vim'                                 " Tabline
    Plug 'tmsvg/pear-tree'                                                      " Auto-pair

    " CPP Plug-ins
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'sheerun/vim-polyglot'                                                 " Enhanced syntax highlighting

    " Web Development Plug-ins
    Plug 'mattn/emmet-vim'                                                      " Emmet for web development
    Plug 'https://github.com/ap/vim-css-color'                                  " CSS Color Preview
    Plug 'https://github.com/pangloss/vim-javascript'

    " Colorscheme Plug-ins
    Plug 'https://github.com/rafi/awesome-vim-colorschemes'                     " Retro Scheme

call plug#end()


"-------------------------------------------------------------------------------
" NEOVIM SETTINGS
"-------------------------------------------------------------------------------
set encoding=utf-8
set autoindent                       " always set autoindenting on
set expandtab                        " insert spaces when the tab key is pressed
set shiftround                       " use multiple of shiftwidth when indenting
                                     " with '<' and '>'
set shiftwidth=4                     " number of spaces to use for autoindenting
set smarttab                         " insert tabs on the start of a line
                                     " according to shiftwidth, not tabstop
set tabstop=4                        " a tab is four spaces
set wrap                             " wrap overlong lines
set noswapfile

set number                           " absolute line numbers
" set relativenumber                   " relative line numbers
set mouse=a                          " active interface mouse

let mapleader=" "                    " set personal modifier key to space

"-------------------------------------------------------------------------------
" CUSTOM MAPPINGS
"-------------------------------------------------------------------------------
imap jk <ESC>

" run ':CocInstall coc-explorer' first
nnoremap <space>e :CocCommand explorer<CR>

nnoremap <Leader><Leader> :source $MYVIMRC<CR>

" Ripgrep
map <leader>s :Rg<space>

" Fuzzy File Search
map <C-p> :Files<CR>

" Toogle switch for Tagbar
nmap <F8> :TagbarToggle<CR>

" Switch between .h and .cpp using F4.
" map <F4> :A<CR>
nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Switch between .h and _inline.h using F5.
map <F5> :AI<CR>

" === Page Movement ===
" Page Down
nnoremap <C-j> <C-f>
" Half-Page Down
nnoremap <C-h> <C-d>
" Page Up
nnoremap <C-k> <C-b>
" Half-Page Up
nnoremap <C-l> <C-u>

"-------------------------------------------------------------------------------
" coc.nvim mappings
"-------------------------------------------------------------------------------
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
 
" Hover documentation
nmap <silent> K <cmd>CocActionAsync('doHover')<CR>
 
" Code action (such as adding missing includes, quick fix, etc)
nmap <silent> <leader>ac <Plug>(coc-action-cursor)
 
" Use Tab/Shift-Tab to navigate code-completion suggestions
inoremap <silent><expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
 
" Quality of life
set shortmess+=c
set updatetime=300
 
augroup mygroup
  autocmd!
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nmap <silent> <leader>n <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>m <Plug>(coc-diagnostic-next)

"-------------------------------------------------------------------------------
" AIRLINE SETTINGS
"-------------------------------------------------------------------------------
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"-------------------------------------------------------------------------------
" COC-EXTENSIONS
"-------------------------------------------------------------------------------
let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-clang-format-style-options',
    \ 'coc-cmake',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-htmlhint',
    \ 'coc-html-css-support',
    \ 'coc-emmet',
    \ 'coc-python',
	\ 'coc-diagnostic'
    \]

"-------------------------------------------------------------------------------
" EMMET SETTINGS
"-------------------------------------------------------------------------------
let g:user_emmet_leader_key='<C-Z>'     " redefine emmit trigger

"-------------------------------------------------------------------------------
" COLORSCHEMES
"-------------------------------------------------------------------------------
colorscheme onedark

" CursorLine Modifications
hi CursorLineNr ctermfg=Black ctermbg=LightGreen cterm=bold
set cursorline
set cursorlineopt=number

" == TabLine Modifications ==

" TabLine display with no tab
hi TabLineFill ctermfg=254 ctermbg=238 cterm=none guifg=#333 guibg=#222 gui=none 

" Non-active tabs
hi TabLine ctermfg=249 ctermbg=DarkGray

" Active tabs
hi TabLineSel ctermfg=232 ctermbg=LightGreen cterm=bold
