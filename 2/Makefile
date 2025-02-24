CC=clang
ASM=nasm
CFLAGS=-m64 -Wall -Wextra -std=c11 -fPIC
ASFLAGS=-f elf64
LDFLAGS=-m64 -no-pie

all: a.out

a.out: main.o main_asm.o
	$(CC) $(LDFLAGS) -o a.out main.o main_asm.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

main_asm.o: main.s
	$(ASM) $(ASFLAGS) main.s -o main_asm.o

clean:
	rm -f a.out main.o main_asm.o

run: a.out
	./a.out
