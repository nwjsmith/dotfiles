" Relative line numbers in normal mode
set number relativenumber

" Use Bash for shell
set shell=/usr/bin/env\ bash

" Use 4 characters for the number column
set numberwidth=4

" Solarized is nice
set background=light
colorscheme solarized

" Show path, filetype, modified on right, line and column on left
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%)

" Show trailing whitespace
set list

" Expand windows when moving into them
set winwidth=85
set winheight=10
set winminheight=10
set winheight=999

" Wrap on word boundary
set linebreak

" No lines longer than 80 characters, old man
if exists('+colorcolumn')
  set colorcolumn=81
endif

" Turn off folding
set foldmethod=manual
set nofoldenable

" Show matching bracket when one is inserted
set showmatch

" Round to multiple of shiftwidth when using > or <
set shiftround

" Help with Press ENTER prompts
set cmdheight=2

" No need for backups, you are using Git, right?
set nobackup
set nowritebackup
set noswapfile

" Write file after every command
set autowrite

" Highlight all search matches
set hlsearch
" Underline matches
highlight Search cterm=underline term=underline gui=underline
" Ignore case unless the pattern contains uppercase letters
set smartcase
" Completion with proper casing
set infercase

" Use the ripgrep if available
if executable('rg')
  " Use rg instead of grep
  set grepprg=rg\ --column\ --color=never

  " Use rg for ctrlp for listing files
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'

  " rg is fast enough that we don't need caching
  let g:ctrlp_use_caching = 0
endif

" ',' key is easier to reach than the default '\'
let mapleader=','

" Allow the mouse in every mode
set mouse=a

" Y should behave like C and D in normal mode
nnoremap Y y$

" Make Ctrl-C behave the same as Escape
imap <C-c> <ESC>

" Use Enter as your test key
nnoremap <silent> <leader>, :TestNearest<CR>
nnoremap <silent> <leader>t :TestFile<CR>
nnoremap <silent> <leader>f :TestSuite<CR>
let g:test#strategy = 'dispatch'

" Do not open quickfix window if there are no Flow errors
let g:flow#autoclose = 1

" Use system clipboard
set clipboard=unnamed

" Format shell scripts on save with spaces
let g:shfmt_extra_args='-i 2'

augroup vimrc
  " Absolute line numbers in insert mode
  autocmd InsertEnter * :set number norelativenumber
  autocmd InsertLeave * :set number relativenumber
  autocmd WinEnter * :set number relativenumber
  autocmd WinLeave * :set number norelativenumber

  " Restore last location in file
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " Strip whitespace on save
  autocmd BufWritePre *.{rb,py,js,hs,c,h,haml,erb,rake,txt} :%s/\s\+$//e

  " Force markdown on *.md
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup END

" Keep private things in .vimrc.local
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif
