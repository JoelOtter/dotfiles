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
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'mhinz/vim-signify'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'towolf/vim-helm'
call plug#end()
let g:coc_global_extensions = [
      \'coc-json',
      \'coc-tsserver',
      \'coc-yaml',
      \'coc-sh',
      \'coc-go',
      \'coc-pyright',
      \'coc-java',
      \]

" Colours etc
syntax on
if exists('$BASE16_THEME')
      \ && (!exists('g:colors_name') || g:colors_name != 'base16-$BASE16_THEME')
    let base16colorspace=256
    colorscheme base16-$BASE16_THEME
    hi! CocMenuSel ctermbg=Black
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

" To make changes, reenable this, snapshot and disable again.
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W'],
      \'x'    : '#(tmux-spotify-info)',
      \'y'    : ['#{battery_icon} #{battery_percentage} ﬙ #{cpu_percentage}  #{ram_percentage}', '%Y-%m-%d', '%R'],
      \'z'    : '#H',
      \'options' : {'status-justify' : 'left'}}

" Map leader to space bar
" Leader w saves, leader-q closes tab.
nnoremap <Space> <nop>
let mapleader=" "
noremap <Leader>w   :update<CR>
noremap <Leader>q   :bp\|bd #<CR>
noremap <Leader>e   :e<CR>
noremap <Leader>a   :set wrap!<CR>
noremap <Leader>x   :Lexplore<CR>
noremap <Leader>v   :vsplit<CR>
noremap <Leader>y   :Files<CR>
noremap <Leader>t   :GFiles<CR>
noremap <Leader>r   :CocList symbols<CR>
noremap <Leader>h   :noh<CR>
noremap <Leader>s   :set spell! spelllang=en_gb<CR>
noremap <Leader>gt  :GoTest<CR>
noremap <Leader>gtf :GoTestFunc<CR>
noremap <Leader>=   <C-w>=
nmap <F8> :Vista!!<CR>
nmap <F9> :bp<CR>
nmap <F10> :bn<CR>
nmap <TAB> :Vista finder<CR>
nmap <F1> <NOP>

""
" coc settings
""
set signcolumn=yes
set cmdheight=2
set shortmess+=c
set hidden

" tab completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <Leader>ca <Plug>(coc-codeaction)
xmap <leader>ca <Plug>(coc-codeaction-selected)
xmap <Leader>cf <Plug>(coc-format-selected)
nmap <Leader>cf <Plug>(coc-format-selected)
nmap <Leader>cg <Plug>(coc-fix-current)
nmap <Leader>cr <Plug>(coc-rename)
nmap <C-]> <Plug>(coc-definition)
nmap <Leader>c] <Plug>(coc-references)

nnoremap <silent> <Leader>cd  :<C-u>CocList diagnostics<CR>

let g:vista_default_executive = 'coc'
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_fzf_preview = ['right:50%']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

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
set colorcolumn=81

autocmd FileType cpp,c,objc,objcpp,cmake setlocal noexpandtab
