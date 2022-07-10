execute pathogen#infect()
set tabstop=4
set shiftwidth=4
set nu
set hls
set smartindent
set list!
set listchars=tab:>-,trail:·
set backspace=indent,eol,start
autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
filetype indent off
syntax on
au BufReadPost Jenkinsfile set syntax=groovy

" Copy registers hold up to 1000 lines when closing vim and reopening vim
set viminfo='20,<1000
