execute pathogen#infect()

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

" Map leader to space bar
" Leader w saves, leader-q closes tab.
nnoremap <Space> <nop>
let mapleader=" "
noremap <Leader>w :update<CR>
noremap <Leader>q :bd<CR>
noremap <Leader>n :NERDTreeToggle<CR>
nmap <F9> :bp<CR>
nmap <F10> :bn<CR>

" General plugin config stuff. I use buffers.
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:CommandTTraverseSCM = "pwd" " Cmd-T only traverses current dir down
let g:jsx_ext_required = 0

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
set updatetime=250 " some plugins need to refresh fast
