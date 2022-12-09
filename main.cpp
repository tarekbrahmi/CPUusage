#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include "UTILS/cpu_usage.h"
int main(int argc, char *argv[])
{
//    CPU_USAGE _CPU_USAGE;

//    unsigned long long cpu_sum = 0;
//    unsigned long long cpu_idle = 0;
//    _CPU_USAGE.CPU_usage_V2(cpu_sum, cpu_idle);
    QGuiApplication::setApplicationName("CPU");
    QGuiApplication::setOrganizationName("CPU");
    QGuiApplication app(argc, argv);
    QQuickView view;
    view.engine()->addImportPath("qrc:/qml/imports");
    view.setSource(QUrl("qrc:/qml/AppDesign.qml"));

    if (!view.errors().isEmpty())
        return -1;
    view.show();

    return app.exec();
}
