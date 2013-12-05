include native-include.mk
SOURCE_FILE=$(SOURCES_PATH)/llvmgcc42-2336.1.tar.gz
BUILD_DIR=$(BUILD_BASE)/llvmgcc42-2336.1

$(NATIVEPREFIX)/lib/libLTO.a: $(SOURCE_FILE)
	tar -C $(BUILD_BASE) -xf $<
	cd $(BUILD_DIR); patch -p1 < $(PATCHES_DIR)/llvmgcc/100-redundant.patch
	cd $(BUILD_DIR); patch -p1 < $(PATCHES_DIR)/llvmgcc/110-mempcpy.patch
	cd $(BUILD_DIR); patch -p1 < $(PATCHES_DIR)/llvmgcc/120-relocatable-libexec-llvmgcc.patch
	cd $(BUILD_DIR); patch -p1 < $(PATCHES_DIR)/llvmgcc/130-lib-system.patch
	cd $(BUILD_DIR); patch -p1 < $(PATCHES_DIR)/llvmgcc/140-gcc462-ptrdiff_t.patch
	cd $(BUILD_DIR); patch -p1 < $(PATCHES_DIR)/llvmgcc/150-gcc462-remove-NULL.patch
	cd $(BUILD_DIR); patch -p1 < $(PATCHES_DIR)/llvmgcc/160-t-darwin_prefix.patch
	cd $(BUILD_DIR); patch -p1 < $(PATCHES_DIR)/llvmgcc/170-relocatable-cpp.patch
	cd $(BUILD_DIR); patch -p1 < $(PATCHES_DIR)/llvmgcc/180-Makefile-rules-remove-ld-option--modules.patch
	cd $(BUILD_DIR); patch -p1 < $(PATCHES_DIR)/llvmgcc/190-gcc470-scoping-fixes.patch
	cd $(BUILD_DIR); patch -p1 < $(PATCHES_DIR)/llvmgcc/200-t-mingw64.patch
	cd $(BUILD_DIR); patch -p1 < $(PATCHES_DIR)/llvmgcc/210-libiberty-mingw64.patch
	cd $(BUILD_DIR); patch -p1 < $(PATCHES_DIR)/llvmgcc/220-t-slibgcc-darwin-ln-order.patch
	cd $(BUILD_DIR); patch -p1 < $(PATCHES_DIR)/llvmgcc/230-use-ll-when-__USE_MINGW_ANSI_STDIO.patch
	cd $(BUILD_DIR); patch -p1 < $(PATCHES_DIR)/llvmgcc/240-use-CXX_FOR_BUILD-not-CXX.patch
	cd $(BUILD_DIR); sed -i "s|\`date\`|$(REFERENCE_DATETIME)|" llvmCore/configure
	cd $(BUILD_DIR); sed -i "s|__DATE__|\"$(REFERENCE_DATE)\"|" llvmCore/lib/Support/CommandLine.cpp
	cd $(BUILD_DIR); sed -i "s|__TIME__|\"$(REFERENCE_TIME)\"|" llvmCore/lib/Support/CommandLine.cpp
	cd $(BUILD_DIR)/llvmCore; ./configure --prefix=$(NATIVEPREFIX) CC="$(CC) -m32" CXX="$(CXX) -m32" LDFLAGS=$(LDFLAGS) --enable-optimized --disable-assertions --target=
	cd $(BUILD_DIR)/llvmCore; $(MAKE) -f Makefile
	cd $(BUILD_DIR)/llvmCore; $(MAKE) -f Makefile install-libs
	cd $(BUILD_DIR)/llvmCore; $(MAKE) -C tools install
