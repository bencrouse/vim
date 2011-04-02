set nocompatible                                 " Must come first because it changes other options.
filetype off                                     " Turn off file type to allow pathogen to load

call pathogen#runtime_append_all_bundles()

filetype plugin indent on                        " Turn on file type detection.
syntax on                                        " Turn on syntax highlighting.

let mapleader=":"                                " Set leader

set tabstop=4                                    " Set tab size
set shiftwidth=4                                 " Set how many columns text gets indented with indent operations
set noexpandtab                                  " Don't autoconvert tabs into spaces
set autoindent                                   " Set automatic indenting

set nowrap                                       " Turn off line wrapping.
set foldlevel=1                                  " Turn off automatic code folding

set showcmd                                      " Display incomplete commands.
set showmode                                     " Display the mode you're in.

set backspace=indent,eol,start                   " Intuitive backspacing.

set hidden                                       " Handle multiple buffers better.

set wildmenu                                     " Enhanced command line completion.
set wildmode=list:longest,list:full              " Complete files like a shell.
set wildignore+=.git                             " Ignore .git directory in completion

set number                                       " Show line numbers.
set ruler                                        " Show cursor position.
set cursorline                                   " Highlight current line
hi CursorLine cterm=NONE ctermbg=black

set incsearch                                    " Highlight matches as you type.
set hlsearch                                     " Highlight matches.
nnoremap <CR> :noh<CR><CR>                       " This unsets the last search pattern register by hitting return
set ignorecase                                   " Case-insensitive searching
set smartcase                                    " Search case-insensitive when search string is all-lowercase,
                                                 " otherwise search case-sensitive

set scrolloff=4                                  " Lines of context around the cursor.

set title                                        " Set the terminal's title

set visualbell                                   " No beeping.

set nobackup                                     " Don't make a backup before overwriting a file.
set nowritebackup                                " And again.
set directory=$HOME/.vim/tmp//,.                 " Keep swap files in one location

set laststatus=2                                 " Show the status line all the time

set background=dark
colorscheme solarized                            " Set colors

set list                                         " Show hidden characters
set listchars=tab:▸\ ,eol:¬                      " Set hidden characters
highlight NonText ctermfg=4 guifg=#4a4a59        " Set hidden characters color

" Remap Ack
nnoremap <Leader>a :Ack
nnoremap <Leader>W :%s/\s\+$//<cr>:let @/=''<CR> " Remap :W to strip EOL whitespace

" Tab mappings.
map <Leader>tt :tabnew<cr>
map <Leader>te :tabedit
map <Leader>tc :tabclose<cr>
map <Leader>to :tabonly<cr>
map <Leader>tn :tabnext<cr>
map <Leader>tp :tabprevious<cr>
map <Leader>tf :tabfirst<cr>
map <Leader>tl :tablast<cr>
map <Leader>tm :tabmove

au FocusLost * :wa                                " Automatically save files when they lose focus

" NERDTree configuration
map <Leader>n :NERDTreeToggle<CR>                 " Map :n to toggle tree navigation

" Command-T configuration
let g:CommandTMaxHeight=20

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

