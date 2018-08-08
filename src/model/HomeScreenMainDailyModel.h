#ifndef HOMESCREEN_MAIN_DAILY_MODEL_H
#define HOMESCREEN_MAIN_DAILY_MODEL_H

#include <QObject>
#include <QDateTime>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "../Component/WeatherComponent.h"
#include "../Component/DeviceComponent.h"
#include "../HomeScreen_Enum.h"

#include "HomeListDeviceModel.h"
class HomeScreen_Main_Daily_Model : public QObject
{
    Q_OBJECT
public:
    explicit HomeScreen_Main_Daily_Model(QObject *parent = nullptr, QQmlApplicationEngine* cAppEngine = nullptr);

    Q_PROPERTY(WeatherComponent* leftWeather    READ leftWeather        WRITE setLeftWeather        NOTIFY leftWeatherChanged)
    Q_PROPERTY(WeatherComponent* rightWeather   READ rightWeather       WRITE setRightWeather       NOTIFY rightWeatherChanged)
    Q_PROPERTY(QList<QObject*>   listDevice     READ listDevice         WRITE setListDevice         NOTIFY listDeviceChanged)
    Q_PROPERTY(QDateTime         timeUpdate     READ timeUpdate         WRITE setTimeUpdate         NOTIFY timeUpdateChanged)

    void initContextProperty();

    /* DEFINES GETTER AND SETTER FUNCTIONS OF PROPERTY */
    WeatherComponent *leftWeather() const;
    void setLeftWeather(WeatherComponent *leftWeather);

    WeatherComponent *rightWeather() const;
    void setRightWeather(WeatherComponent *rightWeather);

    QDateTime timeUpdate() const;
    void setTimeUpdate(const QDateTime &timeUpdate);

    QList<QObject*> listDevice() const;
    void setListDevice(QList<QObject*> listDevice);

    HomeListDeviceModel *homeListDevice() const;
    void setHomeListDevice(HomeListDeviceModel *value);

private:
    QQmlApplicationEngine* p_qqmlEngine;
    WeatherComponent *m_leftWeather;
    WeatherComponent *m_rightWeather;
    QList<QObject*>  m_listDevice;
    QDateTime m_timeUpdate;
    HomeListDeviceModel* p_homeListDevice;

signals:
    void timeUpdateChanged();
    void leftWeatherChanged();
    void rightWeatherChanged();
    void listDeviceChanged();

public slots:

};
#endif // HOMESCREEN_MAIN_DAILY_MODEL_H
