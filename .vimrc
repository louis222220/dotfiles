" Hybrid line numbers
:set number relativenumber
" Display the number of line and character
:set ruler

" Link y with clipboard
:set clipboard=unnamed

filetype plugin indent on
" show existing tab with 4 spaces width
:set tabstop=2
" when indenting with '>', use 4 spaces width
:set shiftwidth=2

" Language syntax highlight
:syntax on

" 離開 Insert mode 時切換回英文
autocmd InsertLeave * call system('im-select com.apple.keylayout.ABC')

