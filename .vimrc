"turn on the syntax
syntax on
set clipboard=unnamed,unnamedplus  " Copy into system (*, +) register.
filetype plugin indent on  " Enable file type based indentation.
set foldmethod=indent " using indentation for folds.
set nu
set noerrorbells
set autoindent " respecte indentation when starting a new line.	
set expandtab " Expand tab to spaces . Essential in python.
set tabstop=4 " Number of spaces tab is counted for.
set shiftwidth=2 "Number of spaces to use for autoindent
set backspace=2 "Fix backspace behaviour on most terminals.
set wildmenu                    " Enable enhanced tab autocomplete.
set hlsearch                    " Highlights all the search terms.
set wildmode=list:longest,full  " Complete till longest string,
                              " then open the wildmenu.
set hidden
set smartcase
set noswapfile
set incsearch "incremental search : Highlights the search results as we type.
set noerrorbells "no bells my vim

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" set updatetime=50
set wildmenu "wildmenu to display the explorer using NetroW

let mapleader = ' '
let localleader='-'
" To determine the shape of the cursor in various modes.
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Airline Themes
let g:airline_solarized_bg='dark'
let g:javascript_plugin_jsdoc = 1 "syntax highlighting plugin for javascript.

"Coc Customizations. Customization to selection completion sources.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Customization for folds
autocmd BufRead * normal zR 

"Netrw customizations
let g:netrw_banner=0 " to disable the banner
let g:netrw_browse_split=2 " To open file in a horizontal split
let g:netrw_winsize=25  " To set the size of file browser to 25
let g:netrw_browse_split=3 " To open file in a new tab
let g:netrw_liststyle=3 " List the files as a tree 
let g:netrw_usetab=1
let g:netrw_sort_by='exten' "sort files by time instead of default name
let g:netrw_sort_direction="reverse" " sort files in the reverse order.
" Mappings start here.

"insert  abbrerviations
iabbrev nnr nnoremap
iabbrev inr inoremap

" command mode mappings
cmap sv source $MYVIMRC<CR>

" Mapping to move between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nmap <leader>v <C-v>
nnoremap <leader>ex :Lex<CR>
inoremap jk <esc>
inoremap <esc> <nop>

"Fzf Mappings
nnoremap <leader>f :Files ~/work/source_code/occs_storefront_framework<CR>
nnoremap <leaderfa :Files ~/work<CR>

"Pluggins start over here.
call plug#begin('~/.vim/plugged')
" Vim autocomplete
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Vim linters and prettier
Plug 'dense-analysis/ale'
" Vim git 
Plug 'tpope/vim-fugitive'
" Vim man pages
Plug 'vim-utils/vim-man'
" fuzzy file finder.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" For color schemes
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
" For styling the statusline at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug '/home/mpaulson/personal/vim-be-good'

call plug#end()

" Netrw Settings
let g:netrw_sort_by='time'
let g:netrw_preview=2 
let g:netrw_winsize=24
let g:netrw_liststyle=3
" settings for fzf
" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

" Always enable preview window on the right with 60% width
" let g:fzf_preview_window = 'right:60%'"
" gruvbox-material setting start here.
"
" Important!!
if has('termguicolors')
  set termguicolors
endif
" For dark version.
set background=dark

" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'

colorscheme gruvbox-material
"colorscheme gruvbox
colorscheme monokai_pro

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
