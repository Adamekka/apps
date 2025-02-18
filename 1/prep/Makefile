CC = clang
NASM = nasm
CFLAGS = -Wall -Wextra -m64 -target x86_64-apple-macos
NASMFLAGS = -f macho64
LDFLAGS = -m64 -target x86_64-apple-macos

EXEC = a.out
OBJ = main.o main_s.o

all: $(EXEC)

main.o: main.c
	$(CC) $(CFLAGS) -c $< -o $@

main_s.o: main.s
	$(NASM) $(NASMFLAGS) $< -o $@

$(EXEC): $(OBJ)
	$(CC) $(LDFLAGS) $^ -o $@

run: $(EXEC)
	./$(EXEC)

clean:
	rm -f $(OBJ) $(EXEC)
