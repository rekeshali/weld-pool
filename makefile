# makefile for weld-pool model

IDIR = ./include  # specify include directory
CC = gcc  # specify compiler
CFLAGS = -I$(IDIR)  # specify compiler flags

ODIR = ./src/obj  # specify make target directory

_DEPS = global.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))  # adds path to dependencies

_OBJ = main.o readfile.o init.o mesh.o output.o flux.o pde.o eos.o conduct.o
#OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))  # adds path
OBJ = $(patsubst %,./src/obj/%,$(_OBJ))

#$(ODIR)/%.o: %.c $(DEPS)
./src/obj/%.o: ./src/%.c
	$(CC) -c -o $@ $< $(CFLAGS)

weld.exe: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

test:
	./weld.exe inputs/debug > outputs/out

clean:
	rm ./src/obj/*.o
	rm *.exe
