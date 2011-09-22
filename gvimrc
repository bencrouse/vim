set guifont=Menlo-Regular:h12                         " Font family and font size.
set antialias                                         " MacVim: smooth fonts.
set encoding=utf-8                                    " Use UTF-8 everywhere.
set guioptions-=T                                     " Hide toolbar.
set background=light                                  " Background.
set lines=80 columns=200                              " Window dimensions.
set guioptions-=r                                     " Don't show right scrollbar
set guioptions-=T                                     " Don't show the toolbar

set background=dark
colorscheme solarized                                 " Set colors

set cursorline                                        " Highlight current line"

map <D-F> :Ack<space>                                 " Command-Shift-F for Ack
map <D-/> <plug>NERDCommenterToggle<CR>               " Command-/ to toggle comments
