PREFIX ?= $(CURDIR)/prefix
NATIVEPREFIX ?= $(CURDIR)/native-prefix
SOURCES_PATH ?= $(CURDIR)/sources

BUILD_BASE=$(CURDIR)/build
PATCHES_DIR=$(CURDIR)/patches
HOST=x86_64-apple-darwin11
SDK=$(CURDIR)/SDKs/MacOSX10.6.sdk
CLANG_INCLUDES=/usr/include/clang/3.2/include
MIN_VERSION=10.6
CFLAGS=-target $(HOST) -mmacosx-version-min=$(MIN_VERSION) --sysroot $(SDK) -msse2 -Qunused-arguments
CXXFLAGS=$(CFLAGS)
LDFLAGS=-B$(NATIVEPREFIX)/bin -L$(PREFIX)/lib -L$(SDK)/usr/lib/i686-apple-darwin10/4.2.1
CPPFLAGS=-I$(CLANG_INCLUDES) -I$(PREFIX)/include
CC=clang
CXX=clang++
OBJC=clang
OBJCXX=clang++
AR=$(HOST)-ar
RANLIB=$(HOST)-ranlib
LIBTOOL=$(HOST)-libtool
INSTALL_NAME_TOOL=$(HOST)-install_name_tool

export PATH:=$(NATIVEPREFIX)/bin:$(PATH)
export ZERO_AR_DATE=1
export REFERENCE_DATETIME ?= Sat Jan  1 00:00:00export REFERENCE_DATE ?= Jan 01 2000
export REFERENCE_TIME ?= 00:00:00

CONFIGURE=./configure --host=$(HOST) --prefix=$(PREFIX) CC=$(CC) CXX=$(CXX) AR=$(AR) RANLIB=$(RANLIB) OBJC=$(OBJC) OBJCXX=$(OBJCXX) CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" CPPFLAGS="$(CPPFLAGS)"
