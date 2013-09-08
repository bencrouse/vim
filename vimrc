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
set nofoldenable                                 " Turn off automatic code folding

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
hi CursorLine cterm=NONE ctermfg=NONE ctermbg=235 guibg=#222222
autocmd WinEnter * setlocal cursorline           " Show current line highlight when entering a window
autocmd WinLeave * setlocal nocursorline         " Remove current line highlight when leaving a window

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
set directory=$HOME/.vim/tmp                     " Keep swap files in one location

set laststatus=2                                 " Show the status line all the time

set t_Co=256
syntax enable
set background=dark
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
colorscheme solarized                            " Set colors

set list                                         " Show hidden characters
set listchars=tab:▸\ ,trail:·                    " Set hidden characters

au FocusLost * :wa                                " Automatically save files when they lose focus

" Autocomplete
set complete=.,b,u,]

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor

  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<Tab>"
  endif

  return "\<C-P>"                                 " existing text matching
endfunction

inoremap <Tab> <C-R>=Smart_TabComplete()<CR>

" Remap Ack
nnoremap <Leader>a :Ack
nnoremap <Leader>W :%s/\s\+$//<cr>:let @/=''<CR> " Remap :W to strip EOL whitespace

" Buffer movement mappings
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

" NERDTree configuration
map <Leader>n :NERDTreeToggle<CR>                 " Map :n to toggle tree navigation

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Highlight current word matches
autocmd CursorMoved * silent! exe printf('match SpellLocal /\<%s\>/', expand('<cword>'))

" File type detection

" Ruby
au BufNewFile,BufRead *.rb,*.rbw,*.gem,*.gemspec set filetype=ruby

" Rakefile
au BufNewFile,BufRead [rR]akefile,*.rake         set filetype=ruby

" IRB config
au BufNewFile,BufRead .irbrc,irbrc               set filetype=ruby

" Rackup
au BufNewFile,BufRead *.ru                       set filetype=ruby

" Capistrano
au BufNewFile,BufRead Capfile                    set filetype=ruby

" Bundler
au BufNewFile,BufRead Gemfile                    set filetype=ruby

" Autotest
au BufNewFile,BufRead .autotest                  set filetype=ruby

" JBuilder
au BufNewFile,BufRead *.jbuilder                 set filetype=ruby

" eRuby
au BufNewFile,BufRead *.erb,*.rhtml              set filetype=eruby

" God
au BufNewFile,BufRead *.god                      set filetype=ruby


" File type tab settings
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=2
autocmd FileType eruby set tabstop=4 shiftwidth=4 expandtab softtabstop=4
autocmd FileType javascript set tabstop=4 shiftwidth=4 expandtab softtabstop=4

