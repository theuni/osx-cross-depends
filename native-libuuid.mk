include native-include.mk
SOURCE_FILE=$(SOURCES_PATH)/e2fsprogs-libs-1.41.14.tar.gz
BUILD_DIR=$(BUILD_BASE)/e2fsprogs-libs-1.41.14

$(NATIVEPREFIX)/lib/libuuid.a: $(SOURCE_FILE)
	tar -C $(BUILD_BASE) -xf $<
	cd $(BUILD_DIR); ./configure --prefix=$(NATIVEPREFIX) CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" --disable-elf-shlibs --disable-uuidd
	cd $(BUILD_DIR); $(MAKE)
	cd $(BUILD_DIR); $(MAKE) install
