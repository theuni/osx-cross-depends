include native-include.mk
SOURCE_FILE=$(SOURCES_PATH)/protobuf-2.5.0.tar.bz2
BUILD_DIR=$(BUILD_BASE)/native-protobuf-2.5.0

$(NATIVEPREFIX)/bin/protoc: $(SOURCE_FILE)
	tar -C $(BUILD_BASE) -xjf $<
	mv $(BUILD_BASE)/protobuf-2.5.0 $(BUILD_DIR)
	cd $(BUILD_DIR); ./configure --enable-shared=no --disable-dependency-tracking --prefix=$(NATIVEPREFIX)
	cd $(BUILD_DIR); $(MAKE)
	mkdir -p $(NATIVEPREFIX)/bin
	cp $(BUILD_DIR)/src/protoc $@

