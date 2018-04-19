
all: 
	gcc -o weld.exe main.c
	clear
	./weld.exe debug  > out
	#cat values
	
	#rplot values
	#vim out

test:
	./weld.exe

clean:
	rm *.exe
	rm *.o

