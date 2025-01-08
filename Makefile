CC = g++

M_FLAGS = -fsanitize=address -fsanitize=leak -fno-omit-frame-pointer

W_FLAGS = -std=c++1z -Wall -Wshadow -Wformat-security -Wpointer-arith -Wcast-align -Wredundant-decls

CFLAGS = -g2 -Os -DIMCSTANDALONE $(W_FLAGS) $(M_FLAGS)
LFLAGS = -g2 $(M_FLAGS)

all:    imc.o sha256.o
	rm -f imc
	$(CC) $(CFLAGS) -o imc imc.o sha256.o $(LFLAGS)

clean:
	rm -f *.o imc core
	make all

purge:
	rm -f *.o imc core
