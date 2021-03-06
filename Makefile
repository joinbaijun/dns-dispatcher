## Makefile for dadder ##

CFLAGS=-c -Wall -g -O0 -DDEBUG
#include Makefile.inc

CC=gcc
LDFLAGS=-lresolv -lpthread -lm
SOURCES=policy.c resolvers.c list.c mystring.c trie.c ip_prefix.c main.c config.c ini.c common.c \
		dispatcher.c recv_send.c  query.c clean_timeout.c


OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=dns-dispatch

prefix=/usr/local/$(EXECUTABLE)

all: $(EXECUTABLE)
	
$(EXECUTABLE): $(OBJECTS) 
	$(CC) -o $@ $(OBJECTS)  $(LDFLAGS)

#%.o: %.c %.h common.h  query.h config.h policy.h  
%.o: %.c *.h 
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJECTS) 
	rm -f $(EXECUTABLE) 
    
install:
	./install.sh  $(prefix)  $(EXECUTABLE)
