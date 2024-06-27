call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/tagbar'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
call plug#end()

colorscheme gruvbox
set background=dark
set tabstop=4        " 实际的 Tab 字符宽度
set shiftwidth=4     " 缩进命令（如 `>>` 和 `<<`）使用的空格宽度
set softtabstop=4    " 插入模式下 Tab 转为空格的宽度
set expandtab        " 将 Tab 字符替换为空格
set autowrite

filetype plugin on

" Enable autocompletion
set omnifunc=syntaxcomplete#Complete
" Select keyword as you type
set completeopt=longest,menuone
setlocal omnifunc=go#complete#Complete

let mapleader = ","

nnoremap <F1> <Nop>
inoremap <F1> <Nop>
vnoremap <F1> <Nop>

map <F1> :NERDTreeToggle<cr>
map <F2> :CocList files<CR>
nnoremap <silent> <F3> :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
nnoremap <silent> <leader>s :CocList grep 
nnoremap <silent> <leader>sr :CocListResume<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup Quickfix
  autocmd!
  autocmd FileType qf wincmd J
augroup END


command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>
function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction


set nu
set encoding=UTF-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
set noswapfile
"自动保存
autocmd CursorHold,CursorHoldI * if getbufvar(bufnr('%'), '&mod') | silent! w | endif
let g:go_list_type = "quickfix"


" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
"set signcolumn=yes
"
"
"" 当 Vim 进入不同的缓冲区时，更改终端的标题
autocmd BufEnter * call SetCustomTitle()
" 启用标题设置功能
set title

function! SetCustomTitle()
    " 获取当前工作目录的完整路径
    let cwd = getcwd()
    " 提取路径的最后一部分作为目录名
    let directoryName = fnamemodify(cwd, ':t')
    " 设置标题栏格式。这里使用 directoryName 作为展示信息
    let &titlestring = directoryName
endfunction

function! CustomAirlineFilename()
    " 获取当前 buffer 编号
    let l:bufnr = bufnr('')
    " 获取简短的文件名称
    let l:filename = expand('%:t')
    " 返回定制的字符串
    return l:bufnr . ': ' . l:filename
endfunction

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let g:go_info_mode='gopls'
let g:go_def_mode='gopls'
let g:go_fmt_autosave = 0
let g:go_fmt_command = "goimports"

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
