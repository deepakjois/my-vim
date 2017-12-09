set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
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
set nonumber
nnoremap <C-n> :set number!<CR>

" Courtesy - https://github.com/DanToml/Dotfiles/blob/master/.vimrc
" Integrate with system keyboard on Unix Systems.
"" On macOS, this is the unnamed pasteboard, on other unix systems this is +
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set clipboard=unnamed
  else
    set clipboard=unnamedplus
  endif
endif


"" Pathogen
execute pathogen#infect()

set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_termtrans=1
colorscheme solarized

set cursorline
hi CursorLine cterm=NONE ctermbg=black ctermfg=none

set cursorcolumn
hi CursorColumn cterm=none ctermbg=black ctermfg=none

" Clear vertical bar
set fillchars+=vert:\│
hi clear VertSplit

"" Org-mode
let g:org_heading_shade_leading_stars = 1

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

" Delete any netrw buffers that accumulate,
" when using vim-vinegar
autocmd FileType netrw setl bufhidden=wipe

" Easier way to turn off search highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"

let g:jsx_ext_required=0

" map key to command
map <Leader>f :Find<space>

let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1

" <C-p> for files
nnoremap <c-p> :FZF<cr>
" <C-t> for open buffers
nnoremap <leader>t :Buffers<cr>

"Jump back to last edited buffer
nnoremap <C-b> <C-^>
inoremap <C-b> <esc><C-^>

command! -bang -nargs=* Find call fzf#vim#grep( 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)

"Change bindings for terminal mode in nvim
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" Show next matched string at the center of screen
nnoremap n nzz
nnoremap N Nzz

" Change paste toggle to a more convenient option
set pastetoggle=<F2>
