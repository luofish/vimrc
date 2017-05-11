"pecify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" source $MYVIMRC reload

"====================== General Plugin ========================
Plug 'vimwiki'
Plug 'haya14busa/incsearch.vim'
Plug 'flazz/vim-colorschemes'
Plug 'skywind3000/asyncrun.vim'
Plug 'terryma/vim-smooth-scroll'
Plug '907th/vim-auto-save'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/Denite.nvim'
Plug 'chemzqm/denite-git'
Plug 'chemzqm/vim-easygit'
Plug 'eparreno/vim-l9'
Plug 'lambdalisue/lista.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'Chun-Yang/vim-action-ag'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tacahiroy/ctrlp-funky'
Plug 'wvffle/vimterm'
Plug 'Shougo/vimproc'
Plug 'simeji/winresizer'
Plug 'kien/rainbow_parentheses.vim'


"====================== General Programing ========================
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'rking/ag.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/matchit.zip'
Plug 'Shougo/echodoc'
Plug 'tpope/vim-commentary'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'godlygeek/tabular'
Plug 'rhysd/conflict-marker.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nelstrom/vim-visual-star-search'


"====================== Front End ========================
Plug 'chemzqm/vim-jsx-improve'
Plug 'mattn/emmet-vim'
Plug 'metakirby5/codi.vim'
Plug 'carlitux/deoplete-ternjs'
Plug 'ternjs/tern_for_vim'

"typescript
" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'jason0x43/vim-js-indent'
" Plug 'ianks/vim-tsx'

" Initialize plugin system
call plug#end()

set nocompatible                " be iMproved
set fenc=utf-8

set wildignore+=*/node_modules/**
set wildignore+=*/tnpm/**
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

set fileencodings=ucs-bom,utf-8,cp936,gb2312,gb18030,big5
set number
set relativenumber
set tabstop=2  
set shiftwidth=2  
set softtabstop=2  
set expandtab  
set smarttab
set sidescroll=10
set hlsearch
set ignorecase
set incsearch
set wrapscan
set noswapfile
set nobackup
set iskeyword +=-
set hidden
set autoindent
set guifont=Consolas\ 12
set fdm=syntax
set ttimeoutlen=50
set foldlevel=99
set completeopt=longest,menuone
set completeopt-=preview
set background=dark

colorscheme gruvbox 

set suffixesadd+=.js
set suffixesadd+=.jsx
set suffixesadd+=.css
set nostartofline
set path+=$PWD/src/**
set noshowmode
set guitablabel=%t
set noimdisable
set inccommand=split " Neovim support

filetype plugin on
filetype off

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:UltiSnipsExpandTrigger="<tab>"
let mapleader = " "
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:auto_save = 1  " enable AutoSave on Vim startup

" let g:ale_enabled = 0
" let g:ale_linters={'javascript': ['eslint']}
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" let g:ale_sign_column_always = 1

let g:auto_save = 1
let g:echodoc_enable_at_startup = 1
let g:NERDTreeMinimalUI = 1

let g:javascript_plugin_jsdoc = 1

let g:deoplete#enable_at_startup = 1

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes
let g:tern#filetypes = [ 'jsx', 'javascript.jsx' ]
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent", "--no-port-file"]

let g:easygit_enable_command = 1
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"--":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ }
      \ }

" let g:asyncrun_exit = "silent doautocmd QuickFixCmdPost make"

nmap <leader>1 1gt
nmap <leader>2 2gt 
nmap <leader>3 3gt 
nmap <leader>4 4gt 
nmap <leader>5 5gt 
nmap <leader>6 6gt 
nmap <leader>7 7gt 
nmap <leader>8 8gt 
nmap <leader>9 9gt 

"vim jump
nnoremap <Leader>jd :TernDef<CR>
nnoremap <F12> :TernDef<CR>

" vim git actions
nnoremap <leader>gs :T gs<CR>
nnoremap <leader>gd :GdiffThis<CR>
nnoremap <leader>gl :Denite gitlog<CR>
nnoremap <leader>ga :Denite gitlog:all<CR>

" vim run 
noremap <Leader>rt :AsyncRun ctags -R src<CR>
noremap <Leader>rr :AsyncRun 

if $PWD =~ "antcloud-common-ui"
  " nnoremap <F5> :call vimterm#exec('npm run lzp-compile')<CR>
endif

noremap <F8> :call asyncrun#quickfix_toggle(8)<cr>

"vim vikis
nnoremap <Leader>vd :VimwikiToggleListItem<CR>
nmap <Leader>vi <Plug>VimwikiIndex

" vim search
nnoremap <Leader>ss :<C-u>Lista<CR>
nnoremap <Leader>sw :<C-u>ListaCursorWord<CR>
nnoremap <Leader>sa :Ag src<left><left><left><left>

nnoremap <leader>y "+y
nnoremap <leader>p "0p
nnoremap <leader>q :q<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H> 
nnoremap <C-=> <C-W>+
nnoremap <C--> <C-W>-
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


nnoremap tl :bnext<CR>
nnoremap th :bpre<CR>
nnoremap td :bd<CR>

"auto indent when paste
nnoremap p p=`]
nnoremap g; g;zz
nnoremap n nzz
nnoremap N Nzz
nnoremap gd gdzz
nnoremap <C-o> <C-o>zz

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 15, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 15, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 15, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 15, 4)<CR>

nnoremap <Esc> :nohl<CR>

if has('nvim')
  tnoremap <c-j> <c-\><c-n><c-w>j
  tnoremap <c-k> <c-\><c-n><c-w>k
  tnoremap <c-h> <c-\><c-n><c-w>h
  tnoremap <c-l> <c-\><c-n><c-w>l
  nnoremap <F4> :call vimterm#toggle()<CR>
  tnoremap <F4> <C-\><C-n>:call vimterm#toggle()<CR>
  au WinEnter *pid:* call feedkeys('i')
endif

nnoremap <C-n> :CtrlPBuffer<CR>
nnoremap <C-m> :CtrlPFunky<CR>

autocmd! InsertLeave * set imdisable|set iminsert=0
autocmd! InsertEnter * set noimdisable|set iminsert=0

autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = '0'

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
" insert mode - line
let &t_SI .= "\<Esc>[5 q"
"replace mode - underline
let &t_SR .= "\<Esc>[4 q"
"common - block
let &t_EI .= "\<Esc>[3 q"


" let g:lasttab = 1
" nmap <tab> :exe "tabn ".g:lasttab<CR>
" au TabLeave * let g:lasttab = tabpagenr()

nnoremap <tab> <C-^>

if $TERM_PROGRAM =~ "iTerm"
  set termguicolors
endif

" call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" highlight deniteMatchedRange ctermfg=0 ctermbg=0
" highlight deniteMatchedChar ctermfg=0 ctermbg=0


" call denite#custom#var('grep', 'command', ['ag'])
" call denite#custom#var('grep', 'default_opts',
"       \ ['-i', '--vimgrep'])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', [])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])

" command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

syntax on

if &diff
  nnoremap <leader>q :qa<CR>
endif

" let g:deoplete#omni#input_patterns = {}
" let g:deoplete#omni#input_patterns.typescript = '[^. *\t]\.\w*'

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:deoplete#sources#flow#flow_bin = 'flow' 
