#ifndef DEVICECOMPONENT_H
#define DEVICECOMPONENT_H

#include <QObject>
#include <QDateTime>


class DeviceComponent /*: public QObject*/
{
//    Q_OBJECT

public:
    DeviceComponent() {}
    DeviceComponent(
        QString cName,
        QString cManufact,
        bool cState,
        bool cIsShowInMain,
        QDateTime cLastConn
        ):
        m_proName(cName),
        m_manufacturer(cManufact),
        m_proState(cState),
        m_isShowInMain(cIsShowInMain),
        m_proLastConnect(cLastConn) {}
    ~DeviceComponent() {}

//    Q_PROPERTY(QString proName                  READ proName            WRITE setProName            NOTIFY proNameChanged)
//    Q_PROPERTY(bool proState                    READ proState           WRITE setProState           NOTIFY proStateChanged)
//    Q_PROPERTY(QDateTime proLastConnect         READ proLastConnect     WRITE setProLastConnect     NOTIFY proLastConnectChanged)

    QString proName() const;
    void setProName(const QString &proName);

    bool proState() const;
    void setProState(bool proState);

    QDateTime proLastConnect() const;
    void setProLastConnect(const QDateTime &proLastConnect);

    QString manufacturer() const;
    void setManufacturer(const QString &manufacturer);

    bool isShowInMain() const;
    void setIsShowInMain(bool isShowInMain);

private:
    QString     m_proName;
    QString     m_manufacturer;
    bool        m_proState;
    bool        m_isShowInMain;
    QDateTime   m_proLastConnect;

signals:
//    void proNameChanged()       ;
//    void proStateChanged()      ;
//    void proLastConnectChanged();
};

//Q_DECLARE_METATYPE(DeviceComponent*)

#endif // DEVICECOMPONENT_H
