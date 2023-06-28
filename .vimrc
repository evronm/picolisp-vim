syntax on
filetype plugin indent on
set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent
if ($TERM == "screen")
  set term=linux
endif
autocmd FileType picolisp call s:PicoLisp()
autocmd BufRead,BufNewFile *.l setl ft=picolisp

function! s:PicoLisp()
  syn keyword PicoLispStatement  NIL ~ pico priv meth quote T N C S B I P W @ @@ @@@ This complete gc format + - inc dec * */ / % >> rev lt0 le0 ge0 gt0 abs bit?  & sqrt seed hash rand name nsp sp?  pat?  fun?  getd all symbols intern ==== box?  str?  zap chop pack glue text pre?  sub?  val set setq swap xchg on off onOff zero one default push push1 push1q pop ++ shift cut del queue fifo rid enum enum?  idx lup put get prop ; =: : :: putl getl wipe meta low?  upp?  lowc uppc fold path wait sync hear tell poll read key peek char skip eol eof from till line in out err ctl input output fd pipe open close echo prin prinl space print printsp println flush rewind ext plio rd pr wr any sym str load ext?  rollback extern pool pool2 journal id blk seq lieu lock touch commit mark free dbck apply pass fun maps map mapc maplist mapcar mapcon mapcan filter extract seek find pick fully cnt sum maxi mini fish by as lit eval run def de dm box new type isa method send try super extra and or nand nor xor bool not nil t prog prog1 prog2 if ifn if2 when unless cond nond case casq state while until at do loop for with bind job let let?  use buf catch throw finally co yield !  e $ exec call ipid opid kill fork detach bye car cdr caar cadr cdar cddr caaar caadr cadar caddr cdaar cdadr cddar cdddr caaaar caaadr caadar caaddr cadaar cadadr caddar cadddr cdaaar cdaadr cdadar cdaddr cddaar cddadr cdddar cddddr nth con cons conc circ rot list need range full make made chain link yoke copy mix append delete delq replace insert remove place strip split reverse flip trim clip head tail stem fin last == n== = <> =0 =1 =T n0 nT < <= > >= max min atom pair circ?  lst?  num?  sym?  flg?  member memq mmeq sect diff index offset prior length size bytes assoc rassoc asoq rasoq rank match fill prove -> unify group sort tty raw alarm sigio kids protect heap stack byte env date time usec quit sys pwd cd ctty cmd dir info file argv opt errno %@ native struct lisp args next arg rest adr trail up history
syn keyword PicoLispVar *OS *CPU *Pid *PPid *DB *Solo *Prompt *Zap *Ext *Scl *Rule *Class *Run *Hup *Sig1 *Sig2 *Winch *TStp1 *TStp2 *Term \^ *Err *Msg *Uni *Fork *Bye *Dbg 

  syn match PicoLispAtom /'*[a-z0-9]+/ contained
  syn match PicoLispComment /#.*$/ contained
  syn region PicoLispCommentRegion start="#{" end="}#" contained
  syn region PicoLispString start=/"/ skip=/\\|\"/ end=/"/ contained
  syn region PicoLispStringRaw start=/{$/ end=/$}/ contained

  syn cluster PicoLispList contains=PicoLispStatement,PicoLispVar,PicoLispAtom,PicolispCommentm,PicoLispString,PicolispStringRaw


  syn region lispParen0           matchgroup=hlLevel0 start="`\=(" end=")" skip="|.\{-}|" contains=@PicoLispList,lispParen1
  syn region lispParen1 contained matchgroup=hlLevel1 start="`\=(" end=")" skip="|.\{-}|" contains=@PicoLispList,lispParen2
  syn region lispParen2 contained matchgroup=hlLevel2 start="`\=(" end=")" skip="|.\{-}|" contains=@PicoLispList,lispParen3
  syn region lispParen3 contained matchgroup=hlLevel3 start="`\=(" end=")" skip="|.\{-}|" contains=@PicoLispList,lispParen4
  syn region lispParen4 contained matchgroup=hlLevel4 start="`\=(" end=")" skip="|.\{-}|" contains=@PicoLispList,lispParen5
  syn region lispParen5 contained matchgroup=hlLevel5 start="`\=(" end=")" skip="|.\{-}|" contains=@PicoLispList,lispParen6
  syn region lispParen6 contained matchgroup=hlLevel6 start="`\=(" end=")" skip="|.\{-}|" contains=@PicoLispList,lispParen7
  syn region lispParen7 contained matchgroup=hlLevel7 start="`\=(" end=")" skip="|.\{-}|" contains=@PicoLispList,lispParen8
  syn region lispParen8 contained matchgroup=hlLevel8 start="`\=(" end=")" skip="|.\{-}|" contains=@PicoLispList,lispParen9
  syn region lispParen9 contained matchgroup=hlLevel9 start="`\=(" end=")" skip="|.\{-}|" contains=@PicoLispList,lispParen0
  hi def hlLevel0 ctermfg=red		guifg=red1
  hi def hlLevel1 ctermfg=yellow	guifg=orange1
  hi def hlLevel2 ctermfg=green	guifg=yellow1
  hi def hlLevel3 ctermfg=cyan	guifg=greenyellow
  hi def hlLevel4 ctermfg=magenta	guifg=green1
  hi def hlLevel5 ctermfg=red		guifg=springgreen1
  hi def hlLevel6 ctermfg=yellow	guifg=cyan1
  hi def hlLevel7 ctermfg=green	guifg=slateblue1
  hi def hlLevel8 ctermfg=cyan	guifg=magenta1
  hi def hlLevel9 ctermfg=magenta	guifg=purple1
 

  hi default link PicoLispComment Comment
  hi default link PicoLispStatement Statement
  hi default link PicoLispCommentRegion Comment
  hi default link PicoLispString String
  hi default link PicoLispStringRaw String
  hi default link PicoLispVar Statement
endfunction
"inoremap " ""<left>
"#inoremap ' ''<left>
"#inoremap ( ()<left>
"#inoremap [ []<left>
"#inoremap { {}<left>
"#inoremap {<CR> {<CR>}<ESC>O
"#inoremap {;<CR> {<CR>};<ESC>O
