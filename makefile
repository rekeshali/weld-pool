# makefile for weld-pool model

IDIR = include
CC = gcc
CFLAGS = -I$(IDIR) -O2

SDIR = src
ODIR = src/obj

_DEPS = global.h declarations.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = main.o readfile.o init.o mesh.o output.o flux.o pde.o eos.o conduct.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SDIR)/%.c
	$(CC) -c -o $@ $< $(CFLAGS)

weld.exe: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

test:
	time ./weld.exe inputs/debug > outputs/out

clean:
	rm ./src/obj/*.o
	rm *.exe
