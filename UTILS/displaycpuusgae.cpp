#include "displaycpuusgae.h"
#include <QDebug>
#include <QVariant>
#include <iomanip>
#define PATH_CPU_STATE "/proc/stat"

DisplayCPUusgae::DisplayCPUusgae(QObject *parent)
    : QObject{parent}
{
    cpu_percent="0";
}

QString DisplayCPUusgae::getPercent()
{
    unsigned long long cpu_sum=0 ;
    unsigned long long cpu_idle =0;
    return DisplayCPUusgae::calcCpuUsage(cpu_sum,cpu_idle);
}

QString DisplayCPUusgae::percent()
{
    return cpu_percent;

}

QString DisplayCPUusgae::calcCpuUsage(unsigned long long cpu_sum,  unsigned long long cpu_idle)
{
    double percent = 0;
    unsigned long long user, nice, system, idle, iowait, irq, softirq;
    unsigned long long _cpu_sum = 0;
    unsigned long long _cpu_idle = 0;
    unsigned long long cpu_delta = 0;
    unsigned long long cpu_used = 0;

    FILE *file = fopen(PATH_CPU_STATE, "r");
    fscanf(file, "cpu %llu %llu %llu %llu %llu %llu %llu", &user, &nice,
           &system, &idle, &iowait, &irq, &softirq);
    fclose(file);
    // callc the summ
    _cpu_sum = user + nice + system + idle + iowait + irq + softirq;
    _cpu_idle = idle - cpu_idle;

    // calc cpu_delta
    cpu_delta = _cpu_sum - cpu_sum;

    // calc cpu_used
    cpu_used = cpu_delta - _cpu_idle;

    percent = cpu_used;
    percent /= cpu_delta;
    percent *= 100;
    // save the value
    cpu_sum = _cpu_sum;
    cpu_idle = idle;
//    cmd.exec(cmd_sleep);
    return QVariant((int)percent).toString();
}


void DisplayCPUusgae::displayUsage()
{
    qDebug()<<"Hello";
}

void DisplayCPUusgae::setPercent(QString new_cpu_percent)
{
    if(new_cpu_percent!=cpu_percent){
        cpu_percent=new_cpu_percent;
        emit percentChanged();
    }
}
