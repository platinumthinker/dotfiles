"Vundle 
set nocompatible
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on 
"Vundle repo
Bundle 'ctags.vim'
Bundle 'clang-complete'
Bundle 'The-NERD-Commenter'
"Bundle 'Vimerl'
Bundle 'git://github.com/altercation/vim-colors-solarized.git'
Bundle 'git://github.com/jimenezrick/vimerl.git'
Bundle 'snipMate'
Bundle 'git://github.com/scrooloose/nerdtree.git'

"let g:solarized_hitrail=1    "default value is 0
set t_Co=256
let g:solarized_termcolors=256    "default value is 16
colorscheme solarized 
set background=dark
set cursorline
set cursorcolumn

syntax enable

call togglebg#map("<F5>")

filetype plugin on
set helplang=ru,en
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

let g:clang_debug=1
let g:clang_complete_copen=1
let g:clang_hl_errors=1
"let g:clang_conceal_snippets=0
"let g:clang_complete_auto=1
"let g:clang_use_library=1
"let g:clang_library_path="/usr/lib/llvm-3.2/"
"let g:clang_complete_copen=1

"let erlang_folding=1
"let erlang_show_errors=0

set runtimepath+=$HOME/.vim/vimerl
autocmd Filetype erlang setlocal omnifunc=erlang_complete#Complete

map <F2> :NERDTreeToggle<CR>

if version >= 700
    set history=64
    set undolevels=128
    set undodir=~/.vim/undodir/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif
