#include "hdr/HomeScreenMainDailyModel.h"

HomeScreen_Main_Daily_Model::HomeScreen_Main_Daily_Model(QObject *parent) : QObject(parent)
{

}

QList<QObject *> HomeScreen_Main_Daily_Model::listWeather() const
{
    return m_listWeather;
}

void HomeScreen_Main_Daily_Model::setListWeather(const QList<QObject *> &listWeather)
{
    m_listWeather = listWeather;
}

void HomeScreen_Main_Daily_Model::createListWeather()
{
    m_listWeather.append(new WeatherComponent());
    m_listWeather.append(new WeatherComponent());
}
