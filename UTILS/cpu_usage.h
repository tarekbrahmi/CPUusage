#ifndef CPU_USAGE_H
#define CPU_USAGE_H
#include "cmd.h"
#define PATH_CPU_STATE "/proc/stat"

class CPU_USAGE:public CMD
{
public:
    CPU_USAGE();
    double Cpu_Usage();
};

#endif // CPU_USAGE_H
