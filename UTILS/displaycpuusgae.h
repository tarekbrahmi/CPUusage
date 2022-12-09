#ifndef DISPLAYCPUUSGAE_H
#define DISPLAYCPUUSGAE_H
#include <QObject>

class DisplayCPUusgae : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString percent READ percent WRITE setPercent NOTIFY percentChanged)
public:
    explicit DisplayCPUusgae(QObject *parent = nullptr);
    QString percent();
private:
    qint16 cpu_sum = 0;
    qint16 cpu_idle = 0;
    QString cpu_percent=0;

signals:
    void percentChanged();
public slots:
    void displayUsage();
    void setPercent(QString);
};

#endif // DISPLAYCPUUSGAE_H
