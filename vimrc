" Modeline and Notes {{{
" vim: set sw=4 ts=4 sts=4 et tw=120 foldmarker={{{,}}} foldlevel=0 foldmethod=marker nospell:

    " Header {{{
    " Maintainer:  
    "       miboscol@gmail.com
    " Version:
    "       2.0 - 10/11/15 09:26:00
    " Blog_post:
    "       http:/.............
    " Sections:
    "    -> General
    "       -> Identify platform
    "       -> Stratup Vim-Plug
    "       -> Environment 
    "          -> Files, backups and undo 
    "          -> Tab and indent relate
    "          -> Folding
    "       -> UI Setting  
    "       -> Key Setting  
    "          -> Shortcut => Folding 
    "          -> Shortcut => Moving aroundg 
    "          -> Shortcut => Buffer & window
    "          -> Shortcut => Editing 
    "          -> Shortcut => Visualization 
    "          -> Shortcut => Search & Replace 
    "          -> Shortcut => Ctags 
    "          -> Shortcut => Diff mode  
    "    -> Language Support
    "       -> Ruby & Rails
    "       -> Xml
    "    -> Plugin
    "       -> Airline
    "       -> AutoFormat
    "       -> CtrlSpace 
    "       -> Dash
    "       -> EasyTag 
    "       -> GoldenView 
    "       -> IndentLine
    "       -> MakeHeader 
    "       -> Maximizer 
    "       -> NerdTree  
    "       -> Signature
    "       -> Tabular 
    "       -> Tagbar
    "       -> Tcomment
    "       -> Ultisnip
    "    -> Autocmd
    "    -> Helper functions
    " }}}Header

" }}}Modeline and Notes

" Identify platform {{{
    silent function! OSX()
        return has('macunix')
    endfunction
    silent function! LINUX()
        return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
    silent function! WINDOWS()
        return  (has('win16') || has('win32') || has('win64'))
    endfunction
" }}}Identify platform

" Stratup Vim-Plug {{{
    call plug#begin($HOME.'/vimfiles/plugged')
        Plug 'ayu-theme/ayu-vim'
        Plug 'terryma/vim-smooth-scroll'
        " E molto pesente vedere se lo posso sostituire con questo
        " https://github.com/zefei/vim-wintabs
        Plug 'vim-ctrlspace/vim-ctrlspace' 
        Plug 'vim-airline/vim-airline', { 'on': [] } 
        Plug 'sbdchd/neoformat'
        Plug 'qpkorr/vim-bufkill' 
        Plug 'Raimondi/delimitMate', { 'on': [] }
        Plug 'ryanoasis/vim-devicons'
        Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight', {'on': 'NERDTreeToggle'}
        Plug 'easymotion/vim-easymotion', { 'on': [] }
        Plug 'haya14busa/incsearch.vim', { 'on': [] }
        Plug 'haya14busa/incsearch-easymotion.vim', { 'on': [] }
        Plug 'Konfekt/FastFold'
        Plug 'Yggdroot/indentLine'
        Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
        Plug 'p0deje/vim-ruby-interpolation', {'for': 'ruby'}
        Plug 'prettier/vim-prettier', { 'do': 'yarn install','for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
        Plug 'othree/html5.vim', { 'for': 'html' }
        Plug 'Valloric/MatchTagAlways', { 'for': 'html' }
        Plug 'othree/yajs.vim', { 'for': 'javascript' }
        Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
        Plug 'csscomb/vim-csscomb', { 'for': ['scss', 'css'] }
        Plug 'ap/vim-css-color', {'for': ['css', 'scss']}
        Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
        Plug 'tpope/vim-commentary', { 'on': [] }
        Plug 'szw/vim-maximizer', { 'on': [] }
        Plug 'bounceme/poppy.vim'
        Plug 'kshenoy/vim-signature', { 'on': [] }
        Plug 'godlygeek/tabular', { 'on': [] }
        Plug 'vim-scripts/MarkLines'
        Plug 'wesQ3/vim-windowswap', { 'on': [] }
        Plug 'TaDaa/vimade'
        Plug 'romainl/vim-qf'
        Plug 'junegunn/fzf.vim', { 'on': [] }
        Plug 'junegunn/fzf', { 'on': [] }
        Plug 'fatih/vim-go', {'for': ['go'] }
        Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
        Plug 'dyng/ctrlsf.vim', { 'on': [] }
    call plug#end()

    call timer_start(250, 'sphynx#defer#airline')
    call timer_start(300, 'sphynx#defer#motion')
    call timer_start(350, 'sphynx#defer#fzf')
    call timer_start(450, 'sphynx#defer#utility')

" }}}Stratup Vim-Plug

" General {{{

    " Environment {{{
     
        " Global {{{
            " Disabilito il vimrc che in vim 8 veniva caricato di default
            let skip_defaults_vim=1
            " Deve essere settata prima di qualsiasi altro impostazione, perchè fa cambiare il senso dei settaggio successivi
            set nocompatible
            " Sets how many lines of history VIM has to remember
            set history=100
            " riapre la navigazione delle directory ricordandosi l'ultima
            set browsedir=last
            " Turn on file type detection
            filetype indent on
            " Enable filetype plugins
            filetype plugin on 
            " Configure backspace so it acts as it should act
            set backspace=eol,start,indent
            " Backspace and cursor keys wrap too
            set whichwrap+=b,s,h,l,<,>,[,]
            " Ignore case when searching
            set ignorecase
            " When searching try to be smart about cases
            set smartcase                                        
            " No annoying sound on errors
            set noerrorbells
            set novisualbell
            set vb t_vb= t_vb=
            " timeoutlen: timeout insert key
            set tm=500
            " Set utf8 as standard encoding and en_US as the standard language
            scriptencoding utf-8
            set encoding=utf-8
            " Set English and Italian language
            set spell spelllang=it,en
            " Now, when using :sb, :sbnext, :sbprev instead of :b, :bnext, :bprev to switch buffers, Vim will check if buffer is open in tab/window and switch to that tab/window
            set switchbuf=usetab
            " when file change outside vim, vim reload automatically it
            set autoread
            " disable splell checking
            set nospell
            
            " apre posiziona il cursore dove lo avevo lasciato l'ultima volta
            if has("autocmd")
                au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
            endif
            
            " di default era .,w,b,u,t,i io ci ho tolto la "i" cosi l'autocompletamento dovrebbe essere più veloce
            " perchè con l'opzione i fa lo scan di tutti i file inclusi
            " . => scan the current buffer ('wrapscan' is ignored)
            " w => scan buffers from other windows
            " b => scan other loaded buffers that are in the buffer list
            " t => tag completion
            " u => scan the unloaded buffers that are in the buffer list
            " i => scan current and included files
            " k => scan the files given with the 'dictionary'
            set complete=.,w,b,u
            
            " Use both Unix and DOS file formats, but favor the Unix one for new files.
            if WINDOWS()
                set fileformats=unix,dos
            endif
            
            if WINDOWS()
                let $PATH = 'C:\APPL\Python38;' . $PATH
                let $PATH = 'C:\Program Files (x86)\Google\Chrome\Application;' . $PATH
            endif
            
            " migliora le performance di vim
            syntax sync maxlines=3000
            syntax sync minlines=10
            " se ho problemi con performance vim settare nocursorline
            set nocursorline
            "set cursorline
            set synmaxcol=340
            set nocursorcolumn
            "set nocursorline
            " more characters will be sent tothe screen for redrawing, instead of using insert/delete line commands
            set ttyfast
            " Don't redraw while executing macros (good performance config)
            set lazyredraw   
            
            set foldlevelstart=1
            
            set breakindent
            
            " migliora lo scorrimento verticale
            set sidescroll=1
            
            " disabilito plugin caricati di default
            let g:loaded_2html_plugin      = 1 "$VIMRUNTIME/plugin/tohtml.vim
            let g:loaded_getscript         = 1 "$VIMRUNTIME/autoload/getscript.vim
            let g:loaded_getscriptPlugin   = 1 "$VIMRUNTIME/plugin/getscriptPlugin.vim
            let g:loaded_gzip              = 1 "$VIMRUNTIME/plugin/gzip.vim
            let g:loaded_logipat           = 1 "$VIMRUNTIME/plugin/logiPat.vim
            let g:loaded_matchparen        = 1 "$VIMRUNTIME/plugin/matchparen.vim
            let g:loaded_netrw             = 1 "$VIMRUNTIME/autoload/netrw.vim
            let g:loaded_netrwFileHandlers = 1 "$VIMRUNTIME/autoload/netrwFileHandlers.vim
            let g:loaded_netrwPlugin       = 1 "$VIMRUNTIME/plugin/netrwPlugin.vim
            let g:loaded_netrwSettings     = 1 "$VIMRUNTIME/autoload/netrwSettings.vim
            let g:loaded_rrhelper          = 1 "$VIMRUNTIME/plugin/rrhelper.vim
            let g:loaded_spellfile_plugin  = 1 "$VIMRUNTIME/plugin/spellfile.vim
            let g:loaded_sql_completion    = 1 "$VIMRUNTIME/autoload/sqlcomplete.vim
            let g:loaded_syntax_completion = 1 "$VIMRUNTIME/autoload/syntaxcomplete.vim
            let g:loaded_tar               = 1 "$VIMRUNTIME/autoload/tar.vim
            let g:loaded_tarPlugin         = 1 "$VIMRUNTIME/plugin/tarPlugin.vim
            let g:loaded_vimball           = 1 "$VIMRUNTIME/autoload/vimball.vim
            let g:loaded_vimballPlugin     = 1 "$VIMRUNTIME/plugin/vimballPlugin.vim
            let g:loaded_zip               = 1 "$VIMRUNTIME/autoload/zip.vim
            let g:loaded_zipPlugin         = 1 "$VIMRUNTIME/plugin/zipPlugin.vim
            let g:vimsyn_embed             = 1 "$VIMRUNTIME/syntax/vim.vim
            let g:loaded_2html_plugin      = 1 "$VIMRUNTIME/plugin/tohtml.vim
        " }}} Global
        
        " Files, backups and undo {{{
            " Turn backup off, since most stuff is in SVN, git et.c anyway...
            set nobackup
            set nowb
            set noswapfile
            " Persistent undo
            set undodir=$VIMRUNTIME/undo                         
            set undofile
        " }}}Files, backups and undo
     
        " Tab and indent {{{
            " Use spaces instead of tabs
            set expandtab
            " Be smart when using tabs ;)
            set smarttab
            " 1 tab == 3 spaces
            set shiftwidth=2
            set tabstop=2
            " Line break on 500 characters
            set lbr
            " maximum width of text that is being inserted
            set tw=0
            " Indent at the same level of the previous line
            set ai
            " Smart indent
            set si
            " no wrap lines
            set nowrap
        " }}}Tab and indent

        " Folding {{{
            " deepest fold is 10 levels
            set foldnestmax=10       
            " this is just what i use
            " set foldlevel=99
            
            " cosa viene visualizzato quando faccio il folding del codice
            set foldtext=MyFoldText()
            
            " rimuove i caratteri ----- dopo il fold
            setl fillchars="fold: "
            
            " fare l'unfold automatico
            set foldopen+=block,insert,jump,mark,percent,quickfix,search,tag,undo
        " }}}Folding

        " Color {{{
            augroup color
                autocmd!
                autocmd ColorScheme * 
                    \   highlight  NERDtreeDir guibg=NONE  guifg=#2CA3D6
                    \ | highlight  NERDtreeOpenable guibg=NONE  guifg=#2CA3D6
                    \ | highlight  Folded guibg=#2C2C2C  guifg=NONE
                    \ | highlight  SignColumn guibg=#2C2C2C  guifg=NONE
                    \ | highlight  LineNr guibg=#2C2C2C  guifg=#5F5F5F
                    \ | highlight  VertSplit guibg=#2C2C2C guifg=NONE
                    \ | highlight  EndOfBuffer guifg=#121212 guibg=NONE
                    " \ | highlight  CursorLine guibg=#343D47  guifg=NONE
            augroup END
        " }}}Color

    " }}}Environment

    " UI Setting {{{
        " hide tab
        " disables the initial message
        set shortmess+=I
        set guioptions-=e
        " hide toolbar
        set guioptions-=T
        " hide menubar
        set guioptions-=m
        set guioptions+=M
        " hide the left-hand scrollbar for splits/new windows
        set guioptions-=L
        " hide the right scrollbar
        set guioptions-=r
        " quando eseguo un comando esterno, lo vedo dentro vim e non apre una nuova console
        " set guioptions+=!
        " set width fold column
        set foldcolumn=0
        " font used for the line that separates a vertical window 
        " set fillchars=vert:\¦ 
        set fillchars=
        " set the terminal's title
        set title
        " display the current mode
        set showmode                                         
        " height of the command bar
        set cmdheight=1                                      
        " Always show the status line
        set laststatus=2                                     
        " set cursor behavior
        set guicursor+=a:blinkon0
        " set 5 lines to the cursor - when moving vertically using j/k
        set so=5                                             
        " Setta per ogni buffer l'opzione hidden di default, questo mi permette di passare in maniera più pratica tra i buffer(ved. usr_22: nascondere i buffer)
        set hidden                                           
        " highlight search terms
        set hlsearch
        " find as you type search
        set incsearch                                        
        " for regular expressions turn magic on
        set magic                                    
        " show line number
        set number                                           
        " abilito il Wildmenu per migliorare autocompletamento riga comandi
        set wildmenu                                         
        " command <Tab> completion, list matches, then longest common part, then all
        set wildmode=list:longest,full
        " file da ignorare nel wildmenu
        set wildignore=*.o,*~,*.pyc,*.png,*.jpg,*.gif,*.xlsm,*.xls,*.xlsx,*.zip,*.so,*.exe,*.ico,*.lock,*.tags,*tags
        set wildignore+=log/**
        set wildignore+=*\\log\\*
        set wildignore+=*/log/*
        set wildignore+=vendor/cache/**
        set wildignore+=vendor/rails/**
        set wildignore+=*\\tmp\\*
        set wildignore+=*/tmp/*
        set wildignore+=*/.git/*
        set wildignore+=.git  
        set wildignore+=.git/*
        set wildignore+=*\\.git\\*
        set wildignore+=*/node_modules/**
        set wildignore+=*/node_modules_custom/**
        " Enable syntax highlighting
        syntax enable
        " apre le finestre in modo naturale
        set splitbelow
        set splitright
        set winheight=10
        set winminheight=4
        set winwidth=40
        set winminwidth=20
        " improve rendereing font
        if has("gui_running")
            if WINDOWS()
                if v:version > 704
                    set renderoptions=type:directx,
                        \gamma:1.8,contrast:0.5,geom:1,
                        \renmode:5,taamode:1,level:1
                endif
            endif
        endif
        " Set extra options when running in GUI mode
        " if OSX()
        "     set guioptions-=T
        "     set guioptions+=e
        "     set t_Co=256
        "     set guitablabel=%M\ %t
        "     let macvim_skip_colorscheme = 1    
        " endif
    " }}} UI Setting

    " Key Setting {{{
        
        " Global {{{
            if OSX()
                let macvim_skip_cmd_opt_movement = 1
                set macmeta
                nmap <D-j> <M-j>
                nmap <D-k> <M-k>
                vmap <D-j> <M-j>
                vmap <D-k> <M-k>
            endif
         
            if WINDOWS()
                behave mswin
                source $VIMRUNTIME/mswin.vim
            endif 
         
            " remap ` for to go right position mark 
            map ' `
         
            " setto il secondo leader
            let maplocalleader = '-'
         
            " mi permette di selezionare in modalità colonna con il mouse
            " vedere http://vim.wikia.com/wiki/Easy_block_selection_with_mouse
            noremap <M-LeftMouse> <4-LeftMouse>
            inoremap <M-LeftMouse> <4-LeftMouse>
            onoremap <M-LeftMouse> <C-C><4-LeftMouse>
            noremap <M-LeftDrag> <LeftDrag>
            inoremap <M-LeftDrag> <LeftDrag>
            onoremap <M-LeftDrag> <C-C><LeftDrag>
         
            " switch CWD to the directory of the open buffer
            map <leader>cd :lcd %:p:h<cr>:pwd<cr>
         
           " open saveas
            map <Leader>s :browse saveas<cr>
         
            " mi apre subito il mio vimrc
            map <leader>e :e $HOME/.vimrc<cr>
            
            " mi apre subito il mio gvimrc
            map <leader>eg :e $HOME/.gvimrc<cr>
         
            " pressing ,ss will toggle and untoggle spell checking
            map <leader>sc :setlocal spell!<cr>
         
            imap <Esc> <Esc><Esc>
         
            " mostra o nasconde la menu bar
            nnoremap <leader>m :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
        " }}}Global 
     
        " Folding {{{
            " set key for folding
            nmap z<Left>  zc
            nmap z<Right> zo
            " diminuisce di 1 il folding 
            nmap z<Up>    zm 
            " fa il folding di tutto 
            nmap zz<Up>    zM 
            " aumenta di 1 il folding 
            nmap z<Down>  zr
            " espande tutti i folding 
            nmap zz<Down>  zR
            nmap z1    :set foldlevel=0<CR>
            nmap z2    :set foldlevel=1<CR>
            nmap z3    :set foldlevel=2<CR>
            nmap z4    :set foldlevel=3<CR>
            nmap z5    :set foldlevel=4<CR>
            nmap z6    :set foldlevel=5<CR>
            " fare il folding dell'html
            nmap zh<Left>  zfat
         
            " nelle mie Helper functions (vedere sotto) ho creato la funzione ToggleFoldAuto()
            " con questo comando abilito disabilito il folding automatico, in pratica 
            " quando mi sposto nel codice ma fa unfold solo del codice in cui mi trovo
            " e mi collassa tutto l'altro codice
            nnoremap <silent> <Plug>ToggleFoldAut :call <SID>ToggleFoldAuto()<CR>
            nmap <leader>ft <Plug>ToggleFoldAut
            
            " abilita il tooltip per vedere cosa c'e dentro il mio fold
              set balloonexpr=FoldSpellBalloon()
              set ballooneval
              set balloondelay=300
        " }}}Folding
     
        " Moving around {{{
            " Treat long lines as break lines (useful when moving around in them)
            map j gj
            map k gk
            
            " go to end line
            map 9 $
            " go to middle line
            map 8 :call cursor(0, virtcol('$')/2)<CR>
            " go go start line
            map 0 ^
            
            " Remap VIM `. per spostarmi ultima riga modificata
            map <silent><leader>le `.
        " }}}Moving around 
        
        " Buffer & window & tab {{{
            " per spostarmi tra i tab
            nnoremap <silent> <A-Down>  :tabprevious<CR>
            nnoremap <silent> <A-Up> :tabnext<CR>
            inoremap <silent> <A-Down>  :tabprevious<CR>
            inoremap <silent> <A-Up> :tabnext<CR>
            vnoremap <silent> <A-Down>  :tabprevious<CR>
            vnoremap <silent> <A-Up> :tabnext<CR>
            nnoremap <silent> <A-Left>  :bprevious<CR>
            nnoremap <silent> <A-Right> :bnext<CR>
            
            " Spostarmi tra le finestre con i tasti direzionali
            nmap <silent> <C-Up> :wincmd k<CR>
            nmap <silent> <C-Down> :wincmd j<CR>
            nmap <silent> <C-Left> :wincmd h<CR>
            nmap <silent> <C-Right> :wincmd l<CR>
            
            " creare nuove finestre ed è pensato rispetto la finestra o rispetto il buffer
            " vedere https://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/
            " rispetto la window
            nmap <leader>w<left>  :topleft  vnew<CR>
            nmap <leader>w<right> :botright vnew<CR>
            nmap <leader>w<up>    :topleft  new<CR>
            nmap <leader>w<down>  :botright new<CR>
            " rispetto il buffer
            nmap <leader>b<left>   :leftabove  vnew<CR>
            nmap <leader>b<right>  :rightbelow vnew<CR>
            nmap <leader>b<up>     :leftabove  new<CR>
            nmap <leader>b<down>   :rightbelow new<CR>
            
            " shortcut per ridimensionare le finestre
            nnoremap  <localleader><left>  : vertical resize -10<cr>
            nnoremap  <localleader><up>    : resize +10<cr>
            nnoremap  <localleader><down>  : resize -10<cr>
            nnoremap  <localleader><right> : vertical resize +10<cr>
            nnoremap  <localleader>-         <C-W>=
            nnoremap  <localleader><localleader><left>   <C-w>\| 
            nnoremap  <localleader><localleader><Up>   <C-w>_ 
            
            " Close the current buffer
            map <leader>q :bd<cr>
            
            " Close all the buffers
            map <leader>qa :bufdo bd<cr>
            
            nnoremap tn :tabnew<CR>
            nmap <leader>1 1gt
            nmap <leader>2 2gt
            nmap <leader>3 3gt
            nmap <leader>4 4gt
            nmap <leader>5 5gt
            nmap <leader>6 6gt
            nmap <leader>7 7gt
            nmap <leader>8 8gt
            nmap <leader>9 9gt
        " }}}Buffer & window & tab 
      
        " Editing {{{
            " Usate per eliminare una parola anche tipo @variabile o se mi trova al centro della parola
            inoremap <C-d> <C-O>B<C-O>dE
            noremap <leader>dw BdEi
            
            " Mette le parentesi sul testo selezionato
            vnoremap ( <Esc>`>a)<Esc>`<i(<Esc>
            " Mette le parentesi quadre sul testo selezionato
            vnoremap [ <Esc>`>a]<Esc>`<i[<Esc>
            " Mette gli apici sul testo selezionato
            vnoremap <leader>2 <Esc>`>a"<Esc>`<i"<Esc>
        " }}}Editing
     
        " Visualization {{{
            " Clear search highlight
            map <silent> <leader>- :let @/=""<CR>:echo "Cleared search register."<cr>
            
            " per evidenziare riga e colonna
            map <silent> <Leader>cl         :set   cursorline! <CR>
            imap <silent> <Leader>cl <Esc>  :set   cursorline! <CR>
            map <silent> <Leader>cc         :set   cursorcolumn! <CR>
            imap <silent> <Leader>cc <Esc>  :set   cursorcolumn! <CR>
            map <silent> <Leader>ca         :set   cursorcolumn!  cursorline! <CR>
            imap <silent> <Leader>ca <Esc>  :set   cursorcolumn!  cursorline! <CR>
            
            " rimappo i tasti per fare lo scroll della pagina
            map <silent> <C-j> <C-e>
            map <silent> <C-k> <C-y>
            
            " aumenta la dimensione dei font
            nnoremap <Leader><Leader>+ :silent! let &guifont = substitute(
                \ &guifont,
                \ ':h\zs\d\+',
                \ '\=eval(submatch(0)+1)',
                \ 'g')<CR>
              
            " diminuisce la dimensione dei font
            nnoremap <Leader><Leader>- :silent! let &guifont = substitute(
                \ &guifont,
                \ ':h\zs\d\+',
                \ '\=eval(submatch(0)-1)',
                \ 'g')<CR>
        " }}}Visualization
        
        " Search & Replace {{{
            " Visual mode uso * o # per avviare la ricerca della parola sotto il cursore
            vnoremap <silent> * :call VisualSelection('f')<CR>
            vnoremap <silent> # :call VisualSelection('b')<CR>
         
            " start a substitute
            " map <leader>r :%s/
            " sostituisce tutte le occorrenze della parola che si trova sotto il cursore
            nmap <leader>sw :%s/<C-r>=expand("<cword>")<CR>/
        " }}} Search & Replace
     
        " Ctags {{{
            " va al tag sotto il cursore
            map <silent>t<left> <C-T>
         
            " alternative to <C-]>
            " place your cursor on an id or class and hit <leader>]
            " to jump to the definition
            map <silent>t<Right> :tag /<c-r>=expand('<cword>')<cr><cr>
            
            " va al tag sotto il cursore in vertial split window
            map <silent>tv :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
            " va al tag sotto il cursore in split window
            map <silent>ts :sp <CR>:exec("tag ".expand("<cword>"))<CR>
     
            " mi apre il tag in preview window, senza spostare il cursore nel buffer corrente
            " dopo per chiudere la preview window C-w-z
            map <silent>tp <Esc>:exe "ptjump " . expand("<cword>")<Esc><C-Down><Right>z<Right>
     
            " nelle mie Helper functions (vedere sotto) ho creato la funzione Gentag()
            " con questo comando mi crea il mio file tags
            command! Gentag :call Gentag()
        " }}}Ctags
     
        " Diff mode {{{
            " per spostarmi tra le differenze in modalità diff
            if &diff
                noremap <M-down> ]cz
                noremap <M-up> [cz
            endif
        " }}}Diff mode
     
    " }}}Key Setting

" }}}General

" Language Support {{{
    " Ruby {{{
        " enable syntax-based folding when editing Ruby filetypes
        let g:ruby_fold = 1
        " ruby operators can be highlighted
        let ruby_operators = 1
        " improve rubyDocumentation match patterns
        let ruby_no_comment_fold = 1
        let g:ruby_indent_block_style = 'do'
        " aggiungo il supporto ai tag anche per le gemme del progetto
        set tags+=gems.tags                                            
        " i comandi seguenti sono utilizzati per rendere vim piu veloce
        let ruby_minlines = 400
        let ruby_space_errors = 0
        let ruby_no_trail_space_error = 0
        " per far funzionare matchit
        call timer_start(550, 'LoadMatchit')
        func! LoadMatchit(timer)
            runtime macros/matchit.vim
        endfunc
        " runtime macros/matchit.vim
        " ho creato una funzione in Helper functions mi metto subito l'end con if,do,def ecc...
        imap <S-CR> <C-R>=RubyEndToken()<CR>
    " }}}Ruby

    " Ruby & Rails {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
     
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        
        " ho creato una funzione in Helper functions per andare in rails
        " al file corrispondente se presente in un tab
        " map <F8> :call GoBuf()<CR>
     
        
        "" torno indietro con plugin rails
        "map <leader>p <c-^>
        map <localleader><PageUp> [m
        map <localleader><PageDown> ]m
        map <localleader><S-PageUp> [[
        map <localleader><S-PageDown> ]]
        
        """""""""""""""""""""""""""""""""""""""""NOTE"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Vedere impostazione presenti in Autocmd
      
    " }}}Ruby & Rails

    " Xml {{{
        au FileType xml exe ":silent 1,$!xml fo - 2>/dev/null"
    " }}}Xml

" }}}Language Support

" Plugin {{{
    " AirLine {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " abilito i font speciali quelli con la patch
        let g:airline_powerline_fonts = 1
        " seleziono il tema
        " let g:airline_theme='oceanicnext'
        " dovrebbe migliorare le performance
        let g:airline_highlighting_cache = 1
        " quando avvio vim airline aspetta che vengano caricate tutte le estensioni
        " presenti nel mio runtimepath, questo rallenta l'avvio, cosi lo disabilito
        let g:airline#extensions#disable_rtp_load = 1
        let g:airline_extensions = []
        let g:airline_extensions = ['tabline','ctrlspace']
        " in section B of the status line display the CWD
        let g:airline_section_b = '%{getcwd()}'                                        
        " let g:airline_section_z = airline#section#create('%3p%% %#__accent_bold#%4l%#__restore__#%#__accent_bold#/%L%#__restore__#')
     
        " :AirlineExtensions per vedere le estensioni caricate
        " let g:airline#extensions#ale#enabled = 1
        " let g:airline#extensions#windowswap#enabled = 1
        " let g:airline#extensions#keymap#enabled = 1
        " let g:airline#extensions#tagbar#enabled = 0
        " let g:airline#extensions#whitespace#enabled = 0
        " let g:airline#extensions#xkblayout#enabled = 0
        " let g:airline#extensions#po#enabled = 0
     
        " ALE extension
        " let airline#extensions#ale#error_symbol = 'E:'
        " let airline#extensions#ale#warning_symbol = 'W:'
        " let airline#extensions#ale#show_line_numbers = 1
        " let airline#extensions#ale#open_lnum_symbol = '(L'
        " let airline#extensions#ale#close_lnum_symbol = ')'
     
        " QuickFix extension
        " let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
        " let g:airline#extensions#quickfix#location_text = 'Location'
     
        " Windowswap extension
        " let g:airline#extensions#windowswap#indicator_text = 'WS'
         
        " Tabline extension
        let g:airline#extensions#tabline#left_sep = ' '
        let g:airline#extensions#tabline#left_alt_sep = '|'
        let g:airline#extensions#tabline#show_buffers = 1
        let g:airline#extensions#tabline#buffer_nr_show = 1
        " visualizza il numero del buffers nella tabline
        let g:airline#extensions#tabline#buffer_nr_format = '%s: '
        " cambio il modo in cui viene visualizzato il nome del buffer
        let g:airline#extensions#tabline#formatter = 'unique_tail'
        
        " IMPORTANTE
        "  Nella sezione Autocmd ho modificato alcuni parametri per migliorare le
        "  performance di questo plugin
        """"""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " }}}AirLine
    
    " Ale {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'css':  ['stylelint'],
            \   'ruby':  ['rubocop'],
            \}
         
        let g:ale_fixers = {
            \   'javascript': ['eslint'],
            \   'scss': ['prettier'],
            \   'ruby':  ['rubocop'],
            \}
         
        let g:airline#extensions#ale#enabled = 1
        let g:ale_open_list = 0
        let g:ale_set_loclist = 0
        let g:ale_set_quickfix = 0
        let g:ale_linters_explicit = 1
        let g:ale_set_balloons = 1
        " let g:ale_sign_error = '✘'
        " let g:ale_sign_warning = '⚠'
        let g:ale_lint_on_enter = 1
        let g:ale_lint_on_text_changed = 'never'
        let g:ale_lint_on_save = 1
        let g:ale_echo_msg_error_str = 'E'
        let g:ale_echo_msg_warning_str = 'W'
        let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        nmap <F8> <Plug>(ale_fix)
        nmap <silent> <Leader>a<Up> <Plug>(ale_previous_wrap)
        nmap <silent> <Leader>a<Down> <Plug>(ale_next_wrap)
    " }}}ALe

    " Commentary {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        nnoremap <silent><leader>. :Commentary<CR>
        vnoremap <silent><leader>. :Commentary<CR>
    " }}}Commentary

    " CtrlSpace {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
         let g:CtrlSpaceDefaultMappingKey = "<C-space> "
         let g:CtrlSpaceFileEngine = 'file_engine_windows_amd64'
         let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"
         let g:ctrlspace_use_mouse_and_arrows = 1
         let g:airline_exclude_preview = 1
     
         " let g:CtrlSpaceGlobCommand = 'rg --files-with-matches .'
         let g:CtrlSpaceGlobCommand = 'fd --type file --hidden --exclude .git --exclude node_modules_custom .'
         let g:ctrlspace_show_key_info=1
         let g:ctrlspace_load_last_workspace_on_start=0
         let g:ctrlspace_save_workspace_on_exit=0
         let g:CtrlSpaceSearchTiming = 500
         let g:CtrlSpaceUseTabline = 1
         " set showtabline=0
        
         " """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
         nnoremap <silent> <A-Left>  :CtrlSpaceGoUp<CR>
         nnoremap <silent> <A-Right> :CtrlSpaceGoDown<CR>
         inoremap <silent> <A-Left>  :CtrlSpaceGoUp<CR>
         inoremap <silent> <A-Right> :CtrlSpaceGoDown<CR>
         vnoremap <silent> <A-Left>  :CtrlSpaceGoUp<CR>
         vnoremap <silent> <A-Right> :CtrlSpaceGoDown<CR>
         function! Down(k)
             call feedkeys("j")
         endfunction
         function! Up(k)
             call feedkeys("k")
         endfunction
         let g:CtrlSpaceKeys = { "Buffer": { "Down": "Down", "Up": "Up" } }
         nnoremap <Leader>b :CtrlSpace h<cr>
         nnoremap <Leader>bi :CtrlSpace H<cr>
    " }}}CtrlSpace

    " Devicons {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let g:webdevicons_enable_unite = 0
        let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
        let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        let g:DevIconsEnableFoldersOpenClose = 1
        let g:DevIconsEnableFolderExtensionPatternMatching = 1
        " let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        " let g:NERDTreeDirArrows=0
        " risolve problema che mi tagliava le icone
        " set ambiwidth=double
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " }}}Devicons

    " EasyMotion {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let g:EasyMotion_keys = 'abcdefghiklmnopqrstvxyzjABCDEFGHIKLMNOPQRSTVXYZJ'
        let g:EasyMotion_smartcase = 1 
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        nmap <space> <Plug>(easymotion-s)
        nmap 2<space> <Plug>(easymotion-s2)
        nmap <space><space> <Plug>(easymotion-sn)
        " <Leader>f{char} to move to {char}
        " map  <Leader>f <Plug>(easymotion-bd-f)
        " nmap <Leader>f <Plug>(easymotion-overwin-f)
        " s{char}{char} to move to {char}{char}
        nmap ec <Plug>(easymotion-overwin-f2)
        " Move to line
        map el <Plug>(easymotion-bd-jk)
        nmap el <Plug>(easymotion-overwin-line)
        " Move to word
        map  ew <Plug>(easymotion-bd-w)
        nmap ew <Plug>(easymotion-overwin-w)
        " nelle mie Helper functions (vedere sotto) ho creato la funzione incsearch_config()
        " con questo comando posso integrare insieme incserach con easymotion
        " in pratica con / mi metto in modalità incsearch scrivo quello che cerco e con easymotion mi sposto 
        noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
        noremap <silent><expr> / incsearch#go(<SID>incsearch_config({'is_stay': 1}))
    " }}}EasyMotion

    " Fzf {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " [Buffers] Jump to the existing window if possible
        let g:fzf_buffers_jump = 1
        let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }
     
        " [[B]Commits] Customize the options used by 'git log':
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
     
        " [Tags] Command to generate tags file
        let g:fzf_tags_command = 'ctags -R'
     
        " [Commands] --expect expression for directly executing the command
        let g:fzf_commands_expect = 'alt-enter,ctrl-x'
        " selezionare piu file con il tab
        let g:fzf_action = {
              \ 'ctrl-t': 'tab split',
              \ 'ctrl-s': 'split',
              \ 'ctrl-v': 'vsplit'
        \ }
        " ho impostato FZF_DEFAULT_OPTS=--bind page-down:preview-down,page-up:preview-up
        " in questo modo posso usare page-up e page-down per scorrere l'anteprima
        command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:60%'), <bang>0)
        command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!dis/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " nelle mie Helper functions (vedere sotto) ho creato la funzione Fzf_files_with_dev_icons()
        " mi apre fzf con affianco al nome del file l'icona, e mi mostra la preview del file nelle mie variabili d'ambinte
        " ho impostato FZF_DEFAULT_OPTS=--bind page-down:preview-down,page-up:preview-up
        " in questo modo posso usare page-up e page-down per scorrere l'anteprima
        nnoremap <silent> <Leader>p :FZF<cr>
        " lista file con la preview
        nnoremap <Leader>pp :Files<cr>
        nnoremap <silent> <leader>ppp :call Fzf_files_with_dev_icons($FZF_DEFAULT_COMMAND)<CR>
        nnoremap <silent> <leader>ppg  :call Fzf_files_with_dev_icons("git ls-files \| uniq")<CR>
        " nnoremap <Leader>b :Buffers<cr>
        nnoremap <Leader>t :Tags<cr>
        nnoremap <Leader>bt :BTags<cr>
        nnoremap <Leader>s :Snippets<cr>
        nnoremap <Leader>bl :BLines<cr>
        nnoremap <Leader>l :Lines<cr>
        nnoremap <Leader>ag :Ag<cr>
    " }}}Fzf

    " Go {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let g:go_highlight_fields = 1
        let g:go_highlight_types = 1
        let g:go_highlight_functions = 1
        let g:go_highlight_operators = 1
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " }}}Go

    " Grepper {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let g:grepper       = {}
        let g:grepper.tools = ['rg', 'ag', 'pt', 'git']
        let g:grepper.highlight = 1
        let g:grepper.side      = 1
        autocmd FileType GrepperSide
          \  silent execute 'keeppatterns v#'.b:grepper_side.'#>'
          \| silent normal! ggn
         highlight Directory ctermfg=216 ctermbg=NONE cterm=NONE guifg=#ffaf87 guibg=NONE gui=NONE
         highlight qfLineNr ctermfg=238 ctermbg=NONE cterm=NONE guifg=#444444 guibg=NONE gui=NONE
         highlight qfSeparator ctermfg=243 ctermbg=NONE cterm=NONE guifg=#767676 guibg=NONE gui=NONE
         highlight GrepperSideFile ctermfg=161 cterm=reverse
         highlight Conceal ctermfg=NONE ctermbg=250
         let g:grepper.quickfix      = 1
         " autocmd FileType qf wincmd K
        " """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
         " nmap gs  <plug>(GrepperOperator)
         " xmap gs  <plug>(GrepperOperator)
         nnoremap <localleader>sg :Grepper -tool git -side<cr>
         nnoremap <localleader>sa :Grepper -tool ag -side<cr>
         nnoremap <localleader>s  :Grepper -tool rg -side<cr>
         nnoremap <localleader>*  :Grepper -tool rg -side -cword<cr>
         nnoremap <localleader>sb  :Grepper -tool rg -side -buffer<cr>
         nnoremap <localleader>sbw  :Grepper -tool rg -side -buffer -cword<cr>
        
        
         command! Todo :Grepper
               \ -noprompt
               \ -tool git
               \ -grepprg git grep -nIi '\(TODO\|FIXME\|todo\|fixme\)'
    " }}}Grepper

    " Incsearch {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " ripulisce il registro delle ricerche dopo aver cercato
        let g:incsearch#auto_nohlsearch = 1
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " }}}Incsearch

    " IndentLine {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let g:indentLine_enabled = 0
        let g:indentLine_color_gui = '#0B5E6F'
        let g:indentLine_char = '¦'
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " attiva & disattiva il plugin
        nmap <Leader>ti :IndentLinesToggle<cr>
    " }}}IndentLine

    " NerdTree {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let NERDTreeQuitOnOpen = 0
        let NERDTreeMouseMode = 1 
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.lock', 'altro', 'excel_file', 
                           \ 'tags', '\.ico$', '\.exe$', '\.crt$', '\.key$',
                           \ 'node_modules$[[dir]]', 'node_modules_custom$[[dir]]']
        let NERDTreeChDirMode=0
        highlight! link NERDTreeFlags NERDTreeDir
        let g:DevIconsEnableFoldersOpenClose = 1
        let g:NERDTreeDirArrowExpandable = "\u00a0"
        let g:NERDTreeDirArrowCollapsible = "\u00a0"
        
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        map  <F4> :NERDTreeToggle  %:p:h<cr>
        vmap <F4> <esc>:NERDTreeToggle %:p:h<cr>
        imap <F4> <esc>:NERDTreeToggle %:p:h<cr>
        map  <Leader>nt :NERDTree %:p:h<CR>
        map  <F2> :NERDTreeFocus<CR>
        au FileType nerdtree :vert resize 32
    " }}}NerdTree

    " Nerdtree-syntax-highlight {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let g:NERDTreeFileExtensionHighlightFullName = 1
        let g:NERDTreeLimitedSyntax = 1
        let g:NERDTreeExactMatchHighlightFullName = 1
        let g:NERDTreePatternMatchHighlightFullName = 1
        let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
        let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
        let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
        let g:NERDTreeExtensionHighlightColor['xlsm'] = "8FAA54"
        let g:NERDTreeExtensionHighlightColor['xls']  = "8FAA54"
        let g:NERDTreeExtensionHighlightColor['xlsx'] = "8FAA54"
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " }}}Nerdtree-syntax-highlight
    
    " NeoFormat {{{
            """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
         
            """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            noremap <F9> :silent Neoformat<CR>
            vnoremap <silent><F9> :Neoformat<CR>gv
            " In modalità async non mi funzionava in Vim ma in Neovim si, quindi mettere controllo se sono in Vim o Neovim e usare quello giusto
            " autocmd FileType javascript,typescript,css,less,scss,json,graphql,markdown,vue,json  map <buffer> <F9> :PrettierAsync<CR>
            autocmd FileType javascript,typescript,css,less,scss,json,graphql,markdown,vue,json  map <buffer> <F9> :Prettier<CR>
    " }}}NeoFormat

    " Maximizer {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " disabilito i tasto di default
        let g:maximizer_set_default_mapping = 0
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        nnoremap <silent><localleader>m :MaximizerToggle<CR>
        vnoremap <silent><localleader>m :MaximizerToggle<CR>gv
    " }}}Maximizer

    " Poppy {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        au! cursormoved * call PoppyInit()
        """""""""""""""""""""""""""""""""""""""""""NOTE"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Mi fa il rainbow rainbow parenthesis
    " }}}Poppy
    
    " Prettier {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let g:prettier#config#print_width = 100
        let g:prettier#config#tab_width = 4
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " }}}Prettier

    " Qf {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let g:qf_mapping_ack_style = 1
        let g:qf_window_bottom = 0
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        nmap <F5> <Plug>QfCtoggle
        nmap <F6> <Plug>QfLtoggle
        " nmap <F6> <Plug>(:qf_loc_toggle)
        """""""""""""""""""""""""""""""""""""""""""NOTE"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " mi migliore le funzionalità del quickfix standard di vim
    " }}}Qf

    " Signature {{{
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let g:SignatureMap = {
            \ 'GotoNextLineByPos'  :  "m<Right>",
            \ 'GotoPrevLineByPos'  :  "m<Left>",
            \ 'ListBufferMarks'    :  "m<Down>"
            \ }
    " }}}Signature

    " Tabular {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        nmap <Leader>a= :Tabularize /=<CR>
        vmap <Leader>a= :Tabularize /=<CR>
        nmap <Leader>a: :Tabularize /:\zs<CR>
        vmap <Leader>a: :Tabularize /:\zs<CR>
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " }}} Tabular

    " Smooth-scroll {{{
        """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        noremap <silent> <leader><Up> :call smooth_scroll#up(&scroll, 40, 2)<CR>
        noremap <silent> <leader><Down> :call smooth_scroll#down(&scroll, 40, 2)<CR>
        noremap <silent> <leader><leader><Up> :call smooth_scroll#up(&scroll*2, 40, 4)<CR>
        noremap <silent> <leader><leader><Down> :call smooth_scroll#down(&scroll*2, 40, 4)<CR>
        
    " }}}Smooth-scroll

    " Tagbar {{{
            """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " let g:tagbar_ctags_bin = 'C:\APPL\bin\ctags.exe'
            " let g:tagbar_ctags_bin = 'C:\APPL\Vim80\vim80\ctags.exe'
            let g:tagbar_autoclose = 0
            let g:tagbar_usearrows = 1
            let g:tagbar_sort = 0
            let g:tagbar_width=28
            let g:tagbar_autofocus = 1
            let g:tagbar_show_linenumbers = 1
            " Configure Tagbar to user ripper-tags with ruby
            """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            nmap <F3> :TagbarToggle<CR>
    " }}}Tagbar

    " Vimade {{{
        """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let g:vimade = {}
        let g:vimade.fadelevel = 0.6
        let g:vimade.usecursorhold=1
        au! FileType nerdtree VimadeBufDisable
        au! BufWinEnter quickfix VimadeBufDisable
    " }}} Vimade

" }}} Plugin

" Autocmd {{{

   augroup vimrcEx
        autocmd!


        " Enable omni completion
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        "forzo vim ad usare il vecchio regex engine, più veloce per la syntax in ruby
        autocmd Filetype ruby setlocal regexpengine=1

        " Opzioni rubycomplete
        autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
        autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
        autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
        autocmd FileType ruby,eruby let g:rubycomplete_include_object = 1
        autocmd FileType ruby,eruby let g:rubycomplete_include_objectspace = 1

        autocmd BufRead,BufNewFile {Gemfile,Rakefile,config.ru} setlocal ft=ruby
        autocmd BufRead,BufNewFile *.yml setlocal ft=yaml
        autocmd BufNewFile,BufRead *.html.erb set filetype=eruby.html       " setto in filetype in html quando uso html.erb
        autocmd BufNewFile,BufRead *.js.erb set filetype=javascript.eruby   " setto in filetype in javascript quando uso js.erb

        " Automatic fold settings for specific files. Uncomment to use.
        " uso il plugin fastfold
        autocmd FileType ruby setlocal foldmethod=syntax
        autocmd FileType javascript setlocal foldmethod=syntax
        autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
        autocmd FileType scss setlocal foldmethod=indent shiftwidth=2 tabstop=2
        autocmd FileType javascript setlocal ts=4 sts=4 sw=4

        " Automatically reload vimrc when it's saved
        autocmd BufWritePost .vimrc source $HOME/.vimrc | AirlineRefresh

        " AIRLINE ==> Risolve un problema di ritardo quando si lascia modalità inserimento
        if ! has('gui_running')
            set ttimeoutlen=11
            au InsertEnter * set timeoutlen=0
            au InsertLeave * set timeoutlen=500
        endif
 

        " Funzione che crea 'header per i miei file
        " autocmd BufNewFile *.rb,*.rbw,*.haml,*.html.erb,*.erb silent call MakeFileHeader()

        " salvataggio automatico dei file
        autocmd Bufwritepre,filewritepre,FocusLost * if &ft!=""|silent write|endif   
        autocmd VimLeave  * :bufdo silent write

        " Automatically reload vimrc when it's saved
        au BufWritePost .vimrc silent source $HOME/.vimrc | call  Refresh()
    augroup END

"  }}} Autocmd

" Helper functions {{{
    function! MyFoldText()
        let nucolwidth = &fdc + &number*&numberwidth
        let winwd = winwidth(0) - nucolwidth - 5
        let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
        let prefix = " _______>>> "
        let fdnfo = prefix . string(v:foldlevel) . "," . string(foldlinecount)
        let line =  strpart(getline(v:foldstart), 0 , winwd - len(fdnfo))
        let fillcharcount = winwd - len(line) - len(fdnfo)
        return line . repeat(" ",fillcharcount) . fdnfo
    endfunction

    " Tooltip per vedere codice in folding
    function! FoldSpellBalloon()
        let foldStart = foldclosed(v:beval_lnum)
        let foldEnd = foldclosedend(v:beval_lnum)
        let lines = []
        " Detect if we are in a fold
        if foldStart < 0
            " Detect if we are on a misspelled word
            let lines = spellsuggest(spellbadword(v:beval_text)[ 0 ], 5, 0)
        else
            " we are in a fold
            let numLines = foldEnd - foldStart + 1
            " if we have too many lines in fold, show only the first 14
            " and the last 14 lines
            if ( numLines > 31 )
                let lines = getline( foldStart, foldStart + 14 )
                let lines += [ '-- Snipped ' . (numLines - 30 ) . ' lines --' ]
                let lines += getline( foldEnd - 14, foldEnd)
            else
                "less than 30 lines, lets show all of them
                let lines = getline( foldStart, foldEnd)
            endif
        endif
        " return result
        return join (lines, has("balloon_multiline" ) ? "\n" : " ")
    endfunction

    function! s:incsearch_config(...) abort
        return incsearch#util#deepextend(deepcopy({
        \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
        \   'keymap': {
        \     "\<CR>": '<Over>(easymotion)'
        \   },
        \   'is_expr': 0
        \ }), get(a:, 1, {}))
    endfunction

    function! Refresh ()
        AirlineRefresh
        call webdevicons#refresh()
        highlight  NERDtreeDir guibg=NONE  guifg=#2CA3D6
        highlight  NERDtreeOpenable guibg=NONE  guifg=#2CA3D6
        highlight  Folded guibg=#2C2C2C  guifg=NONE
        highlight  SignColumn guibg=#2C2C2C  guifg=NONE
        highlight  LineNr guibg=#2C2C2C  guifg=#5F5F5F
        highlight  VertSplit guibg=#2C2C2C guifg=NONE
        highlight  EndOfBuffer guifg=#121212 guibg=NONE
    endfunction

    function! Fzf_files_with_dev_icons(command)
     " let l:fzf_files_options = ' -m --preview "bat --color always --style numbers {2..} | head -'.&lines.'"'
     let l:fzf_files_options = ' -m --preview "bat --color always --style numbers {2..}" '
      
     function! s:edit_devicon_prepended_file(item)
       if empty(a:item)
         return 1
       endif

       let l:file_path = a:item[1][4:-1]
       execute 'silent e' l:file_path
     endfunction
     let opts = fzf#wrap({})
     let opts.source = a:command.' | devicon-lookup'
     let s:Sink = opts['sink*']
     let opts['sink*'] = function('s:edit_devicon_prepended_file')
     let opts.options .= l:fzf_files_options
     call fzf#run(opts)
    endfunction
" }}} Helper functions

" Unused Stuff {{{
    " General {{{
     
        " Stratup Vim-Plug {{{
            " call plug#begin($HOME.'/vimfiles/plugged')
                " Plug 'junegunn/vim-peekaboo'
                " Plug 'SirVer/ultisnips'
                " Plug 'w0rp/ale'
                " Plug 'zhaocai/GoldenView.Vim'
                " Plug 'tpope/vim-rails'
                " Plug 'ternjs/tern_for_vim', {'for': 'javascript'}
                " Plug 'hackhowtofaq/vim-solargraph', {'for': 'ruby'}
                " Plug 'dbakker/vim-projectroot', {'for': 'ruby'}
                " Plug 'itchyny/vim-cursorword'
                " Plug $VIM.'/vimfiles/plugged/VimProcWin'
                " Plug $VIM.'/vimfiles/plugged/YouCompleteMe'
                " Plug $VIM.'/vimfiles/plugged/Matchlines'
                " Plug $VIM.'/vimfiles/plugged/MakeHeader'
            " call plug#end()
        " }}}Stratup Vim-Plug
     
    " }}} General

    " Plugin {{{
     
        " MakeHeader {{{
            """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " let g:header_comment_author="Boscolo Michele"
            """""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " }}} MakeHeader

        " Tern {{{
            """"""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            "let g:tern_show_argument_hints='on_hold'
            "let g:tern_show_signature_in_pum = 1
            "let g:tern_map_keys=0
            """"""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            "nnoremap <Leader><Leader><Right>  :TernDef<CR>
            "nnoremap <Leader><Leader>s<Right> :TernDefSplit<CR>
            "nnoremap <Leader><Leader>p<Right> :TernDefPreview<CR>
            "nnoremap <Leader><Leader>r :TernRename<CR>
            "nnoremap <Leader><leader><Left> <C-o>
            "" apre il file sotto il cursore
            "map <leader>o :vertical wincmd f<CR>
        " }}} Tern

        " Youcompleteme {{{
            "set noshowmode shortmess+=c
            "set completeopt-=preview
            "set completeopt+=menuone,noinsert,noselect
           
            "let g:acp_enableAtStartup = 0                     " mi assicuro di disabilitare AutoComplPop
            "let g:ycm_use_ultisnips_completer = 1             " enable ultisnip integration
            "let g:ycm_collect_identifiers_from_tags_files = 1 " enable completion from tags
            "let g:ycm_min_num_of_chars_for_completion = 4
            "let g:ycm_min_num_identifier_candidate_chars = 0
            "let g:ycm_max_num_candidates = 10
            "let g:ycm_show_diagnostics_ui = 0
            "let g:tern_show_argument_hints = 'on_hold'
            "let g:ycm_add_preview_to_completeopt = 1
            "let g:ycm_auto_start_csharp_server = 0
            "let g:ycm_collect_identifiers_from_comments_and_strings = 1
            "let g:ycm_autoclose_preview_window_after_completion = 1
            "let g:ycm_complete_in_comments = 1
            "let g:ycm_key_invoke_completion = '<C-o>' " devo premere c-x e c-o
            "" let g:ycm_key_invoke_completion = '<C-Space>'
            "let g:ycm_autoclose_completion_window_after_selecting = 1
            "let g:ycm_python_interpreter_path = 'C:\APPL\Python38'
            "let g:ycm_filetype_blacklist = {
            "\ 'tagbar' : 1,
            "\ 'qf'    : 1, 
            "\ 'notes' : 1,
            "\ 'markdown' : 1,
            "\ 'unite' : 1,
            "\ 'text' : 1,
            "\ 'infolog' : 1,
            "\ 'nerdtree': 1,
            "\}
            "let g:ycm_semantic_triggers =  {
            "\   'css': [ 're!^\s{4}', 're!:\s+' ],
            "\   'ruby' : ['re!\.\w\w$', '::'],
            "\ }
            """"""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            "inoremap <expr> <Esc>      pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
            "inoremap <expr> <CR>       pumvisible() ? "\<C-y>\<Esc>a" : "\<CR>"
        " }}} Youcompleteme
        
        " Ultisnip {{{
            """""""""""""""""""""""""""""""""""""""""PARAMETRI""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            "" Le seguenti funzioni mi permettono una migliore integrazione con Youcompleteme
            "function! g:UltiSnips_Reverse()
            "    call UltiSnips#JumpBackwards()
            "    if g:ulti_jump_backwards_res == 0
            "        return "\<C-P>"
            "    endif
            "    return ""
            "endfunction

            "function! g:UltiSnips_Complete()
            "    call UltiSnips#ExpandSnippet()
            "    if g:ulti_expand_res == 0
            "        if pumvisible()
            "            return "\<C-n>"
            "        else
            "            call UltiSnips#JumpForwards()
            "            if g:ulti_jump_forwards_res == 0
            "                return "\<TAB>"
            "            endif
            "        endif
            "    endif
            "    return ""
            "endfunction
        
        ""     " IMPORTANTE
        ""     " Ho inserito dei parametri nella sezione Autocmd per migliore
        ""     " integrazione con Youcompleteme

            "" Setto le cartelle dove cercare gli snippet
            "if WINDOWS()
            "    let g:UltiSnipsSnippetsDir=$HOME."/vimfiles/plugged/ultisnips/UltiSnips"
            "endif
           
            "let g:UltiSnipsUsePythonVersion = 3
            "let g:UltiSnipsSnippetDirectories=["UltiSnips","CssUltiSnips","snippet"]
            """"""""""""""""""""""""""""""""""""""""""SHORTCUT"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            "" let g:UltiSnipsListSnippets="<C-e>"
        " }}} Ultisnip
     
    " }}} Plugin

    " Autocmd {{{
        " " ULTISNIP ==> Viene utilizzato per migliorare l'integrazione con l'autocompletamento
        " au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
        " au BufEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
    "  }}} Autocmd 

    " Helper functions {{{
        "    " Trasforma in HTML il testo selezionato mantenendo la sintassi
        "    let g:html_use_css = 1
        "    let html_number_lines = 0
        "    function! MyToHtml(line1, line2)
        "        " make sure to generate in the correct format
        "        let old_css = 1
        "        if exists('g:html_use_css')
        "            let old_css = g:html_use_css
        "        endif
        "        let g:html_use_css = 0
     
        "        " generate and delete unneeded lines
        "        exec a:line1.','.a:line2.'TOhtml'
        "        %g/<body/normal k$dgg
     
        "        " convert body to a table
        "        %s/<body\s*\(bgcolor="[^"]*"\)\s*text=\("[^"]*"\)\s*>/<table \1 cellPadding=0><tr><td><font color=\2>/
        "        %s#</body>\(.\|\n\)*</html>#\='</font></td></tr></table>'#i
     
        "        " restore old setting
        "        let g:html_use_css = old_css
        "    endfunction
        "    command! -range=% MyToHtml :call MyToHtml(<line1>,<line2>)
     
        "    function! GoBuf()
        "        for t in range(tabpagenr('$'))
        "            let winnr       = tabpagewinnr(t)
        "            let buflist     = tabpagebuflist(t)
        "            let bufnr       = buflist[winnr - 1]
        "            let bufname     = bufname(bufnr)
        "            let tabTitle    = ctrlspace#api#TabTitle(t, bufnr, bufname)
        "            echo tabTitle
        "         endfor
        "        let path_file = findfile(rails#cfile())
        "        let currentTab = tabpagenr()
        "        let title   = ctrlspace#util#Gettabvar(2, "CtrlSpaceLabel")
        "        try
        "            execute ":sb "path_file
        "        catch
        "        if path_file =~ '\<app/views/'
        "          execute ":tabn 2 "
        "          execute ":sp "path_file
        "         endif
        "        endtry
        "    endfunction
     
        "    if !exists( "*RubyEndToken" )
        "      function RubyEndToken()
        "        let current_line = getline( '.' )
        "        let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
        "        let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
        "          let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
     
        "          if match(current_line, braces_at_end) >= 0
        "            return "\<CR>}\<C-O>O"
        "          elseif match(current_line, stuff_without_do) >= 0
        "            return "\<CR>end\<C-O>O"
        "          elseif match(current_line, with_do) >= 0
        "            return "\<CR>end\<C-O>O"
        "          else
        "            return "\<CR>"
        "          endif
        "        endfunction
        "    endif
        
        "    " Toggles foldopen/close to all/default
        "    function! s:ToggleFoldAuto()
        "        if &foldclose ==# 'all'
        "            set foldclose&
        "        else
        "            set foldclose=all
        "        endif
        "    endfunction
        
        "    " Controlla se il file è stato modificato aggiorna l'header se presente, salva il file
        "    function! Autosave ()
        "        if &modified
        "             " silent call UpdateHeader()
        "             write
        "        endif
        "    endfunction
     
        "    function! Gentag()
        "        " ripper-tag
        "        " let tags_file  = getcwd() . "\\" . "tags"
        "        " call system('ripper-tags ' . "-R -f " . shellescape(tags_file) . " --exclude=test --exclude=config --exclude=.git --exclude=.vscode --exclude=excel_file")
        "        call system('ctags.exe ')
        "    endfunction
     
    " }}} Helper functions


" }}}

if !has("gui_running")
    set background=dark
    set term=xterm
    set t_Co=256
    set termguicolors
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif

set background=dark
let g:lucius_style='dark'
let g:lucius_contrast='high'
let g:contrast_bg = 'high'
let g:lucius_no_term_bg=1 
let g:airline_theme='lucius'
colorscheme lucius
LuciusBlack

" chiude la finestra preview
nnoremap cp :pclose<cr>
