#ifndef RUNNABLE_H
#define RUNNABLE_H

#include <QObject>
#include <QRunnable>
#include <QThread>
#include <QDebug>
#define PATH_CPU_STATE "/proc/stat"
class Runnable : public QRunnable
{
    long cpuUsagePercent = 0;
    QObject *mReceiver;
    bool mRunning;
    unsigned long long cpu_sum=0 ;
    unsigned long long cpu_idle =0;
public:
    Runnable(QObject *receiver){
        mReceiver = receiver;
        mRunning = false;
    }
    void run(){
        mRunning = true;

        while(mRunning){
            cpuUsagePercent=calcCpuUsage(cpu_sum,cpu_idle);
            qDebug ()<<"Percent "<<cpuUsagePercent;
            QMetaObject::invokeMethod(mReceiver, "setCpuUsagePercent",
                                      Qt::QueuedConnection,
                                      Q_ARG(long, cpuUsagePercent));
            QThread::msleep(100);
        }
    }
    bool isRunning() const{
        return mRunning;
    }
    void stop(){
        mRunning = false;
    }
    long calcCpuUsage(unsigned long long &cpu_sum,  unsigned long long &cpu_idle)
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
        return percent;
    }

};

#endif // RUNNABLE_H
