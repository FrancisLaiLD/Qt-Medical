#ifndef USERPROFILECOMPONENT_H
#define USERPROFILECOMPONENT_H

#include <QObject>
#include <QDateTime>
class UserProfileComponent : public QObject
{
    Q_OBJECT
public:
    explicit UserProfileComponent(QObject *parent = nullptr);
    Q_PROPERTY(int id       READ id         WRITE setId         NOTIFY idChanged)
    Q_PROPERTY(int age      READ age        WRITE setAge        NOTIFY ageChanged)
    Q_PROPERTY(QString name READ name       WRITE setName       NOTIFY nameChanged)
    Q_PROPERTY(QString dob  READ dob        WRITE setDob        NOTIFY dobChanged)

    Q_PROPERTY(QString userIcon             READ userIcon               WRITE setUserIcon               NOTIFY userIconChanged)
    Q_PROPERTY(QString dateEstablish        READ dateEstablish          WRITE setDateEstablish          NOTIFY dateEstablishChanged)
    Q_PROPERTY(QString dateExpert           READ dateExpert             WRITE setDateExpert             NOTIFY dateExpertChanged)
    Q_PROPERTY(QString password             READ password               WRITE setPassword               NOTIFY passwordChanged)
    Q_PROPERTY(bool loginState              READ loginState             WRITE setLoginState             NOTIFY loginStateChanged)
    Q_PROPERTY(QDateTime timeLogin          READ timeLogin              WRITE setTimeLogin NOTIFY timeLoginChanged)
    int id() const;
    void setId(int id);

    int age() const;
    void setAge(int age);

    QString name() const;
    void setName(const QString &name);

    QString dob() const;
    void setDob(const QString &dob);

    QString dateEstablish() const;
    void setDateEstablish(const QString &dateEstablish);

    QString dateExpert() const;
    void setDateExpert(const QString &dateExpert);

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
    QString m_dob;
    QString m_userIcon;

    QString m_dateEstablish;
    QString m_dateExpert;
    QString m_password;
    bool m_loginState;
    QDateTime m_timeLogin;

signals:
    void idChanged();
    void ageChanged();
    void nameChanged();
    void dobChanged();
    void userIconChanged();
    void dateEstablishChanged();
    void dateExpertChanged();
    void passwordChanged();
    void loginStateChanged();
    void timeLoginChanged();

public slots:
};

#endif // USERPROFILECOMPONENT_H
