TEMPLATE = app
TARGET = HelloSpeak

QT += widgets texttospeech

requires(qtHaveModule(gui))
qtHaveModule(gui): requires(qtConfig(combobox))

###############################
# SOURCES
###############################
SOURCES = main.cpp \
          mainwindow.cpp
HEADERS = mainwindow.h
FORMS = mainwindow.ui

###############################
# BUILD
###############################
CONFIG(debug, debug|release) {
    DESTDIR = build/debug
}
CONFIG(release, debug|release) {
    DESTDIR = build/release
}

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc
UI_DIR = $$DESTDIR/.ui
