" Tabbing
set expandtab
set shiftwidth=2
set softtabstop=2
set textwidth=100
set colorcolumn=+1
set background=dark

" Colours
colorscheme inkpot
syntax enable
filetype plugin indent on   " Enable filetype indentation
set foldlevelstart=99       " Starts with any folds open

" Filetype-specific options and setup
let g:tex_flavor='pdflatex'
let g:xml_syntax_folding=1

augroup filetypes
  autocmd!
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd BufRead,BufNewFile *.dokuwiki set filetype=dokuwiki
  autocmd FileType xml setlocal foldmethod=syntax
  autocmd FileType xml setlocal foldcolumn=1
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

set guioptions=acimg

set hlsearch
set incsearch


" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
augroup trailing_ws
  autocmd!
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()

  " Fix trailing whitespace only on lines in range between
  " entering and leaving insert mode
  autocmd InsertEnter * let b:insert_start = line('.')
  autocmd InsertLeave * call s:StripTrailingWhitespaces()
augroup END

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
augroup template
  autocmd! BufNewFile * call LoadTemplate()
augroup END

augroup vimrc
  autocmd!
  autocmd bufwritepost .vimrc source ~/.vimrc | redraw | echo 'vimrc reloaded'
augroup END

set secure

