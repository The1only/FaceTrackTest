# Tundra drone test project.
# Build this code in QTcreator and have it track you're face live. 

QT = core gui widgets

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    targetdetector.cpp

HEADERS += \
    mainwindow.h \
    targetdetector.h

FORMS += mainwindow.ui

TRANSLATIONS += Test_en_US.ts

DEFINES += FACE_CONFIGURATION =\\\"/Users/terjenilsen/Dropbox/TundraDrone/test/assets/deploy.prototxt\\\"
DEFINES += FACE_WEIGHTS =\\\"/Users/terjenilsen/Dropbox/TundraDrone/test/assets/res10_300x300_ssd_iter_140000_fp16.caffemodel\\\"

CONFIG += lrelease
CONFIG += embed_translations

INCLUDEPATH = \
    /usr/local/include/opencv4/ \
    /usr/local/include
    $$PWD/.

# Libraries needed...
LIBS += /usr/local/lib/libopencv_core.dylib
LIBS += /usr/local/lib/libopencv_highgui.dylib
LIBS += /usr/local/lib/libopencv_imgcodecs.dylib
LIBS += /usr/local/lib/libopencv_imgproc.dylib
LIBS += /usr/local/lib/libopencv_features2d.dylib
LIBS += /usr/local/lib/libopencv_video.dylib
LIBS += /usr/local/lib/libopencv_videoio.dylib
LIBS += /usr/local/lib/libopencv_dnn.dylib


# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    assets/deploy.prototxt \
    assets/res10_300x300_ssd_iter_140000_fp16.caffemodel
