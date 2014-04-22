include include.mk
SOURCE_FILE=$(SOURCES_PATH)/qrencode-3.4.3.tar.bz2
BUILD_DIR=$(BUILD_BASE)/qrencode-3.4.3

$(PREFIX)/lib/libqrencode.a: $(SOURCE_FILE)
	tar -C $(BUILD_BASE) -xf $<
	cd $(BUILD_DIR); sed -i 's/@LIBPTHREAD@//' libqrencode.pc.in
	cd $(BUILD_DIR); $(CONFIGURE) --disable-shared -without-tools --disable-sdltest
	cd $(BUILD_DIR); $(MAKE)
	cd $(BUILD_DIR); $(MAKE) install
	touch $@
