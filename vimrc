
" == General ==

" Be modern
set nocompatible

" No swap and backups, please
set noswapfile
set nowritebackup
set nobackup

" Default tab settings
set tabstop=2
set shiftwidth=2
set expandtab

" Continue comments on insert
set formatoptions+=or

" Line is not the limit
set whichwrap+=<,>,h,l,[,]

" Block selection
set virtualedit=block

" Search options
set ignorecase
set incsearch
set hlsearch
set smartcase

" Infer case in completion
set infercase

" Wildmenu settings
set wildmode=full
set wildignore+=*.pyc
set wildignore+=*.DS_Store
set wildignore+=*/_build**

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Show matching bracket
set showmatch

" No visual bell
set visualbell
set t_vb=

" == Packages ==

call plug#begin('~/.vim/bundle')

" Sensible defaults
Plug 'tpope/vim-sensible'

Plug 'rizo/vim-colemak'

Plug 'tpope/vim-eunuch'

Plug 'chriskempson/base16-vim'
Plug 'whatyouhide/vim-gotham'
Plug 'jordwalke/VimCleanColors'

" Nice statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

Plug 'ctrlpvim/ctrlp.vim'

" Syntastic syntax checker
Plug 'vim-syntastic/syntastic'
let g:syntastic_enable_signs=0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_loc_list_height=15
let g:syntastic_warning_symbol=""
let g:syntastic_error_symbol=""
highlight link SyntasticErrorLine Spellbad
highlight link SyntasticWarningLine Spellbad
highlight link SyntasticStyleErrorLine Spellbad
highlight link SyntasticStyleWarningLine Spellbad

Plug 'pbrisbin/vim-mkdir'

Plug 'tpope/vim-fugitive'

" Easy motion, go to character
Plug 'Lokaltog/vim-easymotion'
let g:EasyMotion_do_mapping = 0
nmap <leader>/ <Plug>(easymotion-overwin-f)

" Easy alignment for = with <leader-a>
Plug 'junegunn/vim-easy-align'
vmap <leader>a <Plug>(EasyAlign)

" Surround selection
Plug 'tpope/vim-surround'
let g:surround_no_mappings = 1
nmap <leader>ds <Plug>Dsurround
nmap <leader>ws <Plug>Csurround
nmap <leader>Ws <Plug>CSurround
nmap <leader>s <Plug>Ysurround
nmap <leader>S <Plug>YSurround
xmap <leader>s <Plug>VSurround
xmap <leader>S <Plug>VgSurround

" Comments with <Cmd+/>
Plug 'scrooloose/nerdcommenter'
let g:NERDCompactSexyComs = 0
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'fold': { 'left': '{-','right': '-}', 'nested': 1, 'leftAlt': '--', 'nestedAlt': 1 } }
map <D-/> <Plug>NERDCommenterToggle
imap <D-/> <Esc><Plug>NERDCommenterToggle

" Persistent filesystem sidebar
Plug 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_open_on_gui_startup = 0

" Filesystem tree buffer
Plug 'scrooloose/nerdtree'
let g:NERDTreeDirArrows = 1
let g:NERDTreeMinimalUI = 1
map <D-e> :NERDTreeTabsToggle<Cr>
imap <D-e> <Esc>:NERDTreeTabsToggle<Cr>
vmap <D-e> <Esc>:NERDTreeTabsToggle<Cr>
nmap <D-e> <Esc>:NERDTreeTabsToggle<Cr>

map <D-E> :NERDTreeTabsOpen<Cr>:NERDTreeTabsFind<Cr>
imap <D-E> <Esc>:NERDTreeTabsOpen<Cr>:NERDTreeTabsFind<Cr>
vmap <D-E> <Esc>:NERDTreeTabsOpen<Cr>:NERDTreeTabsFind<Cr>
nmap <D-E> <Esc>:NERDTreeTabsOpen<Cr>:NERDTreeTabsFind<Cr>


" Undo quit of a window
Plug 'AndrewRadev/undoquit.vim'

" Languages
Plug 'ekalinin/Dockerfile.vim'
Plug 'tpope/vim-markdown'
Plug 'fatih/vim-go'
Plug 'rgrinberg/vim-ocaml'

call plug#end()


" Easier command mode key
nnoremap ; :

" Set leaders
let mapleader = " "
let maplocalleader = "\\"

" Avoid the escape key
nnoremap <C-c> :noh<Cr><Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
snoremap <C-c> <Esc>

" Window and split navigation
nmap <c-Tab> :tabnext<Cr>
nmap <c-S-Tab> :tabprev<Cr>

" Resize splits with arrows
nmap <S-D-Down> :resize -5<CR>
nmap <S-D-Up> :resize +5<CR>
nmap <S-D-Left> :vertical resize -5<CR>
nmap <S-D-Right> :vertical resize +5<CR>

" Wrap inside paragraph
nnoremap <leader>q gqip

" Command line
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-f> <Right>
cmap <C-b> <Left>

" Don't jump on *, helps with find and replace
nnoremap * :keepjumps normal! mi*`i<CR>

" Use Cmd+] and Cmd+[ for indentation
nmap <D-]> >>
nmap <D-[> <<

" Visual selection maintained when indenting
vmap <D-]> >gv
vmap <D-[> <gv

" Indent in insert mode
inoremap <D-]> <c-t>
inoremap <D-[> <c-d>

" Toggle Spell Check Easily
imap <D-P> <Esc>l:set spell!<Cr>
nmap <D-P> :set spell!<Cr>

" Toggle between most recently viewed tab
map <D-L> :LastTab<CR>
imap <D-L> <Esc>:LastTab<CR>

nnoremap <leader>b :ls<cr>:b

" Jump to the last edited file
nnoremap <leader><leader> <C-^>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Grep word under cursor
nnoremap <leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>



" == Functions ==

" Remove trailing whitespaces
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


" Format the whole file (preserving cursor positiion)
function! Preserve(command)
  " save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Reindent the whole file
nmap <D-M> :call Preserve("normal gg=G")<CR>


" == UI ==

" No redraw on macros, registers
set nolazyredraw

" Theme and font settings
colorscheme gotham
set guifont=PragmataPro:h13
set linespace=1
set macligatures

set showcmd

set guioptions-=r " remove scrollbars
set guioptions-=R " remove scrollbars
set guioptions-=l " remove scrollbars
set guioptions-=L " remove scrollbars
set guioptions-=T " remove toolbars

set wrap

" Use numbers column for wrap
set cpoptions=n

" Line wrapping symbol
let &showbreak = '  ↳ '

set fillchars+=vert:\    " this comment is here to avoid whitespace elimination

let g:syntastic_ocaml_checkers=['merlin']
let g:syntastic_ocaml_use_ocamlbuild = 1

autocmd FileType ocaml hi EnclosingExpr ctermbg=17 guibg=#223344
autocmd FileType ocaml nmap <buffer> <C-c> :MerlinClearEnclosing<CR>:noh<CR>
autocmd Filetype ocaml let g:AutoPairs = {'(': ')', '[': ']', '{': '}', '"': '"'}


" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 7bd20150040950be95ea5eda30ee7ee6 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/rizo/.opam/4.04.0/share/vim/syntax/ocp-indent.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
