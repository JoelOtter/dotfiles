if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

lua require('user.settings')
lua require('user.mappings')
lua require('user.plugins')

" Plugins
"call plug#begin('~/.vim/plug')
"Plug 'chriskempson/base16-vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'edkolev/tmuxline.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'junegunn/fzf', { 'do': './install --bin' }
"Plug 'junegunn/fzf.vim'
"Plug 'liuchengxu/vista.vim'
"Plug 'mhinz/vim-signify'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'tpope/vim-fugitive'
"Plug 'towolf/vim-helm'
"Plug 'lluchs/vim-wren'
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
"call plug#end()
let g:coc_global_extensions = [
      \'coc-json',
      \'coc-tsserver',
      \'coc-yaml',
      \'coc-sh',
      \'coc-go',
      \'coc-pyright',
      \'coc-java',
      \'coc-cmake',
      \'coc-lua',
      \]

" General appearance tings - numbers and cursor etc
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" To make changes, reenable this, snapshot and disable again.
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W'],
      \'x'    : '#(tmux-spotify-info)',
      \'y'    : ['#{battery_icon} #{battery_percentage} 󰘚 #{cpu_percentage} 󰍛 #{ram_percentage}', '%Y-%m-%d', '%R'],
      \'z'    : '#H',
      \'options' : {'status-justify' : 'left'}}

noremap <Leader>y   :Files<CR>
noremap <Leader>t   :GFiles<CR>
noremap <Leader>r   :CocList symbols<CR>
noremap <Leader>g   :Goyo<CR>
nmap <F8> :Vista!!<CR>
nmap <TAB> :Vista finder<CR>

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
let g:goyo_width=81


autocmd FileType cpp,c,objc,objcpp,cmake setlocal noexpandtab

" Goyo
function! s:goyo_enter()
  set scrolloff=999
  set linebreak
  set textwidth=80
  CocDisable
  Limelight
endfunction

function! s:goyo_leave()
  set scrolloff=5
  set nolinebreak
  set textwidth=0
  CocEnable
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
