LEX=lex
YACC=yacc
CC=g++

scc:lex.yy.o y.tab.o
	$(CC) y.tab.c -g -ly -ll -o scc 2> error.err
lex.yy.o:lex.yy.c y.tab.h
	$(CC) -c lex.yy.c 2> error.err

y.tab.o:y.tab.c def.h ast.h semantics.h translate.h optimize.h interprete.h
	$(CC) -c y.tab.c 2> error.err

y.tab.c y.tab.h:smallc.y header.h def.h ast.h semantics.h translate.h optimize.h interprete.h
	$(YACC) smallc.y -v -d

lex.yy.c:smallc.l header.h def.h ast.h semantics.h translate.h optimize.h interprete.h
	$(LEX) smallc.l

clean:
	rm -f *.o *.c *.h
