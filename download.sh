#!/bin/bash
set -e

if [ ! -f sources/MacOSX10.6.pkg ]; then
  echo "Missing sources/MacOSX10.6.pkg. Though it is freely available from Apple, it cannot be freely redistributed."
  echo "To obtain it, register for a developer account, then download xcode_3.2.6_and_ios_sdk_4.3.dmg:"
  echo "https://developer.apple.com/devcenter/download.action?path=/Developer_Tools/xcode_3.2.6_and_ios_sdk_4.3__final/xcode_3.2.6_and_ios_sdk_4.3.dmg"
  echo "You can use the script extract_sdk.sh to extract MacOSX10.6.pkg from there."
  exit 1
fi
cd sources
echo "a2ccf2299de4e0bb88bd17a3355f02b747575b97492c7c2f5b789a64ccc4cbd6  MacOSX10.6.pkg" | sha256sum -c
cd ..

RETRIEVE="wget -nc -P sources"
${RETRIEVE} https://github.com/mingwandroid/toolchain4/archive/10cc648683617cca8bcbeae507888099b41b530c.tar.gz
${RETRIEVE} http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.bz2
${RETRIEVE} http://www.opensource.apple.com/tarballs/cctools/cctools-809.tar.gz
${RETRIEVE} http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
${RETRIEVE} http://www.opensource.apple.com/tarballs/dyld/dyld-195.5.tar.gz
${RETRIEVE} http://sourceforge.net/projects/e2fsprogs/files/e2fsprogs/1.41.14/e2fsprogs-libs-1.41.14.tar.gz
${RETRIEVE} http://www.opensource.apple.com/tarballs/ld64/ld64-127.2.tar.gz
${RETRIEVE} ftp://ftp.simplesystems.org/pub/png/src/history/libpng16/libpng-1.6.8.tar.gz
${RETRIEVE} http://opensource.apple.com/tarballs/llvmgcc42/llvmgcc42-2336.1.tar.gz
${RETRIEVE} http://miniupnp.free.fr/files/miniupnpc-1.9.tar.gz
${RETRIEVE} https://www.openssl.org/source/openssl-1.0.1g.tar.gz
${RETRIEVE} https://protobuf.googlecode.com/files/protobuf-2.5.0.tar.bz2
${RETRIEVE} https://fukuchi.org/works/qrencode/qrencode-3.4.3.tar.bz2
${RETRIEVE} http://download.qt-project.org/official_releases/qt/5.2/5.2.1/single/qt-everywhere-opensource-src-5.2.1.tar.gz
${RETRIEVE} https://xar.googlecode.com/files/xar-1.5.2.tar.gz
${RETRIEVE} http://llvm.org/releases/3.2/clang+llvm-3.2-x86-linux-ubuntu-12.04.tar.gz
${RETRIEVE} http://cdrkit.org/releases/cdrkit-1.1.11.tar.gz

cd sources
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
echo "32c7acf1608b9c8b71b743b9780adb7a7b347563dbfb4a5263761056da44cc96  libpng-1.6.8.tar.gz" | sha256sum -c
echo "1b7da383e6c1f07818d9646118ab1cc5d4498f971e9ac21e2e3d47c39ec3a713  llvmgcc42-2336.1.tar.gz" | sha256sum -c
echo "2923e453e880bb949e3d4da9f83dd3cb6f08946d35de0b864d0339cf70934464  miniupnpc-1.9.tar.gz" | sha256sum -c
echo "53cb818c3b90e507a8348f4f5eaedb05d8bfe5358aabb508b7263cc670c3e028  openssl-1.0.1g.tar.gz" | sha256sum -c
echo "13bfc5ae543cf3aa180ac2485c0bc89495e3ae711fc6fab4f8ffe90dfb4bb677  protobuf-2.5.0.tar.bz2" | sha256sum -c
echo "dfd71487513c871bad485806bfd1fdb304dedc84d2b01a8fb8e0940b50597a98  qrencode-3.4.3.tar.bz2" | sha256sum -c
echo "84e924181d4ad6db00239d87250cc89868484a14841f77fb85ab1f1dbdcd7da1  qt-everywhere-opensource-src-5.2.1.tar.gz" | sha256sum -c
echo "4c5d5682803cdfab16d72365cf51fc4075d597c5eeaa8c7d1990fea98cdae3e6  xar-1.5.2.tar.gz" | sha256sum -c
echo "d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc78e47da  cdrkit-1.1.11.tar.gz" | sha256sum -c
cd ..

