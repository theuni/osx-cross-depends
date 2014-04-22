include include.mk
SOURCE_FILE=$(SOURCES_PATH)/miniupnpc-1.9.tar.gz
BUILD_DIR=$(BUILD_BASE)/miniupnpc-1.9

$(PREFIX)/lib/libminiupnpc.a: $(SOURCE_FILE)
	tar -C $(BUILD_BASE) -xf $<
	sed -ie "s|IP_MULTICAST_IF|32|" $(BUILD_DIR)/miniupnpc.c
	cd $(BUILD_DIR); $(MAKE) CC=$(CC) AR=$(AR) CFLAGS="$(CFLAGS) $(CPPFLAGS)" libminiupnpc.a
	cd $(BUILD_DIR); install -d $(PREFIX)/include/miniupnpc
	cd $(BUILD_DIR); install *.h $(PREFIX)/include/miniupnpc
	cd $(BUILD_DIR); install libminiupnpc.a  $(PREFIX)/lib
