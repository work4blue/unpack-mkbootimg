# Andrew Huang <bluedrum@163.com>
CC = gcc
AR = ar rcv
STRIP = strip
ifeq ($(windir),)
EXE =
RM = rm -f
else
EXE = .exe
RM = del
endif



all:libmincrypt.a mkbootimg$(EXE) unpackbootimg$(EXE)

libmincrypt.a:
	make -C libmincrypt

mkbootimg$(EXE):mkbootimg.o
	$(CC) -o $@ $^ -L. -lmincrypt -static
	$(STRIP) $@

mkbootimg.o:mkbootimg.c
	$(CC) -o $@ -c $< -I.


unpackbootimg$(EXE):unpackbootimg.o
	$(CC) -o $@ $^ -static
	$(STRIP) $@

unpackbootimg.o:unpackbootimg.c
	$(CC) -o $@ -c $< 

clean:
	$(RM) mkbootimg mkbootimg.o unpackbootimg unpackbootimg.o 
	$(RM) libmincrypt.a Makefile.~
	make -C libmincrypt clean


		


	
