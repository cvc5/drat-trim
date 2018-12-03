FLAGS = -DLONGTYPE

all: drat-trim lrat-check compress decompress gapless

drat-trim: main.c drat-trim.o
	gcc main.c -std=c99 -O2 -o drat-trim drat-trim.o

drat-trim.o: drat-trim.c drat-trim.h
	gcc drat-trim.c -fPIC -std=c99 -O2 -c -o drat-trim.o

lrat-check: lrat-check.c
	gcc lrat-check.c -std=c99 $(FLAGS) -O2 -o lrat-check

compress: compress.c
	gcc compress.c -std=c99 $(FLAGS) -O2 -o compress

decompress: decompress.c
	gcc decompress.c -std=c99 $(FLAGS) -O2 -o decompress

gapless: gapless.c
	gcc gapless.c -std=c99 -O2 -o gapless

drat-trim.a: drat-trim.o
	ar rc $@ $^

install: drat-trim.a drat-trim.h drat-trim
	mkdir -p install/lib
	mkdir -p install/include
	mkdir -p install/bin
	cp drat-trim.a install/lib
	cp drat-trim.h install/include
	cp drat-trim install/bin

clean:
	rm drat-trim drat-trim.o drat-trim.a install lrat-check compress decompress gapless
