Nonterminals exprs expr.
Terminals atom string '(' ')'.
Rootsymbol exprs.
exprs -> expr exprs : {'$1', '$2'}.
exprs -> expr : '$1'.
expr -> '(' exprs ')' : { '$2' }.
expr -> '(' ')' : {}.
expr -> atom: '$1'.
expr -> string : '$1'.
