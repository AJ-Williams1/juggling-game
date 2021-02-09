let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/projects/juggling-game
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
edit application.py
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 35 + 37) / 74)
exe 'vert 1resize ' . ((&columns * 85 + 126) / 253)
exe '2resize ' . ((&lines * 36 + 37) / 74)
exe 'vert 2resize ' . ((&columns * 85 + 126) / 253)
exe 'vert 3resize ' . ((&columns * 167 + 126) / 253)
argglobal
balt application.py
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 6 - ((5 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 6
normal! 034|
lcd ~/projects/juggling-game
wincmd w
argglobal
terminal ++curwin ++cols=85 ++rows=36 
let s:term_buf_2 = bufnr()
balt ~/projects/juggling-game/application.py
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/projects/juggling-game
wincmd w
argglobal
if bufexists("~/projects/juggling-game/juggle.js") | buffer ~/projects/juggling-game/juggle.js | else | edit ~/projects/juggling-game/juggle.js | endif
balt ~/projects/juggling-game/templates/game.html
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 36) / 72)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/projects/juggling-game
wincmd w
exe '1resize ' . ((&lines * 35 + 37) / 74)
exe 'vert 1resize ' . ((&columns * 85 + 126) / 253)
exe '2resize ' . ((&lines * 36 + 37) / 74)
exe 'vert 2resize ' . ((&columns * 85 + 126) / 253)
exe 'vert 3resize ' . ((&columns * 167 + 126) / 253)
tabnext 1
badd +1 ~/projects/juggling-game/application.py
badd +25 ~/projects/juggling-game/juggle.js
badd +8 ~/projects/juggling-game/templates/game.html
badd +1 ~/projects/juggling-game
badd +1 ~/projects/juggling-game/juggle
badd +18 ~/projects/juggling-game/templates/layout.html
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOS
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
