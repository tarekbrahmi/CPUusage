#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include "UTILS/displaycpuusgae.h"
#include "UTILS/data.h"
int main(int argc, char *argv[])
{

    QGuiApplication::setApplicationName("DisplayCPUusgae");
    QGuiApplication::setOrganizationName("DisplayCPUusgae");
    QGuiApplication app(argc, argv);
    qmlRegisterType<DisplayCPUusgae>("Monty",1,0,"DisplayCPUusgae");
    qmlRegisterType<Data>("data",1,0,"Data");
    QQuickView view;
    view.engine()->addImportPath("qrc:/qml/imports");
    view.setSource(QUrl("qrc:/qml/AppDesign.qml"));

    if (!view.errors().isEmpty())
        return -1;
    view.show();

    return app.exec();
}
