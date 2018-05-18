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
noremap <Leader>q :bp\|bd #<CR>
noremap <Leader>e :e<CR>
noremap <Leader>a :set wrap!<CR>
noremap <Leader>x :Lexplore<CR>
noremap <Leader>v :vsplit<CR>
noremap <Leader>r :CommandTTag<CR>
noremap <Leader>h :noh<CR>
noremap <Leader>g :! /usr/local/bin/ctags -R -f tags .<CR>
nmap <F9> :bp<CR>
nmap <F10> :bn<CR>

" General plugin config stuff. I use buffers.
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_java_checkers = []
let g:CommandTTraverseSCM = "pwd" " Cmd-T only traverses current dir down
let g:jsx_ext_required = 0
let g:ycm_autoclose_preview_window_after_completion = 1

" Specific syntastic bits
let g:syntastic_c_include_dirs = ['/usr/local/include/SDL2']
let g:syntastic_cpp_include_dirs = ['/usr/local/include/SDL2']

" netrw stuff
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:netrw_list_hide = &wildignore

" YCM
noremap <Leader>yt :YcmCompleter GetType<CR>
noremap <Leader>yg :YcmCompleter GoTo<CR>
noremap <Leader>yf :YcmCompleter FixIt<CR>

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
set hlsearch
set incsearch
