function! GetExpression()
  let l:posspace = 0

  let l:startchar = col('.')
  while l:posspace == 0
    let l:space = matchstr(getline('.'), '\%' . l:startchar . 'c.')
    if l:space == " "
      let l:posspace = 1
    else
      let l:startchar = l:startchar - 1
    endif
  endwhile
  
  let l:varend = 0
  let l:parenthcount = 0
  let l:arraycount = 0
  let l:currchar = l:startchar + 1
  let l:outstring = ""
  while l:varend == 0
    let l:tempchar = matchstr(getline('.'), '\%' . l:currchar . 'c.')
    if l:tempchar == "("
      let l:parenthcount = l:parenthcount + 1
    endif
    if l:tempchar == "["
      let l:arraycount = l:arraycount + 1
    endif
    if l:tempchar == " " || l:tempchar == ";" || l:tempchar == ")" || l:tempchar == "]"
      if l:parenthcount == 0 && l:arraycount == 0
        let varend = 1
      endif
      if l:tempchar == ")"
        let l:parenthcount = l:parenthcount - 1
      endif
      if l:tempchar == "]"
        let l:arraycount = l:arraycount - 1
      endif
    endif
    if varend == 0
      let l:outstring = l:outstring . l:tempchar
    endif
    let l:currchar = l:currchar + 1
  endwhile

  echo l:outstring


endfunction
command! GetExp call GetExpression()
