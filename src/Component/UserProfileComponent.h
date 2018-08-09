#ifndef USERPROFILECOMPONENT_H
#define USERPROFILECOMPONENT_H

#include <QObject>
#include <QDateTime>
#include "../Common/Resource_General.h"
#include "../Common/Resource_Statusbar.h"
class UserProfileComponent /*: public QObject*/
{
//    Q_OBJECT

public:
    explicit UserProfileComponent();
    ~UserProfileComponent();

//    Q_PROPERTY(QString name         READ name       WRITE setName       NOTIFY nameChanged)
//    Q_PROPERTY(QString userIcon     READ userIcon   WRITE setUserIcon   NOTIFY userIconChanged)

    int id() const;
    void setId(int id);

    int age() const;
    void setAge(int age);

    QString name() const;
    void setName(const QString &name);

    QDate dob() const;
    void setDob(const QDate &dob);

    QDate dateEstablish() const;
    void setDateEstablish(const QDate &dateEstablish);

    QDate dateExpert() const;
    void setDateExpert(const QDate &dateExpert);

    QString password() const;
    void setPassword(const QString &password);

    QString userIcon() const;
    void setUserIcon(const QString &userIcon);

    bool loginState() const;
    void setLoginState(bool loginState);

    QDateTime timeLogin() const;
    void setTimeLogin(const QDateTime &timeLogin);

private:
    int m_id;
    int m_age;
    QString m_name;
    QDate m_dob;
    QString m_userIcon;

    QDate m_dateEstablish;
    QDate m_dateExpert;
    QString m_password;
    bool m_loginState;
    QDateTime m_timeLogin;
    Resource_General *m_resGeneral;

public slots:

};

#endif // USERPROFILECOMPONENT_H
