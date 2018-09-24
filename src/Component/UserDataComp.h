#ifndef USERDATACOMP_H
#define USERDATACOMP_H

#include <QObject>
#include <QDateTime>

class UserDataComponent {

public:
    UserDataComponent() {}
    UserDataComponent(float c_temp, int c_Height, int c_Weight, QDateTime c_time);
    ~UserDataComponent() {}


    float temp() const;
    void setTemp(float temp);

    QDateTime timeGetData() const;
    void setTimeGetData(const QDateTime &timeGetData);

    int weight() const;
    void setWeight(int weight);

    int height() const;
    void setHeight(int height);

private:
    float m_temp;
    int m_height;
    int m_weight;
    QDateTime m_timeGetData;

};


#endif // USERDATACOMP_H
