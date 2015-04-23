set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

set nobackup
set noswapfile

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Buffers
set hidden

"" Line numbers
set number

"" Pathogen
execute pathogen#infect()

"" ctrl-p
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|_darcs\|_site'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 'v'

"" Solarized
if !has('gui_running')
    " Compatibility for Terminal
    let g:solarized_termtrans=1
    " Make Solarized use 16 colors for Terminal support
    let g:solarized_termcolors=256
else
    " highlight current column and row
    set cursorline
    set cursorcolumn
endif
set background=dark
colorscheme solarized

" Clear vertical bar
set fillchars+=vert:\│
hi clear VertSplit

"" Haskell
" Configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

"" Org-mode
let g:org_heading_shade_leading_stars = 1

" on OS X, this leads to using system clipboard
set clipboard+=unnamed

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

let mapleader = ","
nmap <leader>v :edit $MYVIMRC<CR>


" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" remap <Esc>
imap jj <Esc>

" Insert a single character : http://vim.wikia.com/wiki/Insert_a_single_character
":nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
":nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

" VimCasts #14: The :edit command
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%


" Don't show tab bar
set showtabline=0

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction


set wildmenu
set wildmode=full

let g:netrw_liststyle=3 " Use tree-mode as default view

" Easier way to turn off search highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

let g:pandoc#modules#disabled = ["folding", "spell", "bibliographies"]

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
