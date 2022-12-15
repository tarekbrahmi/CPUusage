QT += quick

SOURCES += main.cpp \
    UTILS/cmd.cpp \
    UTILS/utils.cpp

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

DISTFILES +=  qtquickcontrols2.conf \
    qml/SpeedBackground.qml
INCLUDEPATH += UTILS/
HEADERS += \
    UTILS/cmd.h \
    UTILS/data.h \
    UTILS/runnable.h \
    UTILS/utils.h
