include native-include.mk
SOURCE_FILE=$(SOURCES_PATH)/clang-llvm-3.2-x86-linux-ubuntu-12.04.tar.gz
BUILD_DIR=$(BUILD_BASE)/clang+llvm-3.2-x86-linux-ubuntu-12.04

$(NATIVEPREFIX)/lib/libLTO.so: $(SOURCE_FILE)
	mkdir -p $(NATIVEPREFIX)/lib/clang/3.2/include
	mkdir -p $(NATIVEPREFIX)/bin
	tar -C $(BUILD_BASE) -xf $<
	cp $(BUILD_DIR)/bin/clang $(NATIVEPREFIX)/bin/
	cp $(BUILD_DIR)/bin/clang++ $(NATIVEPREFIX)/bin/
	cp $(BUILD_DIR)/lib/libLTO.so $(NATIVEPREFIX)/lib/
	cp $(BUILD_DIR)/lib/clang/3.2/include/* $(NATIVEPREFIX)/lib/clang/3.2/include
