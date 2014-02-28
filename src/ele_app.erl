-module(ele_app).

-behaviour(application).

%% Application callbacks
-export([start/0, start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_Type, _Args) ->
    io:fwrite("hello, world\n"),
    ele_sup:start_link().

stop(_State) ->
    ok.

start() ->
    application:start(ele),
    parse(),
    init:stop().

parse() ->
    {ok, Tokens, _} = ele_lexer:string("(aa) bbb"),
    io:fwrite("~p~n", [Tokens]),
    {ok, ParseTree} = ele_parser:parse(Tokens),
    io:fwrite("~p~n", [ParseTree]),
    {value, Value, _} = erl_eval:expr(translate(ParseTree), []),
    io:fwrite("~p~n", [Value]).
%    compile:forms([ParseTree]).

translate({string, Line, Value})-> {string, Line, Value};
translate({atom, Line, Value})-> {atom, Line, Value};
translate({Val0, Val1})-> {tuple, 0, [translate(Val0),translate(Val1)]};
translate({Value})-> translate(Value).

