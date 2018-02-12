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

nore ; :
nore , ;

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


set number
set mouse=r

syntax enable
"set background=dark
"colorscheme solarized

:highlight LineNr ctermfg=darkgrey

hi Search cterm=NONE ctermfg=grey ctermbg=blue

" Paste in vim without autoindent
set pastetoggle=<F2>

" Sane searching
set hlsearch " Hilight search term
set showmatch " Show matching brackets
set incsearch " ... dynamically as they are typed"

source ~/.vimrc-vundle
