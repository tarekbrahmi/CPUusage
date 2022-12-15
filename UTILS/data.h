#ifndef DATA_H
#define DATA_H
#include "runnable.h"
#include <QObject>
#include <QColor>
#include <QThreadPool>

class Data : public QObject
{
    Q_OBJECT
    Q_PROPERTY(long cpuUsagePercent READ cpuUsagePercent WRITE setCpuUsagePercent NOTIFY cpuUsagePercentChanged)
    Q_PROPERTY(int capaBattery READ capaBattery WRITE setCapaBattery NOTIFY capaBatteryChanged)
    Q_PROPERTY(QString batteryStatus READ batteryStatus WRITE setBatteryStatus NOTIFY batteryStatusChanged)
    Q_PROPERTY(QColor arcleftsorckColor READ arcleftsorckColor WRITE setarcleftsorckColor NOTIFY arcleftsorckColorChanged)
public:
    explicit Data(QObject *parent = nullptr):QObject(parent){
        m_cpuUsagePercent=0;
        m_capaBattery=0;
        m_arcleftsorckColor=QColor(0x11, 0xd3, 0x88);
        _parent=parent;
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
    QColor arcleftsorckColor() const
    {
        return m_arcleftsorckColor;
    }


public slots:
    void setCpuUsagePercent(long newCpuUsagePercent)
    {
        if (m_cpuUsagePercent == newCpuUsagePercent)
            return;
        m_cpuUsagePercent = newCpuUsagePercent;
        if(m_cpuUsagePercent<=25 && m_cpuUsagePercent>=0){
            setarcleftsorckColor( QColor(0x11, 0xd3, 0x88));
        }else if(m_cpuUsagePercent<=75 && m_cpuUsagePercent>=25){
            setarcleftsorckColor( QColor(0xff, 0xd7, 0x00));
        }else if(m_cpuUsagePercent>=75){
            setarcleftsorckColor(QColor(0xdc, 0x14, 0x3C));
        }
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
    void setarcleftsorckColor(const QColor &newArcleftsorckColor)
    {
        if (m_arcleftsorckColor == newArcleftsorckColor)
            return;
        m_arcleftsorckColor = newArcleftsorckColor;
        emit arcleftsorckColorChanged(m_arcleftsorckColor);
    }
signals:
    void cpuUsagePercentChanged(long);
    void capaBatteryChanged(int);
    void batteryStatusChanged(QString);
    void arcleftsorckColorChanged(QColor);

private:
    Runnable *runnable;
    long m_cpuUsagePercent;
    int m_capaBattery;
    QString m_batteryStatus;
    QObject *_parent;
    QColor m_arcleftsorckColor;
};

#endif // DATA_H
