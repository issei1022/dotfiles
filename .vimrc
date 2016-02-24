
"###設定###

set number
set ts=4
set title
syntax on
set tabstop=4
"マウスモード有効
"set mouse=a
".swapファイルを作らない
set noswapfile
"対応カッコをハイライト
set showmatch
" ] や ) の対応エラーをハイライト
let php_parent_error_close = 1
let php_parent_error_open = 1

" 全角スペースのハイライトを設定
"function! ZenkakuSpace()
" highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
"endfunction

"ビジュアルモードで選択したテキストをクリップボードに入れる
:set clipboard+=autoselect
set t_Co=256
set background=dark
hi Comment ctermfg=brown

set backspace=indent,eol,start

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
"""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
"""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""
" NEO BUNDLE
"""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

" neobundle settings {{{
 if has('vim_starting')
   set nocompatible
   " neobundle をインストールしていない場合は自動インストール
   if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
     echo "install neobundle..."
     " vim からコマンド呼び出しているだけ neobundle.vim のクローン
     :call system("git clone  git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
   endif
   "必須
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tomasr/molokai'
NeoBundle 'scrooloose/syntastic'

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html

"""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

""""""""""""""""""""""""""""""""""
" vim-indent-guides
""""""""""""""""""""""""""""""""""
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors=0
"奇数行
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=235
"偶数行
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=234
let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level = 2
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size=1

" vimrcに記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()

filetype plugin indent on
colorscheme molokai

" syntaxチェック
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1

" なんでか分からないけど php コマンドのオプションを上書かないと動かなかった
let g:syntastic_php_php_args = '-l'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*)}

