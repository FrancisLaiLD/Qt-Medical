#include "Worker_Time_Management.h"

Worker_Time_Management::Worker_Time_Management(QObject *parent) : QObject(parent)
{

}

Worker_Time_Management::~Worker_Time_Management()
{

}

void Worker_Time_Management::process()
{
    while (true) {
        usleep(1000000);
        w_curDT = QDateTime::currentDateTime();
//        qDebug() << "Time receive : " << w_curDT;
        sigCurrentTime(w_curDT);
    }
}
