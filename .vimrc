set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


imap jj <C-[>
imap kk <C-[>

set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4

:command WQ wq
:command Wq wq
:command W w
:command Q q

"nnoremap <C-H> :Hexmode<CR>
"inoremap <C-H> <Esc>:Hexmode<CR>
"vnoremap <C-H> :<C-U>Hexmode<CR>

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()
function ToggleHex()
    let l:modified=&mod
    let l:oldreadonly=&readonly
    let &readonly=0
    let l:oldmodifiable=&modifiable
    let &modifiable=1
    if !exists("b:editHex") || !b:editHex
        let b:oldft=&ft
        let b:oldbin=&bin
        setlocal binary " make sure it overrides any textwidth, etc.
        let &ft="xxd"
        let b:editHex=1
        %!xxd
    else
        let &ft=b:oldft
        if !b:oldbin
            setlocal nobinary
        endif
        let b:editHex=0
        %!xxd -r
    endif
    let &mod=l:modified
    let &readonly=l:oldreadonly
    let &modifiable=l:oldmodifiable
endfunction

set mouse=r

syntax enable
"set background=dark
"colorscheme solarized

set number
:highlight LineNr ctermfg=darkgrey

hi Search cterm=NONE ctermfg=grey ctermbg=blue

nore ; :
nore , ;

" set backupdir=~/.vimbackups

"-------------------------------------
" Config for  vundle
"-------------------------------------

set nocompatible               " be iMproved
filetype on                   " required!

"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

" let Vundle manage Vundle
" required 
"Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
" Snipmate install dependencies:
"Bundle "MarcWeber/vim-addon-mw-utils"
"Bundle "tomtom/tlib_vim"
"Bundle "honza/snipmate-snippets"
"Bundle "garbas/vim-snipmate"

"Bundle "Raimondi/delimitMate"
" vim-scripts repos
"Bundle "c.vim"
"Bundle "a.vim"
"Bundle "Syntastic"
" non github repos

" 
autocmd FileType c,cpp set commentstring=//\ %s

" file specific flags
filetype plugin indent on     " required!

" Unite Mappings
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>

" Paste in vim without autoindent
set pastetoggle=<F2>

" Sane searching
set hlsearch " Hilight search term
set showmatch " Show matching brackets
set incsearch " ... dynamically as they are typed"

"
" more at https://github.com/csexton/dotfiles/blob/master/home/vimrc#L381
"
nmap <F8> :TagbarToggle<CR>
