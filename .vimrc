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
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/deoplete.nvim'
Plugin 'slim-template/vim-slim'
Plugin 'janko-m/vim-test'

" markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" JS & React
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Elm
Plugin 'ElmCast/elm-vim'

" writing
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'szw/vim-dict'

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

" deoplete
let g:deoplete#enable_at_startup = 1

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

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP `pwd`'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Ctrl-S = save
" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> :w<CR>
imap <C-s> <esc>:w<CR>

" run specs
map <F8> :w<CR>:TestLast<CR>
imap <F8> <esc>:w<CR>:TestLast<CR>
"map <F8> :wa<CR>:call SendToTmux("q\x3rake spec\n")<CR>
"map <F8> <esc>:wa<CR>:call SendToTmux("q\x3rake spec\n")<CR>

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
let g:ackprg = "ack -s -H --nocolor --nogroup --column --ignore-dir=node_modules --ignore-dir=deps --ignore-dir=doc --ignore-dir=priv"
map <leader>k :Ack! <cword><CR>
map <leader>K :ARb <cword><CR>
map <leader>ak :Ack!<Space>

" close all
map <leader>W :bufdo bd<CR>

" copy entire buffer to clipboard
map <leader>cb :%w !pbcopy<CR>

" Testing
let test#strategy = "tslime"
map <leader>f :TestFile<CR>
map <leader>s :TestNearest<CR>
map <leader>l :TestLast<CR>
map <leader>a :TestSuite<CR>

" EZ editing and sourcing of .vimrc
:nnoremap <leader>ev :split $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" setup for writing prose
function! SetupProseMode()
  set wrap
  set linebreak
  set nolist
  colorscheme pencil
  set background=light
  set guifont=Cousine:h14
  let g:dict_hosts = [
      \["dict.org", ["gcide", "moby-thesaurus"]]
      \]
endfunction
:nnoremap <leader>pm :call SetupProseMode()<CR>

map <leader>lu :Dict<CR>
map <leader>lt :Dict<CR>/moby-thesaurus<CR>

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

