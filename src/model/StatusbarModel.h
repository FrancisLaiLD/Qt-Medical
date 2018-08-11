#ifndef STATUSBARMODEL_H
#define STATUSBARMODEL_H

#include <QObject>
#include <QDateTime>

class StatusbarModel : public QObject
{
    Q_OBJECT
public:
    explicit StatusbarModel(QObject *parent = nullptr);

    Q_PROPERTY(bool vrState READ vrState WRITE setvrState NOTIFY vrStateChanged)
    Q_PROPERTY(int  networkState   READ networkState   WRITE setNetworkState   NOTIFY networkStateChanged)
    Q_PROPERTY(bool isDayTime      READ isDayTime      WRITE setIsDayTime      NOTIFY isDayTimeChanged)

    Q_PROPERTY(QString      userIcon READ userIcon      WRITE setUserIcon       NOTIFY userIconChanged)
    Q_PROPERTY(QString      userName READ userName      WRITE setUserName       NOTIFY userNameChanged)
    Q_PROPERTY(QDateTime currentDT   READ currentDT     WRITE setCurrentDT      NOTIFY currentDTChanged)

    bool vrState() const;
    void setvrState(bool vrState);

    int networkState() const;
    void setNetworkState(int networkState);

    bool isDayTime() const;
    void setIsDayTime(bool isDayTime);

    QString userIcon() const;
    void setUserIcon(const QString &userIcon);

    QString userName() const;
    void setUserName(const QString &userName);

    QDateTime currentDT() const;
    void setCurrentDT(const QDateTime &currentDateTime);

private:
    bool m_vrState;
    bool m_isDayTime;
    int  m_networkState;
    QString m_userIcon;
    QString m_userName;
    QDateTime m_currentDateTime;

signals:
    void vrStateChanged();
    void networkStateChanged();
    void isDayTimeChanged();
    void userIconChanged();
    void userNameChanged();
    void currentDTChanged();

public slots:

};

#endif // STATUSBARMODEL_H
