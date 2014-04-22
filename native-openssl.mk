include native-include.mk
SOURCE_FILE=$(SOURCES_PATH)/openssl-1.0.1g.tar.gz
BUILD_DIR=$(BUILD_BASE)/native-openssl-1.0.1g

$(NATIVEPREFIX)/lib/libssl.a: $(SOURCES_PATH)/openssl-1.0.1g.tar.gz
	tar -C $(BUILD_BASE) -xf $<; mv $(BUILD_BASE)/openssl-1.0.1g $(BUILD_DIR)
	cd $(BUILD_DIR); ./Configure --prefix=$(NATIVEPREFIX) -no-shared -no-zlib-dynamic -no-test linux-generic32
	sed -ie "/define DATE/d" $(BUILD_DIR)/crypto/Makefile
	cd $(BUILD_DIR); $(MAKE) -j1 CC="$(CC) -m32" depend
	cd $(BUILD_DIR); $(MAKE) -j1 CC="$(CC) -m32"
	cd $(BUILD_DIR); $(MAKE) -j1 CC="$(CC) -m32" install_sw
