set nocompatible                                 " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

syntax enable                                    " Turn on syntax highlighting.
filetype plugin indent on                        " Turn on file type detection.

set showcmd                                      " Display incomplete commands.
set showmode                                     " Display the mode you're in.

set backspace=indent,eol,start                   " Intuitive backspacing.

set hidden                                       " Handle multiple buffers better.

set wildmenu                                     " Enhanced command line completion.
set wildmode=list:longest,list:full              " Complete files like a shell.
set wildignore+=.git                             " Ignore .get directory in completion

set ignorecase                                   " Case-insensitive searching.
set smartcase                                    " But case-sensitive if expression contains a capital letter.

set number                                       " Show line numbers.
set ruler                                        " Show cursor position.

set incsearch                                    " Highlight matches as you type.
set hlsearch                                     " Highlight matches.
set ignorecase                                   " Case-insensitive searching
set smartcase                                    " Search case-insensitive when search string is all-lowercase,
                                                 " otherwise search case-sensitive

set wrap                                         " Turn on line wrapping.
set list                                         " Show hidden characters
set listchars=tab:▸\ ,eol:¬                      " Set hidden characters
highlight NonText guifg=#4a4a59                  " Set hidden characters color

set scrolloff=4                                  " Lines of context around the cursor.

set title                                        " Set the terminal's title

set visualbell                                   " No beeping.

set nobackup                                     " Don't make a backup before overwriting a file.
set nowritebackup                                " And again.
set directory=$HOME/.vim/tmp//,.                 " Keep swap files in one location

set laststatus=2                                 " Show the status line all the time

colorscheme vividchalk                           " Set colors

nnoremap <leader>a :Ack                          " Remap Ack
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> " Remap :W to strip EOL whitespace

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

au FocusLost * :wa                               " Automatically save files when they lose focus

" NERDTree configuration
map <Leader>n :NERDTreeToggle<CR>                " Map :n to toggle tree navigation

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif
