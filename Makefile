run: compile
	./bin/ele

compile: src/ele_parser.yrl src/ele_lexer.xrl src/ele_app.erl src/ele_sup.erl src/ele.app.src
	cd src; erl -noshell -eval 'leex:file("ele_lexer")' -s init stop
	cd src; erl -noshell -eval 'yecc:file("ele_parser")' -s init stop
	./rebar compile
	touch compile
