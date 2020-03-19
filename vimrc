if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plug')
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
call plug#end()
let g:coc_global_extensions = [
      \'coc-json',
      \'coc-tsserver',
      \'coc-yaml',
      \]

" Colours etc
syntax on
colorscheme base16-default-dark
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" General appearance tings - numbers and cursor etc
set number
set cursorline
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
filetype indent on
filetype on
filetype plugin on

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W'],
      \'x'    : '#(tmux-spotify-info)',
      \'y'    : ['%Y-%m-%d', '%R'],
      \'z'    : '#H',
      \'options' : {'status-justify' : 'left'}}

" Map leader to space bar
" Leader w saves, leader-q closes tab.
nnoremap <Space> <nop>
let mapleader=" "
noremap <Leader>w :update<CR>
noremap <Leader>q :bp\|bd #<CR>
noremap <Leader>e :e<CR>
noremap <Leader>a :set wrap!<CR>
noremap <Leader>x :Lexplore<CR>
noremap <Leader>v :vsplit<CR>
noremap <Leader>r :CommandTTag<CR>
noremap <Leader>f :Files<CR>
noremap <Leader>t :GFiles<CR>
noremap <Leader>h :noh<CR>
noremap <Leader>g :! /usr/local/bin/ctags -R -f tags .<CR>
noremap <Leader>s :set spell! spelllang=en_gb<CR>
nmap <F9> :bp<CR>
nmap <F10> :bn<CR>

" General plugin config stuff. I use buffers.
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0

" netrw stuff
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:netrw_list_hide = &wildignore

" Misc
set laststatus=2
set mouse=a
set smarttab
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set clipboard=unnamed
set backspace=2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set hidden " stop empty buffers showing in tabline
set updatetime=200 " some plugins need to refresh fast
set hlsearch
set incsearch
if has('mouse_sgr')
  set ttymouse=sgr
endif
set noswapfile
