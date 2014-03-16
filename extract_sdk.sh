#!/bin/bash
# Extract MacOSX10.6.pkg from xcode_3.2.6_and_ios_sdk_4.3.dmg 5.hfs using 7zip
ZIP7=$(which 7z)
if [ ! -x "$ZIP7" ]; then
    echo "Missing the 7z utility."
    echo "On Ubuntu it can be installed with:"
    echo "  apt-get install p7zip"
    exit 1
fi
DMG='xcode_3.2.6_and_ios_sdk_4.3.dmg'
HFS='5.hfs'
SDK='MacOSX10.6.pkg'

if [ ! -f "sources/$DMG" ]; then
  echo "Missing sources/$DMG. Though it is freely available from Apple, it cannot be freely redistributed."
  echo "To obtain it, register for a developer account, then download xcode_3.2.6_and_ios_sdk_4.3.dmg:"
  echo "https://developer.apple.com/devcenter/download.action?path=/Developer_Tools/xcode_3.2.6_and_ios_sdk_4.3__final/xcode_3.2.6_and_ios_sdk_4.3.dmg"
  exit 1
fi
cd sources
echo "edb51dd91076a13a8a13144840f951f1e3834d9761def14fb760fd21ba15fb69  xcode_3.2.6_and_ios_sdk_4.3.dmg" | sha256sum -c

$ZIP7 -y e "$DMG" "$HFS"
$ZIP7 -y e "$HFS" "Xcode and iOS SDK/Packages/$SDK"
rm "$HFS"

echo "a2ccf2299de4e0bb88bd17a3355f02b747575b97492c7c2f5b789a64ccc4cbd6  MacOSX10.6.pkg" | sha256sum -c
cd ..

