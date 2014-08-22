set nocompatible         
set hidden
filetype off

" ------------ begin vundle ---------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'mileszs/ack.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
Plugin 'troydm/easybuffer.vim'
Plugin 'wting/rust.vim'
Plugin 'scrooloose/nerdtree'

" these are all for snipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

call vundle#end()
" ------------- end vundle -----------------------

filetype plugin indent on
syntax on
colorscheme codeschool

set guifont=Monaco:h12
set linespace=3
set foldcolumn=0

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set number
set ruler

set ignorecase
set smartcase

" Command-T hacks
let g:CommandTWildIgnore=&wildignore . ",**/cache/*"
set wildmode=list:longest,list:full
"if &term =~ "xterm" || &term =~ "screen"
"  let g:CommandTCancelMap = ['<ESC>', '<C-c>']
"endif
map <leader>T :CommandTFlush<CR>

let mapleader=","

inoremap jj <ESC>
nnoremap <leader>r :NERDTree<CR> 
nnoremap <leader>R :NERDTreeClose<CR> 
nnoremap <leader>d :Dash<CR>

" Ctrl-S = save
" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> :w<CR>
imap <C-s> <esc>:w<CR>

" save and redo the last command
map <F9> :w<CR>@@
imap <F9> <esc>:w<CR>@@

map <leader>n :bprevious<CR>
map <leader>m :bnext<CR>
map <leader>w :bd<CR>
map <leader>b :EasyBuffer<CR>

map <leader>k :Ack <cword><CR>

" RSpec
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
map <leader>f :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>a :call RunAllSpecs()<CR>

" typos
iab palylist playlist
