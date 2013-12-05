#!/bin/bash
set -e

if [ ! -f MacOSX10.6.pkg ]; then
  echo "Missing MacOSX10.6.pkg. Though it is freely available from Apple, it cannot be freely redistributed."
  echo "To obtain it, register for a developer account, then download xcode_3.2.6_and_ios_sdk_4.3.dmg:"
  echo "https://developer.apple.com/devcenter/download.action?path=/Developer_Tools/xcode_3.2.6_and_ios_sdk_4.3__final/xcode_3.2.6_and_ios_sdk_4.3.dmg"
  echo "There is plenty of info on the net about extracting MacOSX10.6.pkg from there."
  exit 1
fi
echo "a2ccf2299de4e0bb88bd17a3355f02b747575b97492c7c2f5b789a64ccc4cbd6  MacOSX10.6.pkg" | sha256sum -c

RETRIEVE="wget -nc -P sources"
${RETRIEVE} https://github.com/mingwandroid/toolchain4/archive/10cc648683617cca8bcbeae507888099b41b530c.tar.gz
${RETRIEVE} http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.bz2
${RETRIEVE} http://www.opensource.apple.com/tarballs/cctools/cctools-809.tar.gz
${RETRIEVE} http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
${RETRIEVE} http://www.opensource.apple.com/tarballs/dyld/dyld-195.5.tar.gz
${RETRIEVE} http://sourceforge.net/projects/e2fsprogs/files/e2fsprogs/1.41.14/e2fsprogs-libs-1.41.14.tar.gz
${RETRIEVE} http://www.opensource.apple.com/tarballs/ld64/ld64-127.2.tar.gz
${RETRIEVE} http://sourceforge.net/projects/libpng/files/libpng15/older-releases/1.5.9/libpng-1.5.9.tar.gz
${RETRIEVE} http://opensource.apple.com/tarballs/llvmgcc42/llvmgcc42-2336.1.tar.gz
${RETRIEVE} http://miniupnp.free.fr/files/miniupnpc-1.6.tar.gz
${RETRIEVE} https://www.openssl.org/source/openssl-1.0.1e.tar.gz
${RETRIEVE} https://protobuf.googlecode.com/files/protobuf-2.5.0.tar.bz2
${RETRIEVE} http://fukuchi.org/works/qrencode/qrencode-3.2.0.tar.bz2
${RETRIEVE} http://download.qt-project.org/official_releases/qt/4.8/4.8.5/qt-everywhere-opensource-src-4.8.5.tar.gz
${RETRIEVE} https://xar.googlecode.com/files/xar-1.5.2.tar.gz
${RETRIEVE} http://llvm.org/releases/3.2/clang+llvm-3.2-x86-linux-ubuntu-12.04.tar.gz

#gitian doesn't like the + in this filename
mv clang+llvm-3.2-x86-linux-ubuntu-12.04.tar.gz clang-llvm-3.2-x86-linux-ubuntu-12.04.tar.gz

echo "18406961fd4a1ec5c7ea35c91d6a80a2f8bb797a2bd243a610bd75e13eff9aca  10cc648683617cca8bcbeae507888099b41b530c.tar.gz" | sha256sum -c
echo "fff00023dd79486d444c8e29922f4072e1d451fc5a4d2b6075852ead7f2b7b52  boost_1_55_0.tar.bz2" | sha256sum -c
echo "03ba62749b843b131c7304a044a98c6ffacd65b1399b921d69add0375f79d8ad  cctools-809.tar.gz" | sha256sum -c
echo "12edc0df75bf9abd7f82f821795bcee50f42cb2e5f76a6a281b85732798364ef  db-4.8.30.NC.tar.gz" | sha256sum -c
echo "b9d57a88f9514fa1f327a1a703756d0c1c960f4c58494a5bd80313245d13ffff  clang-llvm-3.2-x86-linux-ubuntu-12.04.tar.gz" | sha256sum -c
echo "2cf0484c87cf79b606b351a7055a247dae84093ae92c747a74e0cde2c8c8f83c  dyld-195.5.tar.gz" | sha256sum -c
echo "dbc7a138a3218d9b80a0626b5b692d76934d6746d8cbb762751be33785d8d9f5  e2fsprogs-libs-1.41.14.tar.gz" | sha256sum -c
echo "97b75547b2bd761306ab3e15ae297f01e7ab9760b922bc657f4ef72e4e052142  ld64-127.2.tar.gz" | sha256sum -c
echo "b75dae26151f9b031062c8d2f577a094b08da0ae44fe8c11175d0b9ff434cc02  libpng-1.5.9.tar.gz" | sha256sum -c
echo "1b7da383e6c1f07818d9646118ab1cc5d4498f971e9ac21e2e3d47c39ec3a713  llvmgcc42-2336.1.tar.gz" | sha256sum -c
echo "bbd6b756e6af44b5a5b0f9b93eada3fb8922ed1d6451b7d6f184d0ae0c813994  miniupnpc-1.6.tar.gz" | sha256sum -c
echo "f74f15e8c8ff11aa3d5bb5f276d202ec18d7246e95f961db76054199c69c1ae3  openssl-1.0.1e.tar.gz" | sha256sum -c
echo "13bfc5ae543cf3aa180ac2485c0bc89495e3ae711fc6fab4f8ffe90dfb4bb677  protobuf-2.5.0.tar.bz2" | sha256sum -c
echo "03c4bc7cd9a75747c3815d509bbe061907d615764f2357923f0db948c567068f  qrencode-3.2.0.tar.bz2" | sha256sum -c
echo "eb728f8268831dc4373be6403b7dd5d5dde03c169ad6882f9a8cb560df6aa138  qt-everywhere-opensource-src-4.8.5.tar.gz" | sha256sum -c
echo "4c5d5682803cdfab16d72365cf51fc4075d597c5eeaa8c7d1990fea98cdae3e6  xar-1.5.2.tar.gz" | sha256sum -c
