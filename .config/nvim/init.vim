set smartcase
set tabstop=4
set smartindent
set shiftwidth=4
set expandtab
set mouse=
autocmd BufNewFile,BufRead *.lpp,*.ypp set syntax=cpp

call plug#begin(stdpath('data') . '/plugged')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

"lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}
