#include "cpu_usage.h"
#define PATH_CPU_STATE "/proc/stat"
CPU_USAGE::CPU_USAGE(){}
double Cpu_Usage(){
    double percent;
    unsigned long long user, nice, system, idle, iowait, irq, softirq, total;
    FILE *file = fopen(PATH_CPU_STATE, "r");
    fscanf(file, "cpu %llu %llu %llu %llu %llu %llu %llu", &user, &nice,
           &system, &idle, &iowait, &irq, &softirq);
    fclose(file);
    total = user + nice + system + idle + iowait + irq + softirq;
    percent = user;
    percent *= 100;
    percent /= total;
    return percent;
} // get the cpu usage from $PATH_CPU_STATE file
