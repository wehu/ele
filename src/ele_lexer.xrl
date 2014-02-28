Definitions.

Rules.

\( : {token, {'(', TokenLine, TokenChars}}.
\) : {token, {')', TokenLine, TokenChars}}.
"(\\"|[^"\n\(\)])*" : {token, {string, TokenLine, TokenChars}}.
[^\s\(\)\"]+ : {token, {atom, TokenLine, TokenChars}}.
[\s\n]* : skip_token.

Erlang code.

