include include.mk
SOURCE_FILE=$(SOURCES_PATH)/miniupnpc-1.9.tar.gz
BUILD_DIR=$(BUILD_BASE)/miniupnpc-1.9

$(PREFIX)/lib/libminiupnpc.a: $(SOURCE_FILE)
	tar -C $(BUILD_BASE) -xf $<
	cd $(BUILD_DIR); CFLAGS="$(CFLAGS) $(CPPFLAGS)" $(MAKE) OS=Darwin CC=$(CC) AR=$(AR) libminiupnpc.a
	cd $(BUILD_DIR); install -d $(PREFIX)/include/miniupnpc
	cd $(BUILD_DIR); install *.h $(PREFIX)/include/miniupnpc
	cd $(BUILD_DIR); install libminiupnpc.a  $(PREFIX)/lib
