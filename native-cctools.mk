include native-include.mk
SOURCE_FILE=$(SOURCES_PATH)/10cc648683617cca8bcbeae507888099b41b530c.tar.gz
BUILD_DIR=$(BUILD_BASE)/toolchain4-10cc648683617cca8bcbeae507888099b41b530c

$(NATIVEPREFIX)/bin/$(HOST)-ld: $(SOURCE_FILE) $(SOURCES_PATH)/ld64-127.2.tar.gz $(SOURCES_PATH)/cctools-809.tar.gz $(SOURCES_PATH)/dyld-195.5.tar.gz
	tar -C $(BUILD_BASE) -xf $(SOURCE_FILE)
	mkdir -p $(BUILD_DIR)/sdks
	cd $(BUILD_DIR)/sdks; ln -sf $(SDK) MacOSX10.6.sdk
	ln -sf $(SOURCES_PATH)/cctools-809.tar.gz $(BUILD_DIR)/cctools2odcctools/cctools-809.tar.gz
	ln -sf $(SOURCES_PATH)/ld64-127.2.tar.gz $(BUILD_DIR)/cctools2odcctools/ld64-127.2.tar.gz
	ln -sf $(SOURCES_PATH)/dyld-195.5.tar.gz $(BUILD_DIR)/cctools2odcctools/dyld-195.5.tar.gz

	#Hack in the use of our llvm headers rather than grabbing the old llvm-gcc.
	cd $(BUILD_DIR); tar xf $(SOURCES_PATH)/clang-llvm-3.2-x86-linux-ubuntu-12.04.tar.gz
	sed -i "s|GCC_DIR|LLVM_CLANG_DIR|g" $(BUILD_DIR)/cctools2odcctools/extract.sh
	sed -i "s|llvmgcc42-2336.1|clang+llvm-3.2-x86-linux-ubuntu-12.04|g" $(BUILD_DIR)/cctools2odcctools/extract.sh
	sed -i "s|\$${LLVM_CLANG_DIR}/llvmCore/include/llvm-c|\$${LLVM_CLANG_DIR}/include/llvm-c \$${LLVM_CLANG_DIR}/include/llvm |" $(BUILD_DIR)/cctools2odcctools/extract.sh

	sed -i "s|fAC_INIT|AC_INIT|" $(BUILD_DIR)/cctools2odcctools/files/configure.ac
	sed -i 's/\# Dynamically linked LTO/\t ;\&\n\t linux*)\n# Dynamically linked LTO/' $(BUILD_DIR)/cctools2odcctools/files/configure.ac
	cd $(BUILD_DIR)/cctools2odcctools; ./extract.sh --osxver 10.6
	cd $(BUILD_DIR)/cctools2odcctools/odcctools-809; ./configure --prefix=$(NATIVEPREFIX) --target=$(HOST) CFLAGS="$(CFLAGS) -I$(NATIVEPREFIX)/include -D__DARWIN_UNIX03 -D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS" LDFLAGS="$(LDFLAGS) -Wl,-rpath=\\$$\$$ORIGIN/../lib" --with-sysroot=$(SDK)

	# the 'PC' define in sparc/reg.h conflicts but doesn't get used anyway. Just rename it.
	sed -i "s|define\tPC|define\tPC_|"  $(BUILD_DIR)/cctools2odcctools/odcctools-809/include/architecture/sparc/reg.h
	cd $(BUILD_DIR)/cctools2odcctools/odcctools-809; $(MAKE)
	cd $(BUILD_DIR)/cctools2odcctools/odcctools-809; $(MAKE) install
