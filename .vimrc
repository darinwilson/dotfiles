set nocompatible
set hidden
filetype off

" ------------ begin vundle ---------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'mileszs/ack.vim'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
Plugin 'troydm/easybuffer.vim'
Plugin 'wting/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'elixir-lang/vim-elixir'
Plugin 'c-brenn/mix-test.vim'
Plugin 'scrooloose/nerdcommenter'

" markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" JS & React
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Elm
Plugin 'lambdatoast/elm.vim'

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

" turn on JSX highlighting in all file types
let g:jsx_ext_required = 0

let mapleader=","

" don't automatically fold sections in Markdown files
let g:vim_markdown_folding_disabled=1

inoremap jj <ESC>
nnoremap <leader>r :NERDTree<CR>
nnoremap <leader>R :NERDTreeClose<CR>
"nnoremap <leader>r :NERDTree<CR> <bar> :!tmux resize-pane -t 2 -L 30<CR>
"nnoremap <leader>R :NERDTreeClose<CR> <bar> :!tmux resize-pane -t 2 -R 30<CR><CR>
nnoremap <leader>d :Dash<CR>

" strip trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP `pwd`'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.git|node_modules|doc|deps|_build)$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }


" Ctrl-S = save
" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> :w<CR>
imap <C-s> <esc>:w<CR>

" run specs
map <F8> :w<CR>:call TestLast()<CR>
imap <F8> <esc>:w<CR>:call TestLast()<CR>
"map <F8> :wa<CR>:call SendToTmux("q\x3rake spec\n")<CR>
"map <F8> <esc>:wa<CR>:call SendToTmux("q\x3rake spec\n")<CR>

" RM Android - save all and run on device
map <F9> :wa<CR>:call SendToTmux("\x3\x3rake device\n")<CR>
imap <F9> <esc>:wa<CR>:call SendToTmux("\x3\x3rake device\n")<CR>
map <F7> :wa<CR>:call SendToTmux("\x3\x3rake clean; rake \n")<CR>
imap <F7> <esc>:wa<CR>:call SendToTmux("\x3\x3rake clean; rake \n")<CR>

" save and run last command
"map <F9> :w<CR>@:
"imap <F9> <esc>:w<CR>@:

map <leader>n :bprevious<CR>
map <leader>m :bnext<CR>
map <leader>w :bd<CR>
map <leader>b :CtrlPBuffer<CR>

map <leader>i :set invnumber<CR>

" search
command -nargs=+ ARb :Ack --ruby <args>
map <leader>k :Ack <cword><CR>
map <leader>K :ARb <cword><CR>

" close all
map <leader>W :1,1000bd<CR>

" Testing
let g:rspec_command = 'call Send_to_Tmux("bin/rspec {spec}\n")'
map <leader>f :call TestCurrentFile()<CR>
map <leader>s :call TestNearest()<CR>
map <leader>l :call TestLast()<CR>
map <leader>a :call TestAll()<CR>

let g:mix_test_command = 'call Send_to_Tmux("mix test {test}\n")'

function! TestCurrentFile()
  if InMixTestFile()
    call MixRunCurrentTestFile()
  else
    call RunCurrentSpecFile()
  endif
endfunction

function! TestNearest()
  if InMixTestFile()
    call MixRunCurrentTest()
  else
    call RunNearestSpec()
  endif
endfunction

function! TestLast()
  if InMixProject()
    call MixRunLastTest()
  else
    call RunLastSpec()
  endif
endfunction

function! TestAll()
  if InMixProject()
    call MixRunAllTests()
  else
    call RunAllSpecs()
    rspec.vim
  endif
endfunction

" EZ editing and sourcing of .vimrc
:nnoremap <leader>ev :split $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" word wrapping for prose mode
:nnoremap <leader>pm :set wrap<cr>:set linebreak<cr>:set nolist<cr>

" tmux
function! CmdToTmux()
  call inputsave()
  let cmd = input('Command: ')
  let s:last_tmux_cmd = cmd
  call inputrestore()
  call SendToTmux(cmd . "\n")
endfunction

function! RunLastCmdToTmux()
  if exists("s:last_tmux_cmd")
    call SendToTmux(s:last_tmux_cmd . "\n")
  endif
endfunction

map <leader>t :call CmdToTmux()<CR>
map <leader>rt :wa<CR>:call RunLastCmdToTmux()<CR>

" blendspace
:nnoremap <leader>nhc :call SendToTmux("npm run health-check\n")<CR>
