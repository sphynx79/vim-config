function! s:lod(...)
  " Ignore unknown plugins from vim-plug due to the excluded plugins
  for l:plug in a:000
    silent! call plug#load(l:plug)
  endfor
endfunction

" 250
function! sphynx#defer#airline(timer) abort
  call s:lod('vim-airline')
  redraws!
  " redrawtabline
endfunction

" 300 
function! sphynx#defer#motion(timer) abort
  call s:lod('incsearch.vim', 'vim-easymotion', 'incsearch-easymotion.vim')
endfunction

" 350 
function! sphynx#defer#fzf(timer) abort
  call s:lod('fzf', 'fzf.vim')
endfunction

" 450 
function! sphynx#defer#utility(timer) abort
  call s:lod('tabular', 'vim-signature','vim-commentary', 'vim-maximizer', 'delimitMate', 'vim-windowswap','vim-smooth-scroll')
endfunction
