nnoremap <SPACE> <Nop>
let mapleader = " "
set number
set relativenumber
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=80
set expandtab
set updatetime=300
set signcolumn=number
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:vimtex_view_general_viewer = '${pkgs.evince}/bin/evince'
colorscheme onedarkpro
let g:airline_theme = 'onedark'

autocmd TermOpen term://*toggleterm#*
      \ tnoremap <buffer><c-\> <Cmd>exe v:count1 . "ToggleTerm"<CR>
autocmd TermOpen term://*toggleterm#*
      \ nnoremap <buffer><LeftRelease> <LeftRelease>i
autocmd TermOpen term://*toggleterm#*
      \ nnoremap <buffer><ESC> <C-\><C-n>

nnoremap <silent><c-\> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-\> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>


inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

noremap <C-t> <Cmd>NERDTreeToggle<CR>

lua require("gitsigns").setup()
