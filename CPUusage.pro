QT += quick

SOURCES += main.cpp \
    UTILS/cmd.cpp \
    UTILS/cpu_usage.cpp \
    UTILS/utils.cpp \
    UTILS/utlis.cpp

resources.files =qml/AppDesign.qml
resources.prefix = /$${TARGET}
RESOURCES += resources
RESOURCES += $$files(qml/*)
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = qml/imports

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =
QT += core
# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += qml/Screen01.ui.qml qtquickcontrols2.conf
INCLUDEPATH += UTILS/
HEADERS += \
    UTILS/cmd.h \
    UTILS/cpu_usage.h \
    UTILS/utils.h \
    UTILS/utlis.h
