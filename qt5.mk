include include.mk
SOURCE_FILE=$(SOURCES_PATH)/qt-everywhere-opensource-src-5.2.1.tar.gz
BUILD_DIR=$(BUILD_BASE)/qt-everywhere-opensource-src-5.2.1

QT_OPTS  = -release -opensource -openssl-linked
QT_OPTS += -no-audio-backend  -no-javascript-jit -no-sql-sqlite -no-sql-tds
QT_OPTS += -no-cups -no-iconv -no-dbus -no-gif -no-audio-backend -no-freetype
QT_OPTS += -no-javascript-jit -no-sql-sqlite -no-nis -no-cups -no-iconv -no-pch
QT_OPTS += -no-dbus -no-gif -no-sm -nomake examples -no-feature-style-plastique
QT_OPTS += -no-reduce-exports -no-xcb -no-qml-debug -no-pch -no-nis
QT_OPTS += -no-feature-style-cde -no-feature-style-s60 -no-feature-style-motif
QT_OPTS += -no-feature-style-windowsmobile -no-feature-style-windowsce
QT_OPTS += -no-feature-style-cleanlooks
QT_OPTS += -no-sql-db2 -no-sql-ibase -no-sql-oci -no-sql-tds -no-sql-mysql
QT_OPTS += -no-sql-odbc -no-sql-psql -no-sql-sqlite -no-sql-sqlite2

QT_OPTS += -skip qtsvg -skip qtwebkit -skip qtwebkit-examples -skip qtserialport
QT_OPTS += -skip qtdeclarative -skip qtmultimedia -skip qtimageformats
QT_OPTS += -skip qtlocation -skip qtsensors -skip qtquick1 -skip qtxmlpatterns
QT_OPTS += -skip qtquickcontrols -skip qtactiveqt -skip qtconnectivity
QT_OPTS += -skip qtwinextras -skip qtscript

QT_BUILD_CONFIG  = -prefix $(PREFIX) -bindir $(NATIVEPREFIX)/bin
QT_BUILD_CONFIG += -L$(PREFIX)/lib -L$(SDK)/usr/lib/i686-apple-darwin10/4.2.1
QT_BUILD_CONFIG += -confirm-license -xplatform macx-clang-linux -v

SPECFILE=$(BUILD_DIR)/qtbase/mkspecs/macx-clang-linux/qmake.conf

$(PREFIX)/lib/libQtCore.a: $(SOURCE_FILE)
	tar -C $(BUILD_BASE) -xf $<
	cp -rf patches/qt/macx-clang-linux $(BUILD_DIR)/qtbase/mkspecs/
	sed -i "s|^CUSTOM_HOST=$$|CUSTOM_HOST=$(HOST)|" $(SPECFILE)
	sed -i "s|^CUSTOM_EXTRA_INCLUDES=$$|CUSTOM_EXTRA_INCLUDES=-I$(CLANG_INCLUDES)|" $(SPECFILE)
	sed -i "s|^CUSTOM_BINUTILS_PATH=$$|CUSTOM_BINUTILS_PATH=-B$(NATIVEPREFIX)/bin|" $(SPECFILE)
	sed -i "s|^CUSTOM_SDK_PATH=$$|CUSTOM_SDK_PATH=$(SDK)|" $(SPECFILE)
	sed -i "s|^CUSTOM_MIN_DEPLOYMENT_TARGET=$$|CUSTOM_MIN_DEPLOYMENT_TARGET=$(MIN_VERSION)|" $(SPECFILE)
	sed -i "s|^CUSTOM_CFLAGS=$$|CUSTOM_CFLAGS=-msse2|" $(SPECFILE)
	sed -i "s|^CUSTOM_CXXFLAGS=$$|CUSTOM_CXXFLAGS=-msse2|" $(SPECFILE)
	sed -i "s|^CUSTOM_OBJCFLAGS=$$|CUSTOM_OBJCFLAGS=-msse2|" $(SPECFILE)
	sed -i "s|^CUSTOM_TARGET=$$|CUSTOM_TARGET=-target $(HOST)|" $(SPECFILE)

	cd $(BUILD_DIR); ./configure $(QT_BUILD_CONFIG) $(QT_OPTS)
	cd $(BUILD_DIR); $(MAKE) module-qtbase-make_first
	cd $(BUILD_DIR)/qtbase; $(MAKE)
	cd $(BUILD_DIR)/qtbase; $(MAKE) install
	cd $(PREFIX)/include; ln -s ../lib/QtNetwork.framework/Headers/ QtNetwork
	cd $(PREFIX)/include; ln -s ../lib/QtWidgets.framework/Headers/ QtWidgets
	cd $(PREFIX)/include; ln -s ../lib/QtGui.framework/Headers/ QtGui
	cd $(PREFIX)/include; ln -s ../lib/QtCore.framework/Headers/ QtCore

	touch $@
