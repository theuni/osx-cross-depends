include native-include.mk
SOURCE_FILE=$(SOURCES_PATH)/cdrkit-1.1.11.tar.gz
BUILD_DIR=$(BUILD_BASE)/cdrkit-1.1.11-native

$(NATIVEPREFIX)/bin/genisoimage: $(SOURCE_FILE)
	tar -C $(BUILD_BASE) -xf $<
	mv $(BUILD_BASE)/cdrkit-1.1.11 $(BUILD_DIR)
	cd $(BUILD_DIR); patch -p1 < $(PATCHES_DIR)/cdrtools/genisoimage.diff
	cd $(BUILD_DIR); cmake -DCMAKE_INSTALL_PREFIX=$(NATIVEPREFIX)
	cd $(BUILD_DIR); $(MAKE) genisoimage
	cd $(BUILD_DIR); $(MAKE) install
