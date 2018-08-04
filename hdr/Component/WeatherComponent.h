#ifndef WEATHERCOMPONENT_H
#define WEATHERCOMPONENT_H

#include <QObject>

class WeatherComponent : public QObject
{
    Q_OBJECT
public:
    explicit WeatherComponent(QObject *parent = nullptr);

    Q_PROPERTY(int proLocId             READ proLocId           WRITE setProLocId NOTIFY proLocIdChanged)
    Q_PROPERTY(QString proLocName       READ proLocName         WRITE setProLocName NOTIFY proLocNameChanged)
    Q_PROPERTY(int proWeatherProperty   READ proWeatherProperty WRITE setProWeatherProperty NOTIFY proWeatherPropertyChanged)
    Q_PROPERTY(int proTemp              READ proTemp            WRITE setProTemp NOTIFY proTempChanged)
    Q_PROPERTY(int proWindVel           READ proWindVel         WRITE setProWindVel NOTIFY proWindVelChanged)
    Q_PROPERTY(int proDry               READ proDry             WRITE setProDry NOTIFY proDryChanged)

    int proLocId() const;
    void setProLocId(int proLocId);

    QString proLocName() const;
    void setProLocName(const QString &proLocName);

    int proTemp() const;
    void setProTemp(int proTemp);

    int proWindVel() const;
    void setProWindVel(int proWindVel);

    int proDry() const;
    void setProDry(int proDry);

    int proWeatherProperty() const;
    void setProWeatherProperty(int weatherpro);

private:
    int m_proLocId;
    QString m_proLocName;
    int m_proTemp;
    int m_proWindVel;
    int m_proDry;
    int m_proWeatherProperty;
signals:
    void proLocIdChanged();
    void proLocNameChanged();
    void proTempChanged();
    void proWindVelChanged();
    void proDryChanged();
    void proWeatherPropertyChanged();

public slots:
};
Q_DECLARE_METATYPE(WeatherComponent*)

#endif // WEATHERCOMPONENT_H
