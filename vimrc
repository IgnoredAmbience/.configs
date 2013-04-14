call pathogen#infect()

" Tabbing
set expandtab
set shiftwidth=2
set softtabstop=2
set textwidth=80
set colorcolumn=+1
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

set hlsearch
set incsearch

let g:tex_flavor='pdflatex'

"Trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
function! FixTrailingWhitespace()
  let l:winview = winsaveview()
  %s/\s\+$//e
  call winrestview(l:winview)
endfunction
autocmd BufWritePre * :call FixTrailingWhitespace()

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

