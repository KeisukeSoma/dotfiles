set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=4 "インデントをスペース4つ分に設定
set smartindent "オートインデント

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

colorscheme desert

" neobundle settings {{{
 if has('vim_starting')
   set nocompatible
     " neobundle をインストールしていない場合は自動インストール
       if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
           echo "install neobundle..."
               " vim からコマンド呼び出しているだけ neobundle.vim のクローン
                   :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
                     endif
                       " runtimepath の追加は必須
                         set runtimepath+=~/.vim/bundle/neobundle.vim/
                         endif
                         call neobundle#begin(expand('~/.vim/bundle'))
                         let g:neobundle_default_git_protocol='https'

                         " neobundle#begin - neobundle#end の間に導入するプラグインを記載します。
                         NeoBundleFetch 'Shougo/neobundle.vim'
                         " ↓こんな感じが基本の書き方
                         NeoBundle 'nanotech/jellybeans.vim'

						 " ファイルオープンを便利に
						 NeoBundle 'Shougo/unite.vim'
						
						 " Unite.vimで最近使ったファイルを表示できるようにする
						 NeoBundle 'Shougo/neomru.vim'
						 
						 "めっちゃ補完してくれるやつら
						 NeoBundle 'Shougo/neocomplcache'
						 NeoBundle 'Shougo/neosnippet'
						 NeoBundle 'Shougo/neosnippet-snippets'

						  " http://blog.remora.cx/2010/12/vim-ref-with-unite.html
						  """"""""""""""""""""""""""""""
						  " Unit.vimの設定
						  """"""""""""""""""""""""""""""
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
						  """"""""""""""""""""""""""""""


						 " ファイルをtree表示してくれる
						 NeoBundle 'scrooloose/nerdtree'

						 nnoremap <silent><C-e> :NERDTreeToggle<CR>

                         " vimrcに記述されたプラグインでインストールされていないものがないかチェックする
                         NeoBundleCheck
                         call neobundle#end()
                         filetype plugin indent on
                         " どうせだから jellybeansカラースキーマを使ってみましょう
                         set t_Co=256
                         syntax on
                        colorscheme jellybeans




