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
    Q_PROPERTY(QString batteryStatus READ batteryStatus WRITE setBatteryStatus NOTIFY batteryStatusChanged)
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
    QString batteryStatus() const
    {
        return m_batteryStatus;
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
    void setBatteryStatus(const QString &newBatteryStatus)
    {
        if (m_batteryStatus == newBatteryStatus)
            return;
        m_batteryStatus = newBatteryStatus;
        emit batteryStatusChanged(m_batteryStatus);
    }
signals:
    void cpuUsagePercentChanged(long);
    void capaBatteryChanged(int);
    void batteryStatusChanged(QString);

private:
    Runnable *runnable;
    long m_cpuUsagePercent;
    int m_capaBattery;
    QString m_batteryStatus;
};
#endif // DATA_H
