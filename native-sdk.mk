include native-include.mk
SOURCE_FILE=$(SOURCES_PATH)/MacOSX10.6.pkg

$(SDK)/SDKSettings.plist: $(SOURCE_FILE)
	mkdir -p $(@D)
	cd SDKs; 7z -y e $(SOURCE_FILE)
	gunzip -c SDKs/Payload | cpio -i
	cd SDKs; rm -f Bom PackageInfo Payload
	touch $@
