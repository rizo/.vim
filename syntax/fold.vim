" syntax highlighting for fold (fold-lang.org)

if exists('b:current_syntax')
  finish
endif

syn clear

" Errors
syn match    foldBraceError   "}"
syn match    foldBrackError   "\]"
syn match    foldParenError   ")"

" Delimiters
syn region foldEncl transparent matchgroup=foldDelim start="("  matchgroup=foldDelim end=")"  contains=ALLBUT,@foldContained,foldParenError
syn region foldEncl transparent matchgroup=foldDelim start="\[" matchgroup=foldDelim end="\]" contains=ALLBUT,@foldContained,foldBrackError
syn region foldEncl transparent matchgroup=foldDelim start="{"  matchgroup=foldDelim end="}"  contains=ALLBUT,@foldContained,foldBraceError

" Operators:
syn match foldOperator "\([!#$%&\*\+-./<=>\?@\\^|~:]\+\|\<_\>\)"

" Constructors: () [] Foo `Foo
syn match foldConstructor "(\s*)"
" syn match foldConstructor "\[\s*\]"
syn match foldConstructor "\u\(\w\|'\)*\>"
syn match foldConstructor "`[^ (]*"


" Comments
syn match   foldShebangComment "^#!.*"
syn match   foldLineComment "--.*" contains=foldTodo,@spell
syn region  foldBlockComment matchgroup=foldBlockComment start="{-" end="-}" contains=foldTodo,foldBlockComment,@spell
syn region  foldString matchgroup=foldBlockComment start="{{" end="}}" contains=foldTodo,foldBlockComment,@spell
syn keyword foldTodo TODO FIXME XXX HACK contained

" Self
syn keyword foldSelf self Self

" Constants, Characters and Booleans
syn match   foldChar    "'\\\d\d\d'\|'\\[\'ntbr]'\|'.'"
syn match   foldChar    "'\\x\x\x'"
syn match   foldCharError "'\\\d\d'\|'\\\d'"
syn match   foldCharError "'\\[^\'ntbr]'"
syn keyword foldBoolean True False

" Numbers
syn match foldInt    "-\?\<\d\+\>\|0[xX][0-9a-fA-F]\+\|0[bB][01]\+\>"
syn match foldFloat  "\(\<\d\+\.\d\+\>\)"

" Strings
syn region  foldString           start="\"" skip="\\\"" end="\"" contains=foldStringEscape,@foldStringVars,@spell
syn region  foldTripleString     start='"""' skip="\\\"" end='"""' contains=foldStringEscape,@foldStringVars,@spell
syn match   foldStringEscape     "\\u[0-9a-fA-F]\{4}" contained
syn match   foldStringEscape     "\\[nrfvbt\\\"]" contained
syn cluster foldStringVars       contains=foldStringVarsPar,foldStringVarsSqBra,foldStringVarsCurBra,foldStringVarsPla
syn region  foldStringVarsPar	   contained matchgroup=foldStringVarDelim start="$(" end=")" contains=@foldExpressions
syn region  foldStringVarsSqBra	 contained matchgroup=foldStringVarDelim start="$\[" end="\]" contains=@foldExpressions
syn region  foldStringVarsCurBra contained matchgroup=foldStringVarDelim start="${" end="}" contains=@foldExpressions
syn match   foldStringVarsPla    contained "$[_[:alpha:]][_[:alnum:]]*"

" Structures
syn keyword foldStructure type data

" Statement
syn keyword foldStatement assert ignore undefined

" Include
syn keyword foldInclude open import load include use

" Conditional
syn keyword foldConditional if then else unless cond case match when otherwise

" Repeat
syn keyword foldRepeat for each while

" Keyword
syn keyword foldKeyword do end var parser def val with catch where let in quote lambda object rec function syntax func fun fn interface protocol instance module mod signature sig try ext extension macro

" Exception
syn keyword foldException exception raise

" Macro
" TODO: Add `(...)
syn region foldQuoteString start="```" end="```" contains=@foldStringVars

" Type
syn keyword foldType Int Float Char String List Map Option Lazy
syn match foldTypeDef "\v(type\s+)@<=\w+"
syn match foldTypeDef "\v(data\s+)@<=\w+"

" Function
syn match foldFunctionDefName   "\v(def!=\s+)@<=\w+"
syn match foldFunctionDefName   "\v(\|!=\s+)@<=[a-z]+([^\=`]*\=)@="
syn match foldFunctionNamedArgs "\(\w\+\)\(:[^:]\+\)\@="

" Debug
syn match foldUndefined "\.\.\."
syn keyword foldUndefined undefined


" Define Highlightings
hi def link foldBraceError        Error
hi def link foldBrackError        Error
hi def link foldParenError        Error
hi def link foldShebangComment    Comment
hi def link foldLineComment       Comment
hi def link foldBlockComment      Comment
hi def link foldTodo              Todo
hi def link foldDelim             Delimiter
hi def link foldSelf              Special
hi def link foldOperator          Operator
hi def link foldConstructor       Constant
hi def link foldChar              Character
hi def link foldCharError         Error
hi def link foldBoolean           Boolean
hi def link foldFloat             Float
hi def link foldString            String
hi def link foldTripleString      String
hi def link foldStringVarDelim    Delim
hi def link foldStringVarsPla     Special
hi def link foldStructure         Structure
hi def link foldStatement         Statement
hi def link foldInclude           Include
hi def link foldConditional       Conditional
hi def link foldRepeat            Repeat
hi def link foldKeyword           Keyword
hi def link foldException         Exception
hi def link foldQuoteString       Macro
hi def link foldType              Type
hi def link foldUndefined         Debug
hi def link foldFunctionDefName   Function

" Hardcoded for gotham
" hi def link foldFunctionDefName   Define
hi def link foldFunctionNamedArgs Label

let b:current_syntax = 'fold'


