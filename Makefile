FULLCOMP = final.mco
SRC = $(wildcard *.c)
OBJ = $(wildcard *.o)
# Now supporting your compiler of choice! (maybe)
CC = gcc
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

run: $(FULLCOMP)
	./$(FULLCOMP)

clean:
	rm -f obj/*.o
	rm -f *.mco

$(FULLCOMP): $(SRC)
	$(CC) -o $@ $? -Iinclude

build: $(OBJ)
	make parse
	make file
	make main
	make $(FULLCOMP)

# compile_all: $(SRC)
# 	cd ./obj
# 	$(CC) -c $? -o ./obj/$@
# 	cd ..

parse: parse.c
	$(CC) -o obj/parse.o -c source/parse.c

file: file.c
	$(CC) -o obj/file.o -c source/file.c

main: main.c
	$(CC) -o obj/main.o -c source/main.c