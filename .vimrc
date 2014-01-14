"====================================VUNDLE============================== 
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on
"=================================VUNDLE REPO============================
Bundle 'guns/xterm-color-table.vim'
"""Vundle selfupdate
Bundle 'gmarik/vundle'
"""LaTeX
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'LaTeX-Box'
"""Sniplets
Bundle 'snipMate'
"""Fast toggle commets
Bundle 'The-NERD-Commenter'
"""Git supports
Bundle 'tpope/vim-fugitive'
"""Ctags supports
Bundle 'vim-scripts/ctags.vim'
"""Color themes
Bundle 'platinumthinker/vim-colors-solarized'
"""Erlang autocomplite and show error
Bundle 'oscarh/vimerl'
"""Tree file viwer
Bundle 'scrooloose/nerdtree'
"""Ack supports
Bundle 'mileszs/ack.vim'
"""Status bar
Bundle 'itchyny/lightline.vim'
"""Seacher
"Bundle 'kien/ctrlp.vim'
"""Super syntax
Bundle 'scrooloose/syntastic'
"""Bar of function in open file (from ctags)
Bundle 'majutsushi/tagbar'
"""Markdown folding
Bundle 'nelstrom/vim-markdown-folding'
"""Autocomplite
Bundle 'Valloric/YouCompleteMe'
"""Google calendar
Bundle 'itchyny/calendar.vim'

syntax enable
filetype plugin on
set helplang=ru,en
set title
set cursorline
set cursorcolumn
set nocompatible
" игнорировать регистр при поиске
set ic
" подсвечивать поиск
set hls
" использовать инкрементальный поиск
set is
" ширина текста 
set textwidth=80
" минимальная высота окна пусть будет 0 (по умолчанию - 1)
set winminheight=0
" всегда делать активное окно максимального размера
"set noequalalways
"set winheight=9999
" установить шрифт 
"set guifont=courier_new:h10:cRUSSIAN
" настраиваю для работы с русскими словами (чтобы w, b, * понимали
" русские слова)
set iskeyword=@,48-57,_,192-255
" задать размер табуляции в четыре пробела
set ts=4
" отображение выполняемой команды
set showcmd 
" перенос по словам, а не по буквам
set linebreak
set dy=lastline
set number
"set wrap
set colorcolumn=80
set shiftwidth=4
set smartindent
set smarttab
set expandtab
set mouse=a
set clipboard=unnamedplus

set completeopt=menu,menuone,longest
set pumheight=15

let erlang_folding=1
let erlang_show_errors=0
let	g:erlangHighlightBif=1 
let g:erlangFoldSplitFunction=1
"let g:erlangManPath="/home/thinker/erlware/man"
let g:erlangHighlightErrors=0

let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_c_compiler = 'clang'
let g:syntastic_c_compiler_options = ' -std=c11 -stdlib=libc'

let g:tagbar_autofocus = 1

"=================================KEY BINDINGS===========================
inoremap jj <ESC>
map <BS> :NERDTreeToggle<CR>
"Next error
nnoremap <F2> :lnext<CR> 
inoremap <F2> :lnext<CR> 
"Previous error
nnoremap <F3> :lprevious<CR>
inoremap <F3> :lprevious<CR>

nnoremap <F8> :Tagbar<CR>
inoremap <F8> :Tagbar<CR>
map <tab> <C-p>
"========================================================================

set wildmode=list:longest,full
set wildmenu 
set wildignore+=.git,.svn

"Markdown fix
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd

"Folds
set foldmethod=syntax
let g:markdown_fold_style = 'nested'

"setlocal spell spelllang=en_us

let &cdpath = ',' . substitute(substitute($CDPATH, '[, ]', '\\\0', 'g'), ':', ',', 'g')


"===============================FIX SLOW SCROLL==========================
set ttyfast 
set ttyscroll=3
"set lazyredraw

set synmaxcol=128
syntax sync minlines=256
"========================================================================

"==============================SOLORIZED THEME UP========================
if !has('gui_running')
    let g:Powerline_symbols = 'fancy'
    set t_Co=256
endif
syntax enable
colorscheme solarized
set background=dark
let g:solarized_termcolors = 256
let g:solarized_contrast = 'hight'
let g:solarized_visibility = 'high'
"========================================================================

filetype plugin on
set helplang=ru,en
set cursorline
set cursorcolumn
set nocompatible
set ic
set hls
set is
set textwidth=80
set winminheight=0
" Fix for russian world 
set iskeyword=@,48-57,_,192-255
" задать размер табуляции в четыре пробела
set ts=4
" отображение выполняемой команды
set showcmd 
" перенос по словам, а не по буквам
set linebreak
set dy=lastline
set number
"set wrap
set colorcolumn=80
set shiftwidth=4
set smartindent
set smarttab
set expandtab
set mouse=a
set clipboard=unnamedplus

set completeopt=menu,menuone,longest
set pumheight=15

"let erlang_folding=1
"let erlang_show_errors=0

let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_c_compiler = 'clang'
let g:syntastic_c_compiler_options = ' -std=c11 -stdlib=libc'

set runtimepath+=$HOME/.vim/vimerl

inoremap jj <ESC>
map <BS> :NERDTreeToggle<CR>
"Next error
nnoremap <F2> :lnext<CR> 
inoremap <F2> :lnext<CR> 
"Previous error
nnoremap <F3> :lprevious<CR>
inoremap <F3> :lprevious<CR>

nnoremap <F8> :TagbarToggle<CR>
inoremap <F8> :TagbarToggle<CR>
map <tab> <C-p>

call togglebg#map("<F5>")

set wildmode=list:longest,full
set wildmenu 
set wildignore+=.git,.svn

"Markdown fix
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd

"Folds
set foldmethod=syntax
let g:markdown_fold_style = 'nested'

"setlocal spell spelllang=en_us

if version >= 700
    set history=64
    set undolevels=128
    set undodir=~/.vim/undodir/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

"============================STATUS BAR SETTINGS UP======================
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'solarized_fix',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? ' ' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ 'NERD_tree' ? '' :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|NERD' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? ' '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END

function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
"========================================================================


let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
