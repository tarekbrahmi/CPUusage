#ifndef RUNNABLE_H
#define RUNNABLE_H
#include <QObject>
#include <string>
#include "cmd.h"
#include "utils.h"
#include <QRunnable>
#include <QThread>
#include <QDebug>
#include <cmath>
#include <QVariant>
#define PATH_CPU_STATE "/proc/stat"
#define PATH_BAT_CAPA "/sys/class/power_supply/BAT0/capacity"
#define PATH_BAT_STATUS "/sys/class/power_supply/BAT0/status"
#define POWER_SUPPLY_CHARGE_NOW "/sys/class/power_supply/BAT0/charge_now"
#define POWER_SUPPLY_CURRENT_NOW "/sys/class/power_supply/BAT0/current_now"

class Runnable : public QRunnable
{
    long cpuUsagePercent = 0;
    double timeRemaining=0;
    int battreyPercent=0;
    QString battreyStatus="Discharging";
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
            battreyPercent=GetBatteryPercent();
            battreyStatus=getBattreyStatus();
            timeRemaining=GetTimeRemaining();
            qDebug()<<"timeRemaining "<<timeRemaining;
            QMetaObject::invokeMethod(mReceiver, "setCpuUsagePercent",
                                      Qt::QueuedConnection,
                                      Q_ARG(long, cpuUsagePercent));
            QMetaObject::invokeMethod(mReceiver, "setCapaBattery",
                                      Qt::QueuedConnection,
                                      Q_ARG(int, battreyPercent));
            QMetaObject::invokeMethod(mReceiver, "setBatteryStatus",
                                      Qt::QueuedConnection,
                                      Q_ARG(QString, battreyStatus));
            QThread::msleep(1000);
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
    int GetBatteryPercent(){
        int capPercent;
        FILE *file = fopen(PATH_BAT_CAPA, "r");
        fscanf(file, "%d",&capPercent);
        fclose(file);
        return capPercent;
    }
    QString getBattreyStatus() const{
        char cmd_tump[255];
        CMD cmd;
        UTILS utils;
        sprintf(cmd_tump, "%s %s", "/usr/bin/cat", PATH_BAT_STATUS);
        return utils.trim( cmd.exec(cmd_tump));
    };
    double GetTimeRemaining(){
        double timeRemain=0;
        unsigned int charge_now ,current_now;
        FILE *_file = fopen(POWER_SUPPLY_CHARGE_NOW, "r");
        fscanf(_file, "%iu",&charge_now);
        fclose(_file);
        FILE *file = fopen(POWER_SUPPLY_CURRENT_NOW, "r");
        fscanf(file, "%iu",&current_now);
        fclose(file);
        timeRemain=charge_now;
        timeRemain /=current_now;
        return round(timeRemain);
    }
};


#endif // RUNNABLE_H
