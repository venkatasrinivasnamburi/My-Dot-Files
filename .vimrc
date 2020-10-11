"turn on the syntax
syntax on
set clipboard=unnamed,unnamedplus  " Copy into system (*, +) register.
set foldmethod=indent " using indentation for folds.
set nu
set timeoutlen=1000 ttimeoutlen=0
set noerrorbells
set autoindent " respect indentation when starting a new line.	
set expandtab " Expand tab to spaces . Essential in python.  set tabstop=2 " Number of spaces tab is counted for.
set shiftwidth=2 "Number of spaces to use for autoindent
set backspace=2 "Fix backspace behaviour on most terminals.
set wildmenu                    " Enable enhanced tab autocomplete. Give suggestion when you do :e <tab>
set hlsearch                    " Highlights all the search terms.
set wildmode=list:longest,full  " Complete till longest string,
                              " then open the wildmenu.
set hidden
"set relativenumber
set smartcase
set noswapfile
set incsearch "incremental search : Highlights the search results as we type.
set noerrorbells "no bells my vim
set list  "  shows a $ sign at the end of each line and shows ^I instead of tabs
" Give more space for displaying messages.
set cmdheight=2

" show the matching brace/parentheisis
set showmatch
set matchtime=3

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

" folds customizations
nnoremap <leader>cf zM<CR>
nnoremap <leader>of zR<CR>

" To instert text after a space.
nnoremap <leader>p li<space><esc>p

"Coc Customizations. Customization to selection completion sources.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"Pretter configuration
" "autocmd FileType javascript set formatprg=prettier\ --stdin

" Customization for folds
autocmd BufRead * normal zR 

" easymotion customizations
" <Leader>f{char} to move to {char}
map  <Leader><Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"Netrw customizations
let g:netrw_banner=0 " to disable the banner
let g:netrw_browse_split=2 " To open file in a horizontal split
let g:netrw_winsize=25  " To set the size of file browser to 25
let g:netrw_browse_split=3 " To open file in a new tab
let g:netrw_liststyle=3 " List the files as a tree 
let g:netrw_usetab=1
let g:netrw_sort_by='exten' "sort files by time instead of default name
let g:netrw_sort_direction="reverse" " sort files in the reverse order.
" let g:netrw_browse_split = 4 " To open file in horizontal split
"let g:netrw_altv = 1
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" Mappings start here.

"insert  abbrerviations
iabbrev nnr nnoremap
iabbrev inr inoremap

" command mode mappings
cmap fj %!jq "."<CR>
cmap sv source $MYVIMRC<CR>

" Mapping to move between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nmap <leader>v <C-v>
nnoremap <leader>rv :vert res +20<CR>
nnoremap <leader>rh :res +20<CR>
nnoremap <leader>ex :Lex<CR>
inoremap jk <esc>
inoremap <esc> <nop>

"Fzf Mappings
nnoremap <leader>f :Files ~/dev

" Ulti snippets mapping 
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><c-b>"
let g:UltiSnipsJumpBackwardTrigger="<leader><c-z>"

" ALE Mappings
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1  " Fix files automatically on save

"NERDTree mappings
" Focus the file insted of NERDTree soon after vim opens
" Remap NerdTree Bookmark
noremap <leader>n :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree  " Enable NERDTree on Vim startup.
autocmd vimEnter * wincmd p
let NERDTreeShowBookmarks = 1  " Display bookmarks on startup.
" Autoclose NERDTree if it's the only open window left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Help for NERDTree mappings
noremap <leader>ntm :help NERDTreeMappings<CR>
noremap <leader>nth :help NERDTree<CR>
noremap <leader>b :Bookmark<CR>

"---------AUTO COMPLETION----"
set omnifunc=syntaxcomplete#Complete

"Pluggins start over here.
call plug#begin('~/.vim/plugged')
Plug  'shawn-sterling/ScrollColors'
Plug  'easymotion/vim-easymotion'
" Vim autocomplete
Plug 'sheerun/vim-polyglot'
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install && npm intall -g tern' }
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
Plug 'airblade/vim-rooter'
" For color schemes
Plug 'gruvbox-community/gruvbox'
Plug 'flazz/vim-colorschemes'
" For styling the statusline at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug '/home/mpaulson/personal/vim-be-good'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
call plug#end()


if has('nvim') && executable('nvr')
let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

" UltiSnipps settings
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/ultiSnips']

" ALE Settings
let g:ale_sign_error = '‚ùå'
let g:ale_sign_warning = '‚ö†Ô∏è'

" Netrw Settings
let g:netrw_sort_by='time'
let g:netrw_preview=2 
let g:netrw_winsize=24
let g:netrw_liststyle=3
" settings for fzf
" Empty value to disable preview window altogether
let g:fzf_preview_window = ''
nnoremap <C-p> :<C-u>FZF<CR>

" Always enable preview window on the right with 60% width
" let g:fzf_preview_window = 'right:60%'"
"
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

colorscheme gruvbox

" Load all plugins now.
" Plugin need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL


" Coding completion statements
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Javascript specific indentation

" Mappings to use Esc for normal mode in terminal mode as well

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

