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

    Plug 'neoclide/coc.nvim', { 'branch': 'release' }                           " Auto Completion
    Plug 'junegunn/fzf', {'do': './install' } | Plug 'junegunn/fzf.vim'

    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'      " Status bar
    Plug 'https://github.com/preservim/tagbar'                                  " Tagbar for code navigation
    Plug 'https://github.com/tc50cal/vim-terminal'                              " Vim Terminal

    Plug 'https://github.com/tpope/vim-commentary'                              " For Commenting gcc & gc
    Plug 'https://github.com/ryanoasis/vim-devicons'                            " Developer Icons

    " CPP Plug-ins
    Plug 'octol/vim-cpp-enhanced-highlight'

    " Web Development Plug-ins
    Plug 'mattn/emmet-vim'                                                      " Emmet for web development
    Plug 'https://github.com/ap/vim-css-color'                                  " CSS Color Preview
    Plug 'https://github.com/pangloss/vim-javascript'

    " Colorscheme Plug-ins
    Plug 'https://github.com/rafi/awesome-vim-colorschemes'                     " Retro Scheme
    Plug 'ghifarit53/tokyonight-vim'                                            " Tokyonight colorscheme

call plug#end()


"-------------------------------------------------------------------------------
" NeoVim settings
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

set number                           " absolute line numbers
set relativenumber                   " relative line numbers
set mouse=a                          " active interface mouse

let mapleader=" "                    " set our personal modifier key to space

"-------------------------------------------------------------------------------
" CUSTOM MAPPINGS
"-------------------------------------------------------------------------------
imap jk <ESC>

" coc.nvim mappings
nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <F3>       <Plug>(coc-references)
nmap <silent> K          :call CocActionAsync('doHover')<CR>
nmap <silent> <leader>n <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>m <Plug>(coc-diagnostic-next)

inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
nnoremap <space>e :CocCommand explorer<CR>

map <leader>s :Rg<space>
map <C-p> :Files<CR>

" Toogle switch for Tagbar
nmap <F8> :TagbarToggle<CR>

" Switch between .h and .cpp using F4.
map <F4> :A<CR>                         
" Switch between .h and _inline.h using F5.
map <F5> :AI<CR>

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
" EMMET SETTINGS
"-------------------------------------------------------------------------------
let g:user_emmet_leader_key='<C-Z>'     " redefine emmit trigger

"-------------------------------------------------------------------------------
" COLORSCHEMES
"-------------------------------------------------------------------------------
" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 0
" let g:tokyonight_disable_italic_comment = 1
" let g:tokyonight_transparent_background = 1
" let g:tokyonight_current_word = 'bold'
" colorscheme tokyonight

colorscheme afterglow
