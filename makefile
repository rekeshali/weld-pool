# makefile for weld-pool model

IDIR = ./include  # specify include directory
CC = gcc  # specify compiler
CFLAGS = -I$(IDIR)  # specify compiler flags

ODIR = ./src/obj  # specify make target directory

_DEPS = global.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))  # adds path to dependencies

_OBJ = main.o readfile.o init.o mesh.o output.o flux.o pde.o eos.o conduct.o
OBJ = $(patsubst %,$(ODIR)%,$(_OBJ))  # adds path

#$(ODIR)/%.o: %.c $(DEPS)
./src/obj/%.o: ./src/%.c
	$(CC) -c -o $@ $< $(CFLAGS)

#weld.exe: $(OBJ)
weld.exe: src/obj/main.o src/obj/readfile.o src/obj/init.o src/obj/mesh.o src/obj/output.o src/obj/flux.o src/obj/pde.o src/obj/eos.o src/obj/conduct.o
	$(CC) -o $@ $^ $(CFLAGS)

test:
	./weld.exe inputs/debug > outputs/out

clean:
	rm ./src/obj/*.o
	rm *.exe
