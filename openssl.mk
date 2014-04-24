include include.mk
SOURCE_FILE=$(SOURCES_PATH)/openssl-1.0.1g.tar.gz
BUILD_DIR=$(BUILD_BASE)/openssl-1.0.1g

$(PREFIX)/lib/libssl.a: $(SOURCE_FILE)
	tar -C $(BUILD_BASE) -xf $<
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/openssl/patch-bn_internal.pod.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/openssl/patch-Configure.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/openssl/patch-crypto-Makefile.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/openssl/patch-Makefile.org.diff
	sed -ie "s|cc:|$(CC):|" $(BUILD_DIR)/Configure
	sed -ie "s|\(-arch [_a-zA-Z0-9]*\)|\1 --sysroot $(SDK)  -target $(HOST) -msse2|" $(BUILD_DIR)/Configure
	cd $(BUILD_DIR); AR=$(AR) RANLIB=$(RANLIB) ./Configure -L$(PREFIX)/lib --openssldir=$(PREFIX)/etc/openssl zlib no-krb5 no-shared darwin-i386-cc $(CPPFLAGS) --prefix=$(PREFIX)
	sed -i "s|engines apps test|engines|" $(BUILD_DIR)/Makefile
	sed -i "/define DATE/d" $(BUILD_DIR)/crypto/Makefile
	cd $(BUILD_DIR); $(MAKE) -j1 build_libs libcrypto.pc libssl.pc openssl.pc
	cd $(BUILD_DIR); $(MAKE) -j1 install_sw
	touch $@
