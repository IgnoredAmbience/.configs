execute pathogen#infect()
execute "Helptags"

" Tabbing
set expandtab
set shiftwidth=2
set softtabstop=2
set textwidth=120
set colorcolumn=+1
set background=dark

" Colours / Filetypes
let g:inkpot_black_background = 1
colorscheme inkpot

syntax enable
filetype plugin indent on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Coq
let g:CoqIDEDefaultMap = 1
highlight SentToCoq ctermbg=234

" Tab completion
set wildignore=*.o,*.pyc,*.pdf,*.class,*.aux,*.hi
set wildmode=longest,list,full
set wildmenu

set ruler
set viminfo=""
set tags=./tags;,./TAGS;

set mouse=a
set ttymouse=xterm2

set guioptions=acimg

set hlsearch
set incsearch

let g:tex_flavor='pdflatex'

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Fix trailing whitespace only on lines in range between entering and leaving insert mode
autocmd InsertEnter * let b:insert_start = line('.')
autocmd InsertLeave * call s:StripTrailingWhitespaces()
function! s:StripTrailingWhitespaces()
  let l:winview = winsaveview()
  exe b:insert_start . ',.s/\s\+$//e'
  call winrestview(l:winview)
endfun

"File Templates
function! LoadTemplate()
  silent! 0r ++edit ~/.vim/skel/tmpl.%:e:e
  " Highlight %VAR% placeholders with the Todo colour group
  syn match Todo "%\u\+%" containedIn=ALL
endfunction
autocmd! BufNewFile * call LoadTemplate()

augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc | redraw | echo 'vimrc reloaded'
augroup END

set secure

