OBJECTS = euler.o main.o
.PHONY: clean

main: $(OBJECTS)
	  gfortran -fdefault-real-8 $(OBJECTS) -o main

%.o : %.F90
	gfortran -ggdb -O3 -fdefault-real-8 -fdefault-double-8 -ffree-line-length-none -Wuninitialized -c $<

clean:
	rm -f $(OBJECTS) main
