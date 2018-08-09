#ifndef Worker_Time_Management_H
#define Worker_Time_Management_H

#include <QObject>
#include <QDateTime>
#include <unistd.h>
#include <QDebug>

class Worker_Time_Management : public QObject
{
    Q_OBJECT
public:
    explicit Worker_Time_Management(QObject *parent = nullptr);
    ~Worker_Time_Management();

public slots:
    void process();

signals:
    void sigCurrentTime(QDateTime );
    void finished();
    void error(QString err);

private:
    // add your variables here
    QDateTime w_curDT;
};

#endif // Worker_Time_Management_H
