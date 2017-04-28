"pecify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')


"====================== General Plugin ========================
Plug 'vimwiki'
Plug 'cespare/vim-sbd'
Plug 'haya14busa/incsearch.vim'
Plug 'flazz/vim-colorschemes'
Plug 'skywind3000/asyncrun.vim'
Plug 'terryma/vim-smooth-scroll'
" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug '907th/vim-auto-save'
Plug 'bounceme/poppy.vim'
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
Plug 'jreybert/vimagit'
Plug 'chemzqm/vim-easygit'
Plug 'tpope/vim-fugitive'
Plug 'chemzqm/denite-git'
Plug 'eparreno/vim-l9'
Plug 'junegunn/goyo.vim'
Plug 'lambdalisue/lista.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/neomru.vim'
Plug 'wvffle/vimterm'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'Chun-Yang/vim-action-ag'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'kien/ctrlp.vim'


"====================== General Programing ========================
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'rking/ag.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/matchit.zip'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/echodoc'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-commentary'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'godlygeek/tabular'
Plug 'rhysd/conflict-marker.vim'

"====================== Front End ========================
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'metakirby5/codi.vim'
Plug 'carlitux/deoplete-ternjs'
Plug 'ternjs/tern_for_vim'

"typescript
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript'


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
set guioptions-=r
set guioptions-=L
set iskeyword +=-
set hidden
set autoindent
set guifont=Consolas\ 12
set t_Co=256
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
set cursorline
set omnifunc=syntaxcomplete#Complete
set guitablabel=%t
set noimdisable

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

let mapleader = " "
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:auto_save = 1  " enable AutoSave on Vim startup
let NERDTreeWinPos=1

set statusline+=%{fugitive#statusline()}

let g:ale_enabled = 0
let g:ale_linters={'javascript': ['eslint']}
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_column_always = 1

let g:auto_save = 1
let g:rainbow_active = 1
let g:tagbar_left = 1

let g:echodoc_enable_at_startup = 1
let g:NERDTreeMinimalUI = 1

let g:javascript_plugin_jsdoc = 1
let g:indentLine_enabled = 0
let g:easygit_enable_command = 1
let g:deoplete#enable_at_startup = 1

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes
let g:tern#filetypes = [ 'jsx', 'javascript.jsx' ]
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent", "--no-port-file"]

let g:goyo_width = 120
let g:goyo_height = "100%"

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"--":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
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

" [x and ]x mappings are defined as default.

nmap <leader>o :Denite outline<CR>
"vim jump
nnoremap <Leader>jy :Goyo<CR>
nnoremap <Leader>jd :TernDef<CR>

" vim git actions
nnoremap <leader>gl :Denite gitlog<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>

" vim run 
noremap <Leader>rt :AsyncRun ctags -R src<CR>
noremap <Leader>rr :AsyncRun 
nnoremap <F5> :call vimterm#toggle() <CR> 
tnoremap <F5> <C-\><C-n>:call vimterm#toggle() <CR> 

"vim vikis
nnoremap <Leader>vd :VimwikiToggleListItem<CR>
nmap <Leader>vi <Plug>VimwikiIndex


" vim files
" nnoremap <Leader>fn :NERDTreeTabsToggle<CR>
" nnoremap <Leader>ff :Denite file_rec<cr>
" nnoremap <Leader>ft :NERDTreeTabsFind<cr>
" nnoremap <Leader>fr :Denite file_old<cr>

" vim search
nnoremap <Leader>ss :<C-u>Lista<CR>
nnoremap <Leader>sw :<C-u>ListaCursorWord<CR>
nnoremap <Leader>sa :Ag src<left><left><left><left>

"vim buffer
" nnoremap <Leader>b :Denite buffer<CR>


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


nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tt :tabnew<cr>
nnoremap to :tabonly<CR>
nnoremap tw :tabclose<CR>

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

" nnoremap <C-p> :Denite file_rec<CR>
nnoremap <Esc> :nohl<CR>
tnoremap <Esc> <C-\><C-n>


autocmd! InsertLeave * set imdisable|set iminsert=0
autocmd! InsertEnter * set noimdisable|set iminsert=0

autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)


"set vimdiff 
if &diff
  highlight! link DiffText MatchParen
else
  syntax on
endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
" insert mode - line
let &t_SI .= "\<Esc>[5 q"
"replace mode - underline
let &t_SR .= "\<Esc>[4 q"
"common - block
let &t_EI .= "\<Esc>[3 q"


let g:lasttab = 1
nmap <tab> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

if $TERM_PROGRAM =~ "iTerm"
  set termguicolors
endif

"au! cursormoved * call PoppyInit()

call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

highlight deniteMatchedRange ctermfg=0 ctermbg=0
highlight deniteMatchedChar ctermfg=0 ctermbg=0


call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
      \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>


" augroup vimrc
"   autocmd QuickFixCmdPost * botright copen 8
" augroup END
