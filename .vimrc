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
Plugin 'elixir-editors/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'slim-template/vim-slim'
Plugin 'janko-m/vim-test'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-db'
Plugin 'TaDaa/vimade'

" haml
Plugin 'tpope/vim-haml'

" autocomplete (neovim only)
if has("nvim")
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" JS & React
Plugin 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plugin 'mxw/vim-jsx'

" Typescript tsx
Plugin 'ianks/vim-tsx'

" Elm
Plugin 'lambdatoast/elm.vim'

" CoffeeScript
Plugin 'kchmck/vim-coffee-script'

" Kotlin
Plugin 'udalov/kotlin-vim'

" Imba
Plugin 'simeng/vim-imba'

" writing
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'szw/vim-dict'

" colorscheme
Plugin 'mhartington/oceanic-next'
Plugin 'albertorestifo/github.vim'

" show colors in CSS files
Plugin 'chrisbra/Colorizer'

" these are all for snipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'nelstrom/vim-pml'

call vundle#end()
" ------------- end vundle -----------------------

filetype plugin indent on
syntax on
colorscheme OceanicNext

" JS stuff
" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Minimal LSP configuration for JavaScript
let g:LanguageClient_serverCommands = {}
if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  " Use LanguageServer for omnifunc completion
  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
else
  echo "javascript-typescript-stdio not installed!\n"
  :cq
endif

" full color support
if has("termguicolors")
  set termguicolors
endif

if !has("nvim")
  set guifont=Source\ Code\ Pro\ Medium:h14
endif
set linespace=3
set foldcolumn=0

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set number
set ruler

set ignorecase
set smartcase

set relativenumber

" turn on JSX highlighting in all file types
let g:jsx_ext_required = 0

let mapleader=","

" don't automatically fold sections in Markdown files
let g:vim_markdown_folding_disabled=1

" deoplete
let g:python_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
  \]
set completeopt=longest,menuone
let g:deoplete#sources = {}
"let g:deoplete#sources['javascript.jsx'] = ['file', 'ternjs']
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

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
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0 " You don't need to cache

" needed for gitgutter
let g:gitgutter_terminal_reports_focus=0

" reset tslime variables (SendToTmux session, window, pane)
map <leader>rst :unlet g:tslime<CR>

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
map <F9> :w<CR>@:
imap <F9> <esc>:w<CR>@:

map <leader>n :bprevious<CR>
map <leader>m :bnext<CR>
map <leader>w :bd<CR>
map <leader>b :CtrlPBuffer<CR>

map <leader>i :set invnumber<CR>

" search
command -nargs=+ ARb :Ack --ruby <args>
let g:ackprg = 'rg --vimgrep --no-heading'
map <leader>k :Ack! <cword><CR>
map <leader>K :ARb <cword><CR>
map <leader>ak :Ack!<Space>

" close all
map <leader>W :bufdo bd<CR>

" copy selection to clipboard
map <leader>pc :%w !pbcopy<CR><CR>

" move selected block up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" forward by _ character
map <leader>ff f_

" Testing
let test#strategy = "tslime"
map <leader>f :TestFile<CR>
map <leader>s :TestNearest<CR>
map <leader>l :TestLast<CR>
map <leader>a :TestSuite<CR>
map <leader>tr :unlet g:tslime<CR>

" EZ editing and sourcing of .vimrc
:nnoremap <leader>ev :split $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Capybara testing - open most recent screenshot
nnoremap <leader>ss :silent !open `ls -t tmp/screenshots/*.png \| head -n1` <cr>

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
  setlocal spell spelllang=en_us
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

" colorizer
let g:colorizer_auto_filetype='css,html,scss,sass'

