#ifndef HOMESCREEN_MAIN_DAILY_MODEL_H
#define HOMESCREEN_MAIN_DAILY_MODEL_H

#include <QObject>
#include "WeatherComponent.h"

class HomeScreen_Main_Daily_Model : public QObject
{
    Q_OBJECT
public:
    explicit HomeScreen_Main_Daily_Model(QObject *parent = nullptr);

    Q_PROPERTY(WeatherComponent* leftWeather    READ leftWeather        WRITE setLeftWeather        NOTIFY leftWeatherChanged)
    Q_PROPERTY(WeatherComponent* rightWeather   READ rightWeather       WRITE setRightWeather       NOTIFY rightWeatherChanged)


    WeatherComponent *leftWeather() const;
    void setLeftWeather(WeatherComponent *leftWeather);

    WeatherComponent *rightWeather() const;
    void setRightWeather(WeatherComponent *rightWeather);

private:
    WeatherComponent *m_leftWeather;
    WeatherComponent *m_rightWeather;

signals:
    void listWeatherChanged();
    void leftWeatherChanged();
    void rightWeatherChanged();

public slots:

};
#endif // HOMESCREEN_MAIN_DAILY_MODEL_H
