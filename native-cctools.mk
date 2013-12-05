include native-include.mk
SOURCE_FILE=$(SOURCES_PATH)/10cc648683617cca8bcbeae507888099b41b530c.tar.gz
BUILD_DIR=$(BUILD_BASE)/toolchain4-10cc648683617cca8bcbeae507888099b41b530c

$(NATIVEPREFIX)/bin/$(HOST)-ld: $(SOURCE_FILE) $(SOURCES_PATH)/ld64-127.2.tar.gz $(SOURCES_PATH)/cctools-809.tar.gz $(SOURCES_PATH)/dyld-195.5.tar.gz $(SOURCES_PATH)/llvmgcc42-2336.1.tar.gz
	tar -C $(BUILD_BASE) -xf $(SOURCE_FILE)
	mkdir -p $(BUILD_DIR)/sdks
	cd $(BUILD_DIR)/sdks; ln -sf $(SDK) MacOSX10.6.sdk
	ln -sf $(SOURCES_PATH)/cctools-809.tar.gz $(BUILD_DIR)/cctools2odcctools/cctools-809.tar.gz
	ln -sf $(SOURCES_PATH)/ld64-127.2.tar.gz $(BUILD_DIR)/cctools2odcctools/ld64-127.2.tar.gz
	ln -sf $(SOURCES_PATH)/dyld-195.5.tar.gz $(BUILD_DIR)/cctools2odcctools/dyld-195.5.tar.gz
	ln -sf $(SOURCES_PATH)/llvmgcc42-2336.1.tar.gz $(BUILD_DIR)/llvmgcc42-2336.1.tar.gz
	cd $(BUILD_DIR); tar xf $(SOURCES_PATH)/llvmgcc42-2336.1.tar.gz
	sed -i "s|fAC_INIT|AC_INIT|" $(BUILD_DIR)/cctools2odcctools/files/configure.ac
	cd $(BUILD_DIR)/cctools2odcctools; ./extract.sh --osxver 10.6
	cd $(BUILD_DIR)/cctools2odcctools/odcctools-809; ./configure --prefix=$(NATIVEPREFIX) --target=$(HOST) CFLAGS="$(CFLAGS) -I$(NATIVEPREFIX)/include -D__DARWIN_UNIX03" LDFLAGS=$(LDFLAGS) --with-sysroot=$(SDK)
	cd $(BUILD_DIR)/cctools2odcctools/odcctools-809; $(MAKE)
	cd $(BUILD_DIR)/cctools2odcctools/odcctools-809; $(MAKE) install
