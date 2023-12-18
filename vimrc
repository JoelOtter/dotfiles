lua require('user.settings')
lua require('user.mappings')
lua require('user.plugins')

" Plugins
"call plug#begin('~/.vim/plug')
"Plug 'edkolev/tmuxline.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'liuchengxu/vista.vim'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"call plug#end()

" To make changes, reenable this, snapshot and disable again.

noremap <Leader>r   :CocList symbols<CR>
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

autocmd FileType cpp,c,objc,objcpp,cmake setlocal noexpandtab
