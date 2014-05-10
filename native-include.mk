include include.mk
CFLAGS:=-m32
LDFLAGS:=-m32 -L$(NATIVEPREFIX)/lib
CC:=gcc
CXX:=g++
