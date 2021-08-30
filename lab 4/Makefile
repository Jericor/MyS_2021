main_out = simulator

main_source = main.c
main_objects = $(main_source:.c=.o)

CC=gcc
CFLAGS = -Wall
LIBS = -lm

depends = .depends

build: $(main_out)

$(main_out) : $(main_objects)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

clean:
	$(RM) $(main_out) $(main_objects) $(zipfile) $(depends)

.PHONY: build zip clean

sinclude $(depends)
