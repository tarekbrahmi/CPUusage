#ifndef CPU_USAGE_H
#define CPU_USAGE_H
#include "cmd.h"


class CPU_USAGE:public CMD
{
public:
    CPU_USAGE();
    double CPU_usage_V2(unsigned long long &cpu_sum, unsigned long long &cpu_idle);
};

#endif // CPU_USAGE_H
