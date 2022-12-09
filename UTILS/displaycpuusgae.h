#ifndef DISPLAYCPUUSGAE_H
#define DISPLAYCPUUSGAE_H
#include <QObject>
#include "cmd.h"

class DisplayCPUusgae : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString percent READ percent WRITE setPercent NOTIFY percentChanged)

public:
    explicit DisplayCPUusgae(QObject *parent = nullptr);
    Q_INVOKABLE QString getPercent();
    QString percent();
    QString calcCpuUsage(unsigned long long,unsigned long long);
private:

    QString cpu_percent=0;
    CMD cmd;

signals:
    void percentChanged();
public slots:
    void displayUsage();
    void setPercent(QString);

};

#endif // DISPLAYCPUUSGAE_H
