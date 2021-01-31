QT += gui widgets network multimedia

TEMPLATE = lib
CONFIG += plugin

CONFIG += c++11

exists(/usr/local/include/musicbrainz5) {
    message("Building with libmusicbrainz5 support")
    LIBS += -lmusicbrainz5
    INCLUDEPATH += /usr/local/include
    DEFINES += HAVE_MUSICBRAINZ
} else {
    message("libmusicbrainz5 not found on this system");
}

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Include the-libs build tools
include(/usr/local/share/the-libs/pri/gentranslations.pri)

SOURCES += \
    ../PhononPlugin/musicbrainzreleasemodel.cpp \
    cd/cdchecker-objc.mm \
    cd/cdchecker.cpp \
    cd/diskwatcher.cpp \
    cd/maccdmediaitem.cpp \
    cd/trackinfo.cpp \
    mainwindowtouchbar-objc.mm \
    mainwindowtouchbar.cpp \
    plugin.cpp

HEADERS += \
    ../PhononPlugin/musicbrainzreleasemodel.h \
    cd/cdchecker.h \
    cd/cdchecker_p.h \
    cd/diskwatcher.h \
    cd/maccdmediaitem.h \
    cd/trackinfo.h \
    mainwindowtouchbar.h \
    mainwindowtouchbar_p.h \
    plugin.h

include(../plugins.pri)

DISTFILES += MacIntegration.json

INCLUDEPATH += "/usr/local/include/the-libs"
LIBS += -L/usr/local/lib -lthe-libs -framework AVFoundation

FORMS += \
    cd/cdchecker.ui