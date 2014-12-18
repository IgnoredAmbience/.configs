execute pathogen#infect()
execute "Helptags"

" Set local leader to \ (as well as leader)
let maplocalleader = ","

" Tabbing
set expandtab
set shiftwidth=2
set softtabstop=2
set textwidth=120
set colorcolumn=+1
set background=dark
set modeline

" Colours / Filetypes
let g:inkpot_black_background = 1
colorscheme inkpot

syntax enable
filetype plugin indent on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Maps Coquille commands to CoqIDE default key bindings
au FileType coq call coquille#CoqideMapping()
let g:coquille_auto_move='true'
let g:localvimrc_whitelist='/homes/tw1509/jscert_dev/coq/.*'

" OCaml support
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers = ['merlin']

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

" Search highlight
set hlsearch
" Cancel search highlight with \\
map <silent> <Leader><Leader> :noh<cr>

set incsearch

let g:tex_flavor='pdflatex'

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
augroup highlight_whitespace
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
augroup END

" Fix trailing whitespace only on lines in range between entering and leaving insert mode
function! s:StripTrailingWhitespaces()
  let l:winview = winsaveview()
  exe b:insert_start . ',.s/\s\+$//e'
  call winrestview(l:winview)
endfun
augroup strip_whitespace
  autocmd InsertEnter * let b:insert_start = line('.')
  autocmd InsertLeave * call s:StripTrailingWhitespaces()
augroup END

"File Templates
function! LoadTemplate()
  silent! 0r ++edit ~/.vim/skel/tmpl.%:e:e
  " Highlight %VAR% placeholders with the Todo colour group
  syn match Todo "%\u\+%" containedIn=ALL
endfunction
augroup file_templates
  autocmd! BufNewFile * call LoadTemplate()
augroup END

augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc | redraw | echo 'vimrc reloaded'
augroup END

set secure

