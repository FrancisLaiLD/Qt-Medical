#ifndef HOMESCREEN_MAIN_DAILY_MODEL_H
#define HOMESCREEN_MAIN_DAILY_MODEL_H

#include <QObject>
#include "WeatherComponent.h"

class HomeScreen_Main_Daily_Model : public QObject
{
    Q_OBJECT
public:
    explicit HomeScreen_Main_Daily_Model(QObject *parent = nullptr);
    Q_PROPERTY(QList<QObject*> listWeather READ listWeather WRITE setListWeather NOTIFY listWeatherChanged)

    QList<QObject *> listWeather();
    void setListWeather(const QList<QObject *> &listWeather);

    void createListWeather();

private:
    QList<QObject*> m_listWeather;

signals:
    void listWeatherChanged();

public slots:
};
#endif // HOMESCREEN_MAIN_DAILY_MODEL_H
