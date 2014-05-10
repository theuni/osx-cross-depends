include include.mk
SOURCE_FILE=$(SOURCES_PATH)/boost_1_55_0.tar.bz2
BUILD_DIR=$(BUILD_BASE)/boost_1_55_0

$(PREFIX)/lib/libboost_filesystem-mt.a: $(SOURCE_FILE)
	tar -C $(BUILD_BASE) -xf $<
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/boost/patch-tools_build_v2_engine_src_build.sh.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/boost/patch-tools_build_v2_engine_src_build.jam.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/boost/patch-libs-context-130308-0.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/boost/patch-bootstrap.sh.diff
	cd $(BUILD_DIR); ./bootstrap.sh --with-libraries=chrono,filesystem,program_options,system,thread,test
	echo "using darwin : : $(CXX) : <cxxflags>\"$(CFLAGS) $(CPPFLAGS)\" <linkflags>\"$(LDFLAGS) $(CLANG_LDFLAGS)\" <archiver>\"$(LIBTOOL)\" <striper>\"$(STRIP)\" : ;" > $(BUILD_DIR)/user-config.jam
	cd $(BUILD_DIR); ./b2 -d2 --layout=tagged --build-type=complete --prefix=$(PREFIX) --toolset=darwin-4.2.1 --user-config=user-config.jam variant=release threading=multi link=static install
