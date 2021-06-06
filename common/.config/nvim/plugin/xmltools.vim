function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

function! Paulie()
  let l:thisline = getline(".")
  let l:pos = virtcol(".")
  let l:ind = indent(line("."))
  let l:tablength = &tabstop
  " see if current variable is proceeded by a space
  execute "normal! F\<Space>"
  let l:newpos = virtcol(".")
  if (l:newpos == l:pos)
    execute "normal! F\<Tab>"
  endif
  let l:startpos = virtcol(".")
  execute "normal! f\<Space>"
  let l:endpos = virtcol(".")
  if (l:endpos == l:startpos)
    execute "normal! f;"
  endif
  let l:finishpos = virtcol(".")
  let var = strcharpart(l:thisline, l:startpos-(l:ind/l:tablength), l:finishpos-l:startpos-1)
  exe "JDBCommand" . " " . "eval" . " " . l:var
endfunction
command! Paul call Paulie()
