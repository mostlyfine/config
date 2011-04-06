compiler php

set formatoptions-=r
set formatoptions-=o
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
set dictionary=$HOME/.vim/dict/php.dict

let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags=1
let php_folding=0
