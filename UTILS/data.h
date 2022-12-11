#ifndef DATA_H
#define DATA_H

#include "runnable.h"

#include <QObject>
#include <QThreadPool>

class Data : public QObject
{
    Q_OBJECT
    Q_PROPERTY(long cpuUsagePercent READ cpuUsagePercent WRITE setCpuUsagePercent NOTIFY cpuUsagePercentChanged)
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

public slots:
    void setCpuUsagePercent(long newCpuUsagePercent)
    {
        if (m_cpuUsagePercent == newCpuUsagePercent)
            return;
        m_cpuUsagePercent = newCpuUsagePercent;
        emit cpuUsagePercentChanged(m_cpuUsagePercent);
    }
signals:
    void cpuUsagePercentChanged(long);

private:
    Runnable *runnable;
    long m_cpuUsagePercent;
};




#endif // DATA_H
