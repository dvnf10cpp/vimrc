"vim src config set
set nocompatible              " be iMproved, required
filetype off                  " required


call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
Plug 'scrooloose/nerdtree'

" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
syntax on "to turn on syntax
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set tabpagemax=10
:inoremap ( ()<left>
:inoremap [ []<left>
:inoremap { {}<left>
:inoremap " ""<left>
if has('persistent_undo')
    set undofile
    set undodir=$HOME/.vim/undo
    endif

color Monokai
colorscheme gruvbox
nnoremap <C-Q> :qa!<CR>
nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-m> :NERDTreeToggle<CR>

command Tabnewdir tabnew | execute 'cd ' . getcwd()
" Open NERDTree when Vim is started
let g:NERDTreeWinSize=18
let g:NERDTreeWidth=18
let g:NERDTreeWinPos='left'
let g:NERDTreeIgnore=['\.pyc$', '\~$']
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeAutoFocus = 0

autocmd VimEnter * NERDTree

