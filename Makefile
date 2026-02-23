FULLCOMP = final.mco
SRC = $(wildcard *.c)
OBJ = $(wildcard *.o)
# OBJ = $(patsubst src/%.c, obj/%.o, $(SRC))
# OBJ = $(patsubst %.c, $(SRC))
# $(subst from, to, text) 
#
# $(patsubst %.c, %.o, foo.c.c bar.c)
# produces ‘foo.c.o bar.o’
# So, you basically have to write the rules in a simple make all yourself.
# But that means it can be quite powerful if you section up your project
# properly.
# However, below we've done the work of making the default the full
# compilation using a variable. In doing so, we can change the named outcome of
# of this default. Alternatively, we can do the same for any given rule and its
# input and output.

default: $(FULLCOMP)

clean:
	rm -f obj/*.o
	rm -f *.mco

$(FULLCOMP): $(SRC)
	gcc -o $@ $? -Iinclude

build: $(OBJ)
	make parse
	make file
	make main
	make $(FULLCOMP)
# gcc -o final.mco $?

# compile_all: $(SRC)
# 	cd ./obj
# 	gcc -c $? -o ./obj/$@
# 	cd ..

parse: parse.c
	gcc -o obj/parse.o -c parse.c

file: file.c
	gcc -o obj/file.o -c file.c

main: main.c
	gcc -o obj/main.o -c main.c