#-------------------------------------------------
#
# Project created by QtCreator 2020-06-30T22:46:06
#
#-------------------------------------------------

QT       += core gui sql

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = ormDemo
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


DEFINES += _BUILDING_QX_BLOG


!contains(DEFINES, _QX_NO_PRECOMPILED_HEADER) {
    PRECOMPILED_HEADER = precompiled.h
}

INCLUDEPATH += /usr/include/QxOrm/include

LIBS += -L/usr/local/lib
LIBS += -L/usr/lib/x86_64-linux-gnu/qt5/plugins/sqldrivers


CONFIG(debug, debug|release) {
    LIBS += -lQxOrmd
} else {
    LIBS += -lQxOrm
}


SOURCES += \
        main.cpp \
        dialog.cpp \
    author.cpp \
    category.cpp \
    blog.cpp \
    comment.cpp

HEADERS += \
        dialog.h \
    export.h \
    precompiled.h \
    author.h \
    category.h \
    blog.h \
    comment.h

FORMS += \
        dialog.ui
