set nocompatible         
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

set ignorecase
set smartcase

let mapleader=","

" in Command-T, make <CR> open file in a new tab
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'

" config Tube plugin to send commands to iTerm
let g:tube_terminal = "iterm"

inoremap jj <ESC>
nnoremap <leader>r :e .<CR> 
nnoremap <leader>d :Dash<CR>
"map <D-F8> :Rake<CR>
"map <D-S-F8> :.Rake<CR>

" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

map <C-{> :tabp<CR>
map <C-}> :tabn<CR>

" RSpec
let g:rspec_runner = "os_x_iterm"
map <C-F8> :call RunCurrentSpecFile()<CR>
map <C-S-F8> :call RunAllSpecs()<CR>
map <C-F9> :call RunLastSpec()<CR>
map <C-S-F9> :call RunNearestSpec()<CR>

" Tube
map <C-F7> :TubeLastCmd<CR>

" typos
iab palylist playlist
