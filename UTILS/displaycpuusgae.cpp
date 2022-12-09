#include "displaycpuusgae.h"

#include <QDebug>
DisplayCPUusgae::DisplayCPUusgae(QObject *parent)
    : QObject{parent},cpu_percent("44")
{

}

QString DisplayCPUusgae::percent()
{
    return cpu_percent;

}

void DisplayCPUusgae::displayUsage()
{
    qDebug()<<"hello";

}

void DisplayCPUusgae::setPercent(QString new_cpu_percent)
{
    if(new_cpu_percent!=cpu_percent){
        cpu_percent=new_cpu_percent;
        emit percentChanged();
    }
}
