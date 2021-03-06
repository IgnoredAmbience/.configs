filetype off

execute pathogen#infect()
Helptags

" Set local leader to , (Leader is \)
let maplocalleader = ","

" Tabbing
set expandtab
set shiftwidth=2
set softtabstop=2
set textwidth=120
set colorcolumn=+1
set background=dark
set modeline

" Set comment formatting options:
" j: remove single line comments
set fo+=j

" Colours / Filetypes
let g:inkpot_black_background = 1
colorscheme inkpot

filetype plugin indent on
syntax on

" Maps Coquille commands to CoqIDE default key bindings
au FileType coq call coquille#CoqideMapping()
let g:coquille_auto_move='true'
let g:localvimrc_whitelist='.*/jscert[^/]*/coq/.*'

" Syntastic overrides
let g:syntastic_mode_map = { "mode": "active", "active_filetypes": [], "passive_filetypes": ["python"] }
let g:syntastic_go_checkers = ["go"]
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1

autocmd User AirlineAfterInit call SetSyntasticSigns()
function! SetSyntasticSigns()
  " The below aren't spaces, but Braille Blank characters. Vim doesn't like spaces.
  let g:syntastic_error_symbol         = "⠀" . g:airline_left_sep
  let g:syntastic_warning_symbol       = "⠀" . g:airline_left_alt_sep
  let g:syntastic_style_error_symbol   = "⠀" . g:airline_right_sep
  let g:syntastic_style_warning_symbol = "⠀" . g:airline_right_alt_sep
endfunction

let g:pymode_options = 0
let g:pymode_folding = 0

" Tab completion
set wildignore=*.o,*.pyc,*.pdf,*.class,*.aux,*.hi
set wildmode=longest,list,full
set wildmenu

set ruler
set viminfo=""
set tags=./tags;,./TAGS;

set mouse=a
set ttymouse=xterm2

set guioptions=aceig
set guifont=Inconsolata\ 10

" Search highlight
set hlsearch
" Cancel search highlight with \\
map <silent> <Leader><Leader> :noh<cr>

set incsearch

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = ""

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

command Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw

" Additional keybindings for window splits:
nmap <C-W><S-Left>  :topleft  vnew<CR>
nmap <C-W><S-Right> :botright vnew<CR>
nmap <C-W><S-Up>    :topleft  new<CR>
nmap <C-W><S-Down>  :botright new<CR>

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
let g:syntastic_ocaml_checkers = ['merlin']

set secure
" ## added by OPAM user-setup for vim / ocp-indent ## cf1253c7dd3831ad444f3ae2e75765ca ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/home/thomas/.opam/4.04.2/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
