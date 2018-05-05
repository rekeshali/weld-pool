# makefile for weld-pool model

IDIR = include
CC = gcc
CFLAGS = -I$(IDIR) -O2

SDIR = src
ODIR = src/obj

_DEPS = global.h declarations.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = main.o readfile.o init.o mesh.o output.o flux.o pde.o eos.o conduct.o BCFlux.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SDIR)/%.c
	$(CC) -c -o $@ $< $(CFLAGS)

all: weld.exe

parallel: CFLAGS += -fopenmp
parallel: weld.exe

weld.exe: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

test:
	time ./weld.exe inputs/debug

clean:
	rm ./src/obj/*.o
	rm *.exe

clear:
	rm ./outputs/*
