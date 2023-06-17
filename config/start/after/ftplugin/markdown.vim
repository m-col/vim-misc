" Identify HTML comment-like blocks as markdown comments
setlocal comments+=s:<!---,e:-->
" couldn't get this to work, so just sticking in <br> where needed
"setlocal comments+=s:![**,e:](

" Folding logic below is derived from the vim-markdown-folding plugin
function! StackedMarkdownFolds()
  let thisline = getline(v:lnum)
  let prevline = getline(v:lnum - 1)
  let nextline = getline(v:lnum + 1)
  if thisline =~ '^```.*$' && prevline =~ '^\s*$'  " start of a fenced block
    return ">2"
  elseif thisline =~ '^```$' && nextline =~ '^\s*$'  " end of a fenced block
    return "<2"
  endif

  if HeadingDepth(v:lnum) > 0
    return ">1"
  else
    return "="
  endif
endfunction

function! HeadingDepth(lnum)
  let level=0
  let thisline = getline(a:lnum)
  if thisline =~ '^#\+\s\+'
    let hashCount = len(matchstr(thisline, '^#\{1,6}'))
    if hashCount > 0
      let level = hashCount
    endif
  else
    if thisline != ''
      let nextline = getline(a:lnum + 1)
      if nextline =~ '^=\+\s*$'
        let level = 1
      elseif nextline =~ '^-\+\s*$'
        let level = 2
      endif
    endif
  endif
  if level > 0 && HasSyntaxGroup(a:lnum, '\vmarkdown(Code|Highlight)')
    " Ignore # or === if they appear within fenced code blocks
    let level = 0
  endif
  return level
endfunction

function! HasSyntaxGroup(lnum, targetGroup)
  let syntaxGroup = map(synstack(a:lnum, 1), 'synIDattr(v:val, "name")')
  for value in syntaxGroup
    if value =~ a:targetGroup
        return 1
    endif
  endfor
endfunction

function! s:FoldText()
  let level = HeadingDepth(v:foldstart)
  let indent = repeat('#', level)
  let title = substitute(getline(v:foldstart), '^#\+\s\+', '', '')

  let spaces_1 = repeat(' ', level) . '   '
  let spaces_2 = repeat(' ', 200)

  return indent.spaces_1.title.spaces_2
endfunction

setlocal foldmethod=expr

let &l:foldtext = expand('<SID>') . 'FoldText()'
let &l:foldexpr = 'StackedMarkdownFolds()'

if !exists("b:undo_ftplugin") | let b:undo_ftplugin = '' | endif
let b:undo_ftplugin .= '
  \ | setlocal foldmethod< foldtext< foldexpr<
  \ '
