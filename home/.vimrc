" Author: ZiYang
" LastModify: 2016/04/21

" General {{{

" enable syntax processing
syntax enable             

" sets how many lines of history VIM has to remember
set history=800
  
" enable filetype plugins
filetype plugin on
filetype indent on
  
" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
let mapleader = ";"
let g:mapleader = ";"


" set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
     
" use Unix as the standard file type
set ffs=unix,dos,mac
set fileencodings=ucs-bom,utf-8,gb18030,gbk,gk2312,euc-jp,euc-kr,big5,latin1
set termencoding=utf-8
    
set langmenu=zh_CN.utf-8 
language messages zh_CN.utf-8
" }}}

" UI Config {{{

" scroll marign bottom lines
set scrolloff=7
" show line numbers
set number              

" show command in bottom bar
set showcmd 

" highlight current line
set cursorline          

" visual autocomplete for command menu
set wildmenu

" always show current position
set ruler

" ignore compiled files
set wildignore=*.o,*~,*.pyc

" don't redraw while executing macros (good performance config)
set lazyredraw

" configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" highlight matching [{()}]
set showmatch           

" search as characters are entered
set incsearch           

" ignore case when searching
set ignorecase
  
" when searching try to be smart about cases 
set smartcase
" highlight matches
set hlsearch            

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

syntax on

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" height of the command bar
set cmdheight=2
      
" a buffer becomes hidden when it is abandoned
set hid

" }}}

" Tab / Indent / Fold {{{

" Be smart when using tabs 
set smarttab

" tabs are spaces
set expandtab       

" number of visual spaces per TAB
set tabstop=4       
set shiftwidth=4

" number of spaces in tab when editing
set softtabstop=4  

" Linebreak on 120 characters                                                                                                       
set lbr
set tw=120
 
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set showmode

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" based on the code folding indentation or grammar
" za open or close the current folding
" zM close all folding
" zR open  all folding
set foldenable
"set nofoldenable
"set foldmethod=marker
"set foldlevel=0
set foldmethod=indent
"set foldmethod=syntax

" open most folds by default
set foldlevelstart=10 

" 10 nested fold max
set foldnestmax=10      

" space open/closes folds
nnoremap <space> za

" }}}

" Colorscheme {{{ 
syntax enable
colorscheme solarized
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
call togglebg#map("<F5>")
" }}}

" Files, backups and undo {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
"set nobackup
"set nowb
"set noswapfile
" }}}


" Bind shortcuts {{{

" Smart way to move between windows
map nw <C-W><C-W>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
     
" Close the current buffer
map <leader>bd :Bclose<cr>
     
" Close all the buffers
map <leader>ba :1,1000 bd!<cr>
     
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to : tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
    
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
    
" Specify the behavior when switching between buffers 
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Remap VIM 0 to first non-blank character
map 0 ^

if has("mac") || has("macunix")   
    nmap <D-j> <M-j>                
    nmap <D-k> <M-k>                
    vmap <D-j> <M-j>                
    vmap <D-k> <M-k>                
endif      

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
    
" copy the text to the system clipboard
vnoremap <Leader>y "+y
    
" the system clipboard contents paste to vim
nmap <Leader>p "+p
    
nmap <Leader>pa %

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" }}}

" Status line {{{
set laststatus=2
set statusline=%F%m%r%h%w\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ x%02B\ [POS=%l,%v]\ [%p%%]\ \ [LEN=%L]\ \[%{strftime(\"%Y-%m-%d\ %H:%M\")}]

" }}}

" User defined function {{{
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")
          
   if buflisted(l:alternateBufNum)
     buffer #
   else   
     bnext
   endif  
          
   if bufnr("%") == l:currentBufNum
     new  
   endif  
          
   if buflisted(l:currentBufNum)                                                                                                    
     execute("bdelete! ".l:currentBufNum)
   endif  
endfunction

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug Section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" vim-plug {{{
call plug#begin('~/.vim/bundle')
Plug 'altercation/vim-colors-solarized'
Plug 'wesleyche/Trinity'
Plug 'wesleyche/SrcExpl'
Plug 'taglist.vim'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'jlanzarotta/bufexplorer'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
"Plug 'Valloric/YouCompleteMe'
call plug#end()
" }}}

" Trinity {{{
" Open and close all the three plugins on the same time 
nmap <F8>  :TrinityToggleAll<CR> 
      
" Open and close the Source Explorer separately 
nmap <F9>  :TrinityToggleSourceExplorer<CR> 
      
" Open and close the Taglist separately 
nmap <F10> :TrinityToggleTagList<CR> 
      
" Open and close the NERD Tree separately 
nmap <F11> :TrinityToggleNERDTree<CR> 
      
nmap <silent> <C-R> :BufExplorer<CR>
nmap <silent> <C-N> :bnext!<CR>
nmap <silent> <C-P> :bprev!<CR> 
nmap <silent> <C-A> :A<CR>
" }}}

" NERDTree {{{
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='~'
let g:NERDTreeDirArrows=0 
let g:NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

" SrcExpl {{{
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
exe "nnoremap <F4>" 
                  \ " :call g:UpdateCscope()<CR>"  
                  \ " :call g:SrcExpl_UpdateTags()<CR>"
" }}}

" scrooloose/syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_highlighting = 0
let g:syntasitc_check_on_wq=0
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_javascript_checkers=['jshint', 'jsl']
let g:syntastic_html_checkers=['tidy', 'jshint']
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1
highlight SyntasticErrorSign guifg=white guibg=black
" }}}

" Sirver/ultisnips {{{ 
" Depends on honza/vim-snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
let g:UltiSnipsSnippetDirectories=['UltiSnips']
"let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
" }}}

" BufExplorer {{{
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=0  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.

" minibufexplpp.vim
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 0
let g:miniBufExplMapCTabSwitchBufs = 0
let g:miniBufExplModSelTarget = 0 
" }}}

" Ctrlp {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden=1

"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar.gz 
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|tar|tar.gz)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = 'find %s -type f'

" }}}
