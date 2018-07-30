#ifndef RESOURCE_STATUSBAR_H
#define RESOURCE_STATUSBAR_H

#include <QObject>

class Resource_Statusbar : public QObject
{
    Q_OBJECT
public:
    explicit Resource_Statusbar(QObject *parent = nullptr, QString cPrefix = "")
    {
        Q_UNUSED(parent);
        m_prefix = cPrefix;
    }
    // define Q_PROPERTY to access in QML
    Q_PROPERTY(QString ico_bluetooth_on                 READ ico_bluetooth_on                   CONSTANT)
    Q_PROPERTY(QString ico_bluetooth_off                READ ico_bluetooth_off                  CONSTANT)
    Q_PROPERTY(QString ico_back_d                       READ ico_back_d                         CONSTANT)
    Q_PROPERTY(QString ico_back_n                       READ ico_back_n                         CONSTANT)
    Q_PROPERTY(QString ico_back_p                       READ ico_back_p                         CONSTANT)
    Q_PROPERTY(QString ico_cloud_d                      READ ico_cloud_d                        CONSTANT)
    Q_PROPERTY(QString ico_cloud_n                      READ ico_cloud_n                        CONSTANT)
    Q_PROPERTY(QString ico_cloud_p                      READ ico_cloud_p                        CONSTANT)
    Q_PROPERTY(QString ico_day                          READ ico_day                            CONSTANT)
    Q_PROPERTY(QString ico_night                        READ ico_night                          CONSTANT)
    Q_PROPERTY(QString ico_home_d                       READ ico_home_d                         CONSTANT)
    Q_PROPERTY(QString ico_home_n                       READ ico_home_n                         CONSTANT)
    Q_PROPERTY(QString ico_home_p                       READ ico_home_p                         CONSTANT)
    Q_PROPERTY(QString ico_network_0                    READ ico_network_0                      CONSTANT)
    Q_PROPERTY(QString ico_network_1                    READ ico_network_1                      CONSTANT)
    Q_PROPERTY(QString ico_network_2                    READ ico_network_2                      CONSTANT)
    Q_PROPERTY(QString ico_network_3                    READ ico_network_3                      CONSTANT)
    Q_PROPERTY(QString ico_network_4                    READ ico_network_4                      CONSTANT)
    Q_PROPERTY(QString ico_network_5                    READ ico_network_5                      CONSTANT)
    Q_PROPERTY(QString ico_wifi_strength_0              READ ico_wifi_strength_0                CONSTANT)
    Q_PROPERTY(QString ico_wifi_strength_1              READ ico_wifi_strength_1                CONSTANT)
    Q_PROPERTY(QString ico_wifi_strength_2              READ ico_wifi_strength_2                CONSTANT)
    Q_PROPERTY(QString ico_wifi_strength_3              READ ico_wifi_strength_3                CONSTANT)
    Q_PROPERTY(QString ico_wifi_strength_4              READ ico_wifi_strength_4                CONSTANT)
    Q_PROPERTY(QString ico_wifi_strength_5              READ ico_wifi_strength_5                CONSTANT)


    // defint function return QString
    QString ico_bluetooth_on()                      {return m_prefix + "ico_bluetooth_on.png";}
    QString ico_bluetooth_off()                     {return m_prefix + "ico_bluetooth_off.png";}
    QString ico_back_d()                            {return m_prefix + "ico_back_d.png";}
    QString ico_back_n()                            {return m_prefix + "ico_back_n.png";}
    QString ico_back_p()                            {return m_prefix + "ico_back_p.png";}
    QString ico_cloud_d()                           {return m_prefix + "ico_cloud_d.png";}
    QString ico_cloud_n()                           {return m_prefix + "ico_cloud_n.png";}
    QString ico_cloud_p()                           {return m_prefix + "ico_cloud_p.png";}
    QString ico_day()                               {return m_prefix + "ico_day.png";}
    QString ico_night()                             {return m_prefix + "ico_night.png";}
    QString ico_home_d()                            {return m_prefix + "ico_home_d.png";}
    QString ico_home_n()                            {return m_prefix + "ico_home_n.png";}
    QString ico_home_p()                            {return m_prefix + "ico_home_p.png";}
    QString ico_network_0()                         {return m_prefix + "ico_network_0.png";}
    QString ico_network_1()                         {return m_prefix + "ico_network_1.png";}
    QString ico_network_2()                         {return m_prefix + "ico_network_2.png";}
    QString ico_network_3()                         {return m_prefix + "ico_network_3.png";}
    QString ico_network_4()                         {return m_prefix + "ico_network_4.png";}
    QString ico_network_5()                         {return m_prefix + "ico_network_5.png";}
    QString ico_wifi_strength_0()                   {return m_prefix + "ico_wifi_strength_0.png";}
    QString ico_wifi_strength_1()                   {return m_prefix + "ico_wifi_strength_1.png";}
    QString ico_wifi_strength_2()                   {return m_prefix + "ico_wifi_strength_2.png";}
    QString ico_wifi_strength_3()                   {return m_prefix + "ico_wifi_strength_3.png";}
    QString ico_wifi_strength_4()                   {return m_prefix + "ico_wifi_strength_4.png";}
    QString ico_wifi_strength_5()                   {return m_prefix + "ico_wifi_strength_5.png";}


private:
    QString m_prefix;
signals:

public slots:
};
Q_DECLARE_METATYPE(Resource_Statusbar*)

#endif // RESOURCE_STATUSBAR_H
