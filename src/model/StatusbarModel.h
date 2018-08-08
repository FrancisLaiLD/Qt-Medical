#ifndef STATUSBARMODEL_H
#define STATUSBARMODEL_H

#include <QObject>

class StatusbarModel : public QObject
{
    Q_OBJECT
public:
    explicit StatusbarModel(QObject *parent = nullptr);

    Q_PROPERTY(bool bluetoothState READ bluetoothState WRITE setBluetoothState NOTIFY bluetoothStateChanged)
    Q_PROPERTY(int  networkState   READ networkState   WRITE setNetworkState   NOTIFY networkStateChanged)
    Q_PROPERTY(bool isDayTime      READ isDayTime      WRITE setIsDayTime      NOTIFY isDayTimeChanged)

    Q_PROPERTY(QString userIcon READ userIcon WRITE setUserIcon NOTIFY userIconChanged)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)

    bool bluetoothState() const;
    void setBluetoothState(bool bluetoothState);

    int networkState() const;
    void setNetworkState(int networkState);

    bool isDayTime() const;
    void setIsDayTime(bool isDayTime);

    QString userIcon() const;
    void setUserIcon(const QString &userIcon);

    QString userName() const;
    void setUserName(const QString &userName);

private:
    bool m_bluetoothState;
    bool m_isDayTime;
    int  m_networkState;
    QString m_userIcon;
    QString m_userName;

signals:
    void bluetoothStateChanged();
    void networkStateChanged();
    void isDayTimeChanged();
    void userIconChanged();
    void userNameChanged();

public slots:

};

#endif // STATUSBARMODEL_H
