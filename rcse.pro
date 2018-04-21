#-------------------------------------------------
#
# Project created by QtCreator 2016-01-04T16:16:31
#
#-------------------------------------------------

QT       += core gui quickwidgets quick webengine printsupport

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = bin/rcse
TEMPLATE = app
CONFIG += c++11
#QMAKE_CXXFLAGS = -std=c++11

DEFINES+=RCSE
CONFIG+=RCSE

isEmpty(PREFIX) {
 PREFIX = /usr/bin
}
# Version
DEFINES += VERSION_MAJOR=1 VERSION_MIDDLE=8 VERSION_MINOR=2

## Translation
TRANSLATIONS =  translations/rcse_fr.ts \
                translations/rcse.ts \
                translations/rcse_de.ts \
                translations/rcse_pt_BR.ts \
                translations/rcse_hu_HU.ts \
                translations/rcse_tr.ts \
                translations/rcse_nl_NL.ts \

isEmpty(QMAKE_LRELEASE) {
    win32:QMAKE_LRELEASE = $$[QT_INSTALL_BINS]/lrelease.exe
    else:QMAKE_LRELEASE = $$[QT_INSTALL_BINS]/lrelease
}
isEmpty(QMAKE_LUPDATE) {
    win32:QMAKE_LUPDATE = $$[QT_INSTALL_BINS]/lupdate.exe
    else:QMAKE_LUPDATE = $$[QT_INSTALL_BINS]/lupdate
}
updateTrans.input = rcse.pro
updateTrans.output= ${QMAKE_FILE_PATH}/${QMAKE_FILE_BASE}.ts
updateTrans.command= ${QMAKE_LRELEASE} rcse.pro

unix:!macx{
# linux only

updateqm.input = TRANSLATIONS
updateqm.output = ${QMAKE_FILE_PATH}/${QMAKE_FILE_BASE}.qm
updateqm.commands = $$QMAKE_LRELEASE ${QMAKE_FILE_IN} ${QMAKE_FILE_PATH}/${QMAKE_FILE_BASE}.qm
updateqm.CONFIG += no_link
QMAKE_EXTRA_COMPILERS += updateTrans updateqm
PRE_TARGETDEPS += compiler_updateqm_make_all
## End of Translation

##Installation
target.path = $$PREFIX/

INCLUDEPATH  += /usr/include/poppler/qt5
LIBS         += -lpoppler-qt5
DEFINES += WITH_PDF
}
INSTALLS += target

include(charactersheet/charactersheet.pri)
include(diceparser/diceparser.pri)

INCLUDEPATH += charactersheet

SOURCES += main.cpp\
        mainwindow.cpp \
    canvas.cpp \
    fieldmodel.cpp \
    borderlisteditor.cpp \
    qmlhighlighter.cpp \
    delegate/alignmentdelegate.cpp \
    codeeditor.cpp \
    delegate/typedelegate.cpp \
    canvasfield.cpp \
    aboutrcse.cpp \
    pdfmanager.cpp \
    delegate/fontdelegate.cpp \
    preferencesdialog.cpp \
    preferencesmanager.cpp \
    sheetproperties.cpp \
    imagemodel.cpp \
    itemeditor.cpp \
    tablecanvasfield.cpp \
    columndefinitiondialog.cpp \
    undo/addfieldcommand.cpp \
    undo/deletefieldcommand.cpp \
    undo/movefieldcommand.cpp \
    undo/setfieldproperties.cpp \
    undo/addpagecommand.cpp \
    undo/deletepagecommand.cpp \
    undo/setbackgroundimage.cpp \
    undo/addcharactercommand.cpp \
    undo/deletecharactercommand.cpp \
    undo/setpropertyonallcharacters.cpp \
    widgets/codeedit.cpp \
    delegate/pagedelegate.cpp \
    codeeditordialog.cpp \
    widgets/fieldview.cpp \
    common/widgets/logpanel.cpp \
    common/controller/logcontroller.cpp \
    qmlgeneratorvisitor.cpp

HEADERS  += mainwindow.h \
    canvas.h \
    fieldmodel.h \
    borderlisteditor.h \
    qmlhighlighter.h \
    delegate/alignmentdelegate.h \
    codeeditor.h \
    delegate/typedelegate.h \
    canvasfield.h \
    aboutrcse.h \
    pdfmanager.h \
    delegate/fontdelegate.h \
    preferencesdialog.h \
    preferencesmanager.h \
    sheetproperties.h \
    imagemodel.h \
    itemeditor.h \
    tablecanvasfield.h \
    columndefinitiondialog.h \
    undo/addfieldcommand.h \
    undo/deletefieldcommand.h \
    undo/movefieldcommand.h \
    undo/setfieldproperties.h \
    undo/addpagecommand.h \
    undo/deletepagecommand.h \
    undo/setbackgroundimage.h \
    undo/addcharactercommand.h \
    undo/deletecharactercommand.h \
    undo/setpropertyonallcharacters.h \
    widgets/codeedit.h \
    delegate/pagedelegate.h \
    codeeditordialog.h \
    widgets/fieldview.h \
    common/widgets/logpanel.h \
    common/controller/logcontroller.h \
    qmlgeneratorvisitor.h



FORMS    += mainwindow.ui \
    aboutrcse.ui \
    pdfmanager.ui \
    preferencesdialog.ui \
    sheetproperties.ui \
    columndefinitiondialog.ui \
    widgets/codeedit.ui \
    codeeditordialog.ui \
    common/widgets/logpanel.ui

DISTFILES += \
    charactersheet/qml/*.qml \
    resources/icons/photo.png \
    resources/icons/liberapay.png \
    resources/dictionaries/javascript.txt \
    resources/dictionaries/keywords.txt \
    resources/dictionaries/properties.txt \
    resources/dictionaries/qml.txt

RESOURCES += \
    qmlfile.qrc

ICON = resources/logo/rcse.icns
win32 {
RC_FILE = "resources/logo/rcse.rc"
OTHER_FILES +=resources/logo/rcse.rc

LIBS += -L$$PWD/../../lib/poppler-0.24/lib/ -llibpoppler-qt5.dll
#DEFINES += WITH_PDF

#INCLUDEPATH += $$PWD/../../lib/poppler-0.24/include/poppler-qt5
#DEPENDPATH += $$PWD/../../lib/poppler-0.24/lib/ $$PWD/../../lib/poppler-0.24/bin/
#$$PWD/../../lib/poppler-0.24/include/poppler-cpp/
}
macx {
target.path = /Applications/
}
INSTALLS += target
