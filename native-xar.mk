include native-include.mk
SOURCE_FILE=$(SOURCES_PATH)/xar-1.5.2.tar.gz
BUILD_DIR=$(BUILD_BASE)/xar-1.5.2

$(NATIVEPREFIX)/bin/xar: $(SOURCE_FILE)
	tar -C $(BUILD_BASE) -xf $<
	cd $(BUILD_DIR); ./configure
	cd $(BUILD_DIR); $(MAKE)
	mkdir -p $(@D)
	cp $(BUILD_DIR)/src/xar $@
