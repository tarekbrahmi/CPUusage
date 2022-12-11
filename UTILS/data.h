#ifndef DATA_H
#define DATA_H
#include "runnable.h"
#include <QObject>
#include <QThreadPool>

class Data : public QObject
{
    Q_OBJECT
    Q_PROPERTY(long cpuUsagePercent READ cpuUsagePercent WRITE setCpuUsagePercent NOTIFY cpuUsagePercentChanged)
    Q_PROPERTY(int capaBattery READ capaBattery WRITE setCapaBattery NOTIFY capaBatteryChanged)
public:
    explicit Data(QObject *parent = nullptr):QObject(parent){
        m_cpuUsagePercent=0;
        runnable = new Runnable(this);
    }
    ~Data(){
        runnable->stop();
    }
    Q_INVOKABLE void start(){
        if(!runnable->isRunning())
            QThreadPool::globalInstance()->start(runnable);

    }

    long cpuUsagePercent() const
    {
        return m_cpuUsagePercent;
    };

    int capaBattery() const
    {
        return m_capaBattery;
    }

public slots:
    void setCpuUsagePercent(long newCpuUsagePercent)
    {
        if (m_cpuUsagePercent == newCpuUsagePercent)
            return;
        m_cpuUsagePercent = newCpuUsagePercent;
        emit cpuUsagePercentChanged(m_cpuUsagePercent);
    }
    void setCapaBattery(int newCapaBattery)
    {
        if (m_capaBattery == newCapaBattery)
            return;
        m_capaBattery = newCapaBattery;
        emit capaBatteryChanged(m_capaBattery);
    }
signals:
    void cpuUsagePercentChanged(long);
    void capaBatteryChanged(int);

private:
    Runnable *runnable;
    long m_cpuUsagePercent;
    int m_capaBattery;
};




#endif // DATA_H
