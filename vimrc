call pathogen#infect()

" Tabbing
set expandtab
set shiftwidth=2
set softtabstop=2
set textwidth=80
set background=dark

" Colours / Filetypes
colorscheme inkpot
syntax enable
filetype plugin indent on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
augroup filetypedetect
  au! BufRead,BufNewFile *.nc set filetype=nc
augroup END

" Tab completion
set wildignore=*.o,*.pyc,*.pdf,*.class,*.aux,*.hi
set wildmode=longest,list,full
set wildmenu

set ruler
set viminfo=""
set tags=./tags;,./TAGS;

set mouse=a
set ttymouse=xterm2

let g:tex_flavor='pdflatex'

"File Templates
function! LoadTemplate()
  silent! 0r ~/.vim/skel/tmpl.%:e
  " Highlight %VAR% placeholders with the Todo colour group
  syn match Todo "%\u\+%" containedIn=ALL
endfunction
autocmd! BufNewFile * call LoadTemplate()

augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc | redraw | echo 'vimrc reloaded'
augroup END

set secure

