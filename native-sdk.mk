include native-include.mk
SOURCE_FILE=$(SOURCES_PATH)/MacOSX10.6.pkg

$(SDK)/SDKSettings.plist: $(SOURCE_FILE) $(NATIVEPREFIX)/bin/xar
	mkdir -p $(@D)
	cd SDKs; $(NATIVEPREFIX)/bin/xar -x -f $(SOURCE_FILE)
	gunzip -c SDKs/Payload | cpio -i
	cd SDKs; rm -f Bom PackageInfo Payload
	touch $@
