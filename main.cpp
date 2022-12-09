#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include "UTILS/displaycpuusgae.h"
int main(int argc, char *argv[])
{

    QGuiApplication::setApplicationName("CPU");
    QGuiApplication::setOrganizationName("CPU");
    QGuiApplication app(argc, argv);
    qmlRegisterType<DisplayCPUusgae>("Monty",1,0,"DisplayCPUusgae");
    QQuickView view;
    view.engine()->addImportPath("qrc:/qml/imports");
    view.setSource(QUrl("qrc:/qml/AppDesign.qml"));

    if (!view.errors().isEmpty())
        return -1;
    view.show();

    return app.exec();
}
