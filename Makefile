CFLAGS ::= $(CFLAGS) -I/usr/pgsql-12/include -g -Wall
LDFLAGS ::= $(LDFLAGS) -L/usr/pgsql-12/lib -Wl,-rpath,/usr/pgsql-12/lib
LDLIBS ::= $(LDLIBS) -lecpg
 
PROGRAMS = sample
 
.PHONY: all clean
 
%.c: %.pgc
    ecpg $<
 
all: $(PROGRAMS)
 
clean:
    rm -f $(PROGRAMS) $(PROGRAMS:%=%.c) $(PROGRAMS:%=%.o)
