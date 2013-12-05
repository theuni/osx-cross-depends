include include.mk
SOURCE_FILE=$(SOURCES_PATH)/qt-everywhere-opensource-src-4.8.5.tar.gz
BUILD_DIR=$(BUILD_BASE)/qt-everywhere-opensource-src-4.8.5

$(PREFIX)/lib/libQtCore.a: $(SOURCE_FILE)
	tar -C $(BUILD_BASE) -xf $<
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-config.tests_unix_compile.test.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-config.tests_unix_precomp.test.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-configure.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-mkspecs_common_g++-macx.conf.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-mkspecs_common_mac.conf.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-mkspecs_features_moc.prf.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-mkspecs_features_qt.prf.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-mkspecs_features_qt_functions.prf.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-mkspecs_common_g++-base.conf.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-mkspecs_objective_cxx.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-mkspecs_macx-g++_qmake.conf.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-qmake_option.h.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-qmake_property.cpp.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-src_corelib_global_qlibraryinfo.cpp.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-src_corelib_global_qlibraryinfo.h.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-qmake_project.cpp.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-qmake_generators_unix_unixmakke.cpp.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-qmake_qmake.pri.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-src_tools_bootstrap_bootstrap.pro.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-src_3rdparty_webkit_Source_WebCore_plugins_PluginView.h.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-src_3rdparty_webkit_Source_WebCore_plugins_mac_PluginViewMac.mm.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-src_3rdparty_webkit_Source_WebKit_qt_QtWebKit.pro.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-src_plugins_bearer_corewlan_corewlan.pro.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-src_plugins_bearer_corewlan_qcorewlanengine.mm.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-src_qbase.pri.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-src_qt_install.pri.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-tools_assistant_lib_fulltextsearch_fulltextsearch.pro.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-tools_assistant_lib_lib.pro.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-tools_designer_src_components_lib_lib.pro.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-tools_designer_src_lib_lib.pro.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-tools_designer_src_uitools_uitools.pro.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-mkspecs_features_uitools.prf.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-tools_macdeployqt_macdeployqt_main.cpp.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-src_corelib_tools_qelapsedtimer-mac.cpp.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-src_3rdparty_webkit_Source_WebCore_WebCore.pro.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-tools_macdeployqt_shared_shared.cpp.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-libc++.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/platform.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-addtarget.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-rpath.diff
	cd $(BUILD_DIR); patch -p0 < $(PATCHES_DIR)/qt/patch-remove-qmake-flags.diff
	cd $(BUILD_DIR); sed -ie "s|@MACOSX_DEPLOYMENT_TARGET@|$(MIN_VERSION)|g" $(BUILD_DIR)/configure $(BUILD_DIR)/mkspecs/common/g++-macx.conf $(BUILD_DIR)/mkspecs/common/mac.conf $(BUILD_DIR)/qmake/qmake.pri $(BUILD_DIR)/src/tools/bootstrap/bootstrap.pro
	cd $(BUILD_DIR); sed -ie "s|@MACOSX_VERSION_MINOR@|5|g" $(BUILD_DIR)/src/plugins/bearer/corewlan/corewlan.pro
	cd $(BUILD_DIR); sed -ie "s|@CXX@|$(CXX)|" $(BUILD_DIR)/mkspecs/common/g++-base.conf
	cd $(BUILD_DIR); sed -ie "s|@CC@|$(CC)|" $(BUILD_DIR)/mkspecs/common/g++-base.conf
	cd $(BUILD_DIR); sed -ie "s|@DEVELOPER_SDK@|$(SDK)|g" $(BUILD_DIR)/src/plugins/bearer/corewlan/corewlan.pro
	cd $(BUILD_DIR); sed -ie "s|@QT_PLUGINS_DIR@|$(PREFIX)/plugins|g" $(BUILD_DIR)/tools/macdeployqt/macdeployqt/main.cpp
	cd $(BUILD_DIR); sed -ie "s|@PREFIX@|$(PREFIX)|g" $(BUILD_DIR)/qmake/generators/unix/unixmake.cpp
	cd $(BUILD_DIR); cp $(PATCHES_DIR)/qt/objective_cxx.prf $(PATCHES_DIR)/qt/split_sources.prf $(BUILD_DIR)/mkspecs/features/mac
	cd $(BUILD_DIR); cp -r $(PATCHES_DIR)/qt/fconstant_cfstrings.test $(PATCHES_DIR)/qt/objc_block $(PATCHES_DIR)/qt/cpath $(PATCHES_DIR)/qt/library_path $(BUILD_DIR)/config.tests/mac
	cd $(BUILD_DIR); sed -ie "s|MAC_CONFIG_TEST_COMMANDLINE -arch i386|MAC_CONFIG_TEST_COMMANDLINE -arch i386 -target $(HOST) -B $(NATIVEPREFIX)/bin|" $(BUILD_DIR)/configure
	cd $(BUILD_DIR); sed -ie "s|ranlib|$(RANLIB)|" $(BUILD_DIR)/mkspecs/common/mac.conf
	cd $(BUILD_DIR); sed -ie "s| ar | $(AR) |" $(BUILD_DIR)/mkspecs/common/mac.conf
	cd $(BUILD_DIR); sed -ie "s|install_name_tool|$(INSTALL_NAME_TOOL)|" $(BUILD_DIR)/mkspecs/common/mac.conf
	cd $(BUILD_DIR); sed -ie "s|@TARGET_TRIPLE@|$(HOST)|g" $(BUILD_DIR)/configure
	cd $(BUILD_DIR); sed -ie "s|-arch i386|-arch i386 -target $(HOST) -mmacosx-version-min=$(MIN_VERSION)|g" $(BUILD_DIR)/mkspecs/common/gcc-base-macx.conf
	cd $(BUILD_DIR); sed -ie "s|headerpad_max_install_names|headerpad_max_install_names -B$(NATIVEPREFIX)/bin|g" $(BUILD_DIR)/mkspecs/darwin-g++/qmake.conf
	cd $(BUILD_DIR); sed -ie "s|-lpng|-lz -lpng|g" $(BUILD_DIR)/config.tests/unix/libpng/libpng.pro
	cd $(BUILD_DIR); sed -ie "s|-dynamiclib|-dynamiclib -B$(NATIVEPREFIX)/bin|g" $(BUILD_DIR)/mkspecs/common/gcc-base-macx.conf
	cd $(BUILD_DIR); LIBRARY_PATH="$(PREFIX)/lib:$(SDK)/usr/lib/i686-apple-darwin10/4.2.1" CPATH="$(PREFIX)/include:$(CLANG_INCLUDES)" ./configure -prefix $(PREFIX) -bindir $(NATIVEPREFIX)/bin -confirm-license -release -opensource -no-qt3support -no-multimedia -no-audio-backend -no-phonon -no-phonon-backend -no-declarative -no-script -no-scripttools -no-javascript-jit -no-webkit -no-svg -no-xmlpatterns -no-sql-sqlite -no-nis -no-cups -no-iconv -no-dbus -no-gif -no-libtiff -no-opengl -nomake examples -nomake demos -nomake docs -no-feature-style-plastique -no-feature-style-cleanlooks -no-feature-style-motif -no-feature-style-cde -no-feature-style-windowsce -no-feature-style-windowsmobile -no-feature-style-s60 -no-pch -openssl-linked -no-sql-db2 -no-sql-ibase -no-sql-oci -no-sql-tds -no-sql-mysql -no-sql-odbc -no-sql-psql -no-sql-sqlite -no-sql-sqlite2 -arch x86 -sdk $(SDK) -xplatform macx-g++ -L$(PREFIX)/lib -L$(SDK)/usr/lib/i686-apple-darwin10/4.2.1 -v -no-reduce-exports
	cd $(BUILD_DIR); LIBRARY_PATH="$(PREFIX)/lib:$(SDK)/usr/lib/i686-apple-darwin10/4.2.1" CPATH="$(PREFIX)/include:$(CLANG_INCLUDES)" $(MAKE)
	cd $(BUILD_DIR); $(MAKE) install
	cd $(PREFIX)/include; ln -sf ../Library/Frameworks/QtCore.framework/Headers/ QtCore
	cd $(PREFIX)/include; ln -sf ../Library/Frameworks/QtGui.framework/Headers/ QtGui
	cd $(PREFIX)/include; ln -sf ../Library/Frameworks/QtNetwork.framework/Headers/ QtNetwork
	cd $(PREFIX)/include; ln -sf ../Library/Frameworks/QtTest.framework/Headers/ QtTest
	cd $(PREFIX)/include; ln -sf ../Library/Frameworks/QtXml.framework/Headers/ QtXml
	touch $@
