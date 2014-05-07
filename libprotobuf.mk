include include.mk
SOURCE_FILE=$(SOURCES_PATH)/protobuf-2.5.0.tar.bz2
BUILD_DIR=$(BUILD_BASE)/protobuf-2.5.0

$(PREFIX)/lib/libprotobuf.a: $(SOURCE_FILE)
	tar -C $(BUILD_BASE) -xjf $<
	cd $(BUILD_DIR); $(CONFIGURE) --enable-shared=no --disable-dependency-tracking --with-protoc=$(NATIVEPREFIX)/bin/protoc
	cd $(BUILD_DIR)/src; $(MAKE) libprotobuf.la
	cd $(BUILD_DIR)/src; $(MAKE) install-libLTLIBRARIES install-nobase_includeHEADERS
	cd $(BUILD_DIR); $(MAKE) install-pkgconfigDATA
	touch $@
