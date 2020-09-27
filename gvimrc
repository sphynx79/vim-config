"  Identify platform {
silent function! OSX()
return has('macunix')
endfunction

silent function! LINUX()
return has('unix') && !has('macunix') && !has('win32unix')
endfunction

silent function! WINDOWS()
return  (has('win16') || has('win32') || has('win64'))
endfunction
" } Identify platform

"colorscheme macvim
"let ayucolor="mirage"
" colorscheme codedark
let ayucolor="dark" 
colorscheme ayu

" colorscheme flatlandia
" let did_install_syntax_menu = 0
if WINDOWS()
  " set guifont=Sauce_Code_Powerline:h8      " Font family and font size.
  " set guifont=knack:h8:qDRAFT
  " set guifont=DejaVuSansMonoForPowerLine_Nerd:h10:cANSI:qDRAFT
  set guifont=FuraCode_NF:h8:cANSI:qDRAFT
  " set guifont=Delugia\ Nerd\ Font:h10:cANSI:qDRAFT
  set linespace=0
  " set guifont=UbuntuMonoDerivativePowerline_N:h12:cANSI:qDRAFT
elseif OSX()
  set guifont=Source\ Code\ Pro\ for\ Powerline:h11      " Font family and font size.
endif
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set background=dark               " Background.
set cmdheight=1
set mouse=a
set nomousefocus
set mousehide
" set linespace=1
" Uncomment to use.
" set guioptions-=r                 " Don't show right scrollbar
