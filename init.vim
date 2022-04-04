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

    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'      " Status bar
    Plug 'https://github.com/tpope/vim-commentary'
    Plug 'junegunn/fzf', {'do': './install' } | Plug 'junegunn/fzf.vim'
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'mattn/emmet-vim'                                                      "Emmet for web development

    Plug 'https://github.com/tpope/vim-commentary'                              " For Commenting gcc & gc
    Plug 'https://github.com/ap/vim-css-color'                                  " CSS Color Preview
    Plug 'https://github.com/rafi/awesome-vim-colorschemes'                     " Retro Scheme
    Plug 'https://github.com/ryanoasis/vim-devicons'                            " Developer Icons

call plug#end()

imap jk <ESC>
let mapleader=" "                    " set our personal modifier key to space

" coc.nvim mappings
nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <F3>       <Plug>(coc-references)
nmap <silent> K          :call CocActionAsync('doHover')<CR>
nmap <silent> <leader>n <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>m <Plug>(coc-diagnostic-next)

inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
nnoremap <space>e :CocCommand explorer<CR>

"-------------------------------------------------------------------------------
" Text formatting
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
set number
set relativenumber
set mouse=a

map <leader>s :Rg<space>
map <C-p> :Files<CR>

" Switch between .h and .cpp using F4.
map <F4> :A<CR>
" Switch between .h and _inline.h using F5.
map <F5> :AI<CR>

" --- EMMET CONFIG ---
"redefine trigger key
let g:user_emmet_leader_key='<C-Z>'

" --- COLOR THEMES ---
"set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 0
let g:tokyonight_disable_italic_comment = 1
let g:tokyonight_transparent_background = 1
let g:tokyonight_current_word = 'bold'
colorscheme tokyonight
let g:airline_theme = "tokyonight"

"colorscheme molokai
"let g:airline_theme='molokai'
