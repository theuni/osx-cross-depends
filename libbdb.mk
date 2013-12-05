include include.mk
SOURCE_FILE=$(SOURCES_PATH)/db-4.8.30.NC.tar.gz
BUILD_DIR=$(BUILD_BASE)/db-4.8.30.NC

$(PREFIX)/lib/libdb_cxx.a: $(SOURCE_FILE)
	tar -C $(BUILD_BASE) -xf $<
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)//bdb/patch-dbinc_atomic.h
	cd $(BUILD_DIR)/build_unix; ../dist/$(CONFIGURE) --disable-shared --enable-cxx
	$(MAKE) -C $(BUILD_DIR)/build_unix libdb.a $(@F)
	$(MAKE) -C $(BUILD_DIR)/build_unix install_lib install_include
	touch $@
