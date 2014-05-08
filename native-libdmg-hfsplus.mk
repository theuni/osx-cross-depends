# Used for dmg compression.
# Todo: investigate using this for dmg creation to avoid the need for two utils

include native-include.mk
SOURCE_FILE=$(SOURCES_PATH)/libdmg-hfsplus-v0.1.tar.gz
BUILD_DIR=$(BUILD_BASE)/libdmg-hfsplus-libdmg-hfsplus-v0.1

$(NATIVEPREFIX)/bin/dmg: $(SOURCE_FILE)
	tar -C $(BUILD_BASE) -xf $<
	mkdir -p $(BUILD_DIR)/build
	cd $(BUILD_DIR)/build; cmake -DCMAKE_INSTALL_PREFIX:PATH=$(NATIVEPREFIX)/bin ..
	cd $(BUILD_DIR)/build/dmg; make
	cd $(BUILD_DIR)/build/dmg; make install
