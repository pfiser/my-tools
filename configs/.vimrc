syntax on
set nu
set tabstop=8
set hlsearch
set encoding=utf-8
filetype plugin indent on

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Spell check
set spell spelllang=en_us
map <F8> <Esc>:setlocal spell spelllang=en_us<CR>
map <F9> <Esc>:setlocal nospell<CR>

" Line numbers toggle
map <C-N><C-N> :set invnumber<CR>

" Space/Tab trail
"set list
"set listchars=trail:⋅,nbsp:⋅,tab:▷⋅

" Git commit wrap to 72 chars
"au FileType gitcommit setlocal tw=72

" Column at 80
set colorcolumn=80

" Save as root with command 'W'
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
