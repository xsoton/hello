all: clean hello

hello: main.o lib.o lib2/lib2.o
	gcc main.o lib.o lib2/lib2.o -o hello

main.o: main.c lib.h lib2/lib2.h
	gcc -c main.c -o main.o -Ilib2

lib.o: lib.c lib.h
	gcc -c lib.c -o lib.o

lib2/lib2.o:
	make -C lib2

clean:
	rm -f hello

clean_o:
	rm -f *.o
	make -C lib2 clean_o

.PHONY: all clean clean_o

