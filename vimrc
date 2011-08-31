filetype plugin indent on
set expandtab
set shiftwidth=2
set softtabstop=2
set textwidth=80
set background=dark
colorscheme inkpot
syntax enable

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

set wildignore=*.o,*.pyc,*.pdf,*.class,*.aux,*.hi
set wildmode=longest,list,full
set wildmenu

set ruler
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

"Jump between %VAR% placeholders in Normal mode with <Ctrl-p>
nnoremap <c-p> /%\u.\{-1,}%<cr>c/%/e<cr>
"Jump between %VAR% placeholders in Insert mode with <Ctrl-p>
inoremap <c-p> <ESC>/%\u.\{-1,}%<cr>c/%/e<cr>

set secure

