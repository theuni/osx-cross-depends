#!/bin/bash
set -e
MAKEOPTS=-j4

make $MAKEOPTS -f native-xar.mk
make $MAKEOPTS -f native-sdk.mk
make $MAKEOPTS -f native-llvm-lto.mk
make $MAKEOPTS -f native-libuuid.mk
make $MAKEOPTS -f native-openssl.mk
make $MAKEOPTS -f native-libprotobuf.mk
make $MAKEOPTS -f native-cctools.mk
make $MAKEOPTS -f native-cdrkit.mk
make $MAKEOPTS -f native-libdmg-hfsplus.mk

make $MAKEOPTS -f libbdb.mk
make $MAKEOPTS -f openssl.mk
make $MAKEOPTS -f libminiupnpc.mk
make $MAKEOPTS -f libqrencode.mk
make $MAKEOPTS -f libprotobuf.mk
make $MAKEOPTS -f boost.mk
make $MAKEOPTS -f qt5.mk
