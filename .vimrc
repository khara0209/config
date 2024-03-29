" .vimrcが更新されたら自動でvimrcを読み込み
" init all settings
set all&
" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" tiny と small では これ以上 vimrc を読み込まない
if !1 | finish | endif
" This is vim, not vi.
set nocompatible
" syntax hilight
syntax enable
" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

nmap ,v :edit $MYVIMRC<CR>
:set tags=./tags;

"--------------------------------------------------------------------- ------
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan
set mouse=a
set nocompatible
set nobackup
set laststatus=2
set ruler
set number
"set list
"set listchars=eol:\ ,tab:__,extends:_

highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
highlight WhitespaceEOL ctermbg=4 guibg=gray
augroup ignorechars
   au!
   au VimEnter,WinEnter * call matchadd('JpSpace', '\%u3000')
   au VimEnter,WinEnter * call matchadd('WhitespaceEOL', '\s\+$')
augroup END


set tabstop=4
set showmatch
set showcmd
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set backspace=indent,eol,start
set wildmenu
set t_kb=^V<BS>
set t_kD=^V<Del>
set title

" PHPシンタックスエラー :makeでチェックできます。
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
autocmd filetype php :set makeprg=php\ -l\ %
autocmd filetype php :set errorformat=%m\ in\ %f\ on\ line\ %l

filetype plugin on

colorscheme darkblue
set background=dark
"colorscheme hybrid
"set bg=dark
hi clear 
let colors_name = "darkblue"
"let colors_name = "molokai"

"##khara mod
noremap  
noremap!  
noremap <BS> 

noremap! <BS> 
nnoremap <silent> <C-x>1 :only<CR>
nnoremap <silent> <C-x>2 :sp<CR>
nnoremap <silent> <C-x>3 :vsp<CR>
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>

" insertモードから抜ける
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
inoremap <silent> kk <ESC>
inoremap <silent> <C-k> k

""
noremap j gj
noremap k gk
noremap gj j
noremap gk k

"##vim bundle
set nocompatible               " be iMproved
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle'))

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle "majutsushi/tagbar"
NeoBundle "tpope/vim-rails"
NeoBundle "scrooloose/nerdtree"
NeoBundle 'basyura/unite-rails'
NeoBundle 'alpaca-tc/alpaca_tags'
NeoBundle 'toyamarinyon/vim-swift'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'othree/eregex.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vimtaku/hl_matchit.vim.git'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'scala.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'https://github.com/Lokaltog/powerline.git'
NeoBundle 'Lokaltog/powerline-fontpatcher'
NeoBundle 'https://github.com/kovidgoyal/powerline-daemon'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'fatih/vim-go'

call neobundle#end()
endif

syntax on
filetype plugin indent on     " required!
filetype indent on
let g:tagbar_type_php = {
\ 'ctagstype' : 'php',
\ 'kinds' : [
\ 'i:interfaces:0:1',
\ 'c:classes:0:1',
\ 'd:constant definitions:0:0',
\ 'f:functions:0:1',
\ 'j:javascript functions:0:1'
\ ]
\ }
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }

""""""" unite.vim
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>Unite file<CR>
nnoremap <silent> ,ufa :<C-u>Unite -input=**/* file<CR>
nnoremap <silent> ,ff :<C-u>Unite file<CR>
nnoremap <silent> ,ffa :<C-u>Unite -input=**/* file<CR>
" ファイル一覧(現在開いているファイルのディレクトリ)
nnoremap <silent> ,ufc :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>Unite buffer file_mru bookmark file<CR>
j
" .gitignoreで指定したファイルと.git/以下のファイルを候補から除外する
function! s:unite_gitignore_source()
  let sources = []
  if filereadable('./.gitignore')
    for file in readfile('./.gitignore')
      " コメント行と空行は追加しない
      if file !~ "^#\\|^\s\*$"
        call add(sources, file)
      endif
    endfor
  endif
  if isdirectory('./.git')
    call add(sources, '.git')
  endif
  let pattern = escape(join(sources, '|'), './|')
  call unite#custom#source('file_rec', 'ignore_pattern', pattern)
  call unite#custom#source('grep', 'ignore_pattern', pattern)
endfunction
"call s:unite_gitignore_source()

""""""""" tagbar
"autocmd VimEnter * TagbarToggle
nmap <F7> :TagbarToggle<CR>
let g:tagbar_sort = 0
let mapleader = ","
let g:tagbar_width = 30

"ctags
let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
:set backspace=indent,eol,start
:set laststatus=2
let Tlist_Sort_Type = "name"
let Tlist_WinWidth =40
let Tlist_Compact_Format = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_cpp_settings = 'c++;v:variable;d:macro;t:typedef;c:class;n:namespace;g:enum;s:struct;u:union;m:members;f:function'

set clipboard=unnamed,autoselect

"""""""""" NERDTree
nmap <F6> :NERDTree<CR>
let NERDTreeWinSize=26
"autocmd VimEnter * NERDTree

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

""""""""""" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

"vimprocの設定 (unite grep) {{{
" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
"}}}

"""""""""" neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"""""""" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"------------------------------------
" neosnippet
"------------------------------------
" neosnippet "{{{

" snippetを保存するディレクトリを設定してください
" example
 let s:default_snippet = neobundle#get_neobundle_dir() . '/neosnippet/autoload/neosnippet/snippets' " 本体に入っているsnippet
 let s:my_snippet = '~/.vim/snippet' " 自分のsnippet
 let g:neosnippet#snippets_directory = s:my_snippet
 let g:neosnippet#snippets_directory = s:default_snippet . ',' . s:my_snippet
imap <silent><C-F>                <Plug>(neosnippet_expand_or_jump)
inoremap <silent><C-U>            <ESC>:<C-U>Unite snippet<CR>
nnoremap <silent><Space>e         :<C-U>NeoSnippetEdit -split<CR>
smap <silent><C-F>                <Plug>(neosnippet_expand_or_jump)
" xmap <silent>o                    <Plug>(neosnippet_register_oneshot_snippet)
" rails-vim & snippet
autocmd User Rails.view*                 NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
autocmd User Rails.controller*           NeoSnippetSource ~/.vim/snippet/ruby.rails.controller.snip
autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/snippet/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/snippet/ruby.rails.route.snip

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

""ctag {{{
augroup AlpacaTags
  autocmd!
  if exists(':Tags')
    autocmd BufWritePost Gemfile TagsBundle
    autocmd BufEnter * TagsSet
    " 毎回保存と同時更新する場合はコメントを外す
    " autocmd BufWritePost * TagsUpdate
  endif
augroup END
"}}}
"

""""unite-rails
noremap :rc :<C-u>Unite rails/controller<CR>
noremap :rm :<C-u>Unite rails/model<CR>
noremap :rv :<C-u>Unite rails/view<CR>
noremap :rh :<C-u>Unite rails/helper<CR>
noremap :rs :<C-u>Unite rails/stylesheet<CR>
noremap :rj :<C-u>Unite rails/javascript<CR>
noremap :rr :<C-u>Unite rails/route<CR>
noremap :rg :<C-u>Unite rails/gemfile<CR>
noremap :rt :<C-u>Unite rails/spec<CR>
noremap :rl :<C-u>Unite rails/lib<CR>

"easymotion
" Lokaltog/vim-easymotion
" http://blog.remora.cx/2012/08/vim-easymotion.html
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「;」 + 何かにマッピング
let g:EasyMotion_leader_key=";"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

""ereg.vim
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?

set laststatus=2
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
set noshowmode


" exe script
autocmd BufNewFile,BufRead *.rb nnoremap <C-s> :!ruby %
autocmd BufNewFile,BufRead *.py nnoremap <C-s> :!python %
autocmd BufNewFile,BufRead *.pl nnoremap <C-s> :!perl %

"scala.vim
autocmd BufRead,BufNewFile *.scala set filetype=scala

"-------------------------------------------------------------------------------
" インデント Indent
"-------------------------------------------------------------------------------
set autoindent   " 自動でインデント
"set paste        " ペースト時にautoindentを無効に(onにするとautocomplpop.vimが動かない)
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent      " Cプログラムファイルの自動インデントを始める

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=2 shiftwidth=2 softtabstop=0

" 連続インデント
vnoremap < <gv
vnoremap > >gv

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off

  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
endif

" quickrun
let g:quickrun_config = {
\   "_" : {
\       "outputter/buffer/split" : 'vertical',
\       "outputter/buffer/close_on_empty" : 1
\   },
\}
nnoremap <expr><silent> <C-c> quickrun#is_running( ? quickrun#sweep_sessions( : "\<C-c>"))
noremap :qr :<C-u>QuickRun<CR>

" neocomplete 自動補完をON
"let g:neocomplete#enable_at_startup = 1
let g:neocomplcache_max_list = 30

"ctag
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-i> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')
" 上に記載した方法を取っていない方は which python3 とかしてそのPATHを設定してください。


function! ProfileCursorMove() abort
  let profile_file = expand('~/log/vim-profile.log')
  if filereadable(profile_file)
    call delete(profile_file)
  endif

  normal! gg
  normal! zR

  execute 'profile start ' . profile_file
  profile func *
  profile file *

  augroup ProfileCursorMove
    autocmd!
    autocmd CursorHold <buffer> profile pause | q
  augroup END

  for i in range(100)
    call feedkeys('j')
  endfor
endfunction
