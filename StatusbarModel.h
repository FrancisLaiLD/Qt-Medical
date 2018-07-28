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

    bool bluetoothState() const;
    void setBluetoothState(bool bluetoothState);

    int networkState() const;
    void setNetworkState(int networkState);

    bool isDayTime() const;
    void setIsDayTime(bool isDayTime);

private:
    bool m_bluetoothState;
    bool m_isDayTime;
    int  m_networkState;
signals:
    void bluetoothStateChanged();
    void networkStateChanged();
    void isDayTimeChanged();
public slots:
};

#endif // STATUSBARMODEL_H
