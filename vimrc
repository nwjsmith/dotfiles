" Relative line numbers in normal mode, absolute in insert mode
set number relativenumber
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set number relativenumber
autocmd WinEnter * :set number relativenumber
autocmd WinLeave * :set number norelativenumber

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

" Ignore some files in completion menu
set wildignore+=*.pyc,*/__pycache__/

" Write file after every command
set autowrite

" Highlight all search matches
set hlsearch
" Underline matches
highlight Search cterm=underline term=underline gui=underline
" Ignore case unless the pattern contains uppercase letters
set smartcase
" Completion with proper caseing
set infercase

" Restore last location in file
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Use the ripgrep if available
if executable('rg')
  " Use rg instead of grep
  set grepprg=rg\ --column\ --color=never

  " Use rg for ctrlp for listing files
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'

  " rg is fast enough that we don't need caching
  let g:ctrlp_use_caching = 0
endif

" Strip whitespace on save
autocmd BufWritePre *.{rb,py,js,hs,c,h,haml,erb,rake,txt} :%s/\s\+$//e

" Force markdown on *.md
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" ',' key is easier to reach than the default '\'
let mapleader=","

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

" Subforms align to the same column:
"
" Good:   Bad:
"  (foo    (foo
"   bar      bar
"   baz)     baz)
let g:clojure_align_subforms=1
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^try']
let g:clojure_syntax_keywords = {
  \ 'clojureMacro': ['defproject', 'deftask'],
  \ }

" Use a minimal shell for running commands
set shell=/bin/sh

function! Figwheel()
  execute "Eval (do (require '[figwheel-sidecar.repl-api]) (figwheel-sidecar.repl-api/start-figwheel! \"dev\" \"devcards\"))"
endfunction
autocmd FileType clojure command! Figwheel :execute Figwheel()

function! Figgieback()
  execute "Piggieback (do (require '[figwheel-sidecar.repl-api]) (figwheel-sidecar.repl-api/repl-env \"dev\"))"
endfunction
autocmd FileType clojure command! Figgieback :execute Figgieback()

" Keep private things in .vimrc.local
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
