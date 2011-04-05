filetype plugin indent on
set expandtab
set shiftwidth=2
set softtabstop=2
set background=dark
colorscheme inkpot
syntax enable

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

set ruler
set wildignore=*.o,*.pyc,*.pdf,*.class,*.aux,*.hi
set viminfo=""
set tags=./tags;,./TAGS;

let g:tex_flavor='latex'

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

