#include "cpu_usage.h"
#define PATH_CPU_STATE "/proc/stat"
#include <QDebug>


CPU_USAGE::CPU_USAGE(){

}
double CPU_usage_V2(unsigned long long &cpu_sum, unsigned long long &cpu_idle)
{
    double percent = 0;
    char cmd_sleep[255] = "/usr/bin/sleep 1";
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
    CPU_USAGE::CMD().exec(cmd_sleep);
    qDebug()<<"Persent "<<percent;
    return percent;
}// get the cpu usage from $PATH_CPU_STATE file
