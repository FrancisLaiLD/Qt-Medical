#ifndef DEVICECOMPONENT_H
#define DEVICECOMPONENT_H

#include <QObject>
#include <QDateTime>


class DeviceComponent : public QObject
{
    Q_OBJECT

public:
    DeviceComponent() {}
    virtual ~DeviceComponent() {}

    Q_PROPERTY(QString proName                  READ proName            WRITE setProName            NOTIFY proNameChanged)
    Q_PROPERTY(bool proState                    READ proState           WRITE setProState           NOTIFY proStateChanged)
    Q_PROPERTY(QDateTime proLastConnect         READ proLastConnect     WRITE setProLastConnect     NOTIFY proLastConnectChanged)

    QString proName() const;
    void setProName(const QString &proName);

    bool proState() const;
    void setProState(bool proState);

    QDateTime proLastConnect() const;
    void setProLastConnect(const QDateTime &proLastConnect);

private:
    QString     m_proName;
    bool        m_proState;
    QDateTime   m_proLastConnect;

signals:
    void proNameChanged()       ;
    void proStateChanged()      ;
    void proLastConnectChanged();
};

Q_DECLARE_METATYPE(DeviceComponent*)

#endif // DEVICECOMPONENT_H
