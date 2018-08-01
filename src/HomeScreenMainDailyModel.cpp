#include "hdr/HomeScreenMainDailyModel.h"

HomeScreen_Main_Daily_Model::HomeScreen_Main_Daily_Model(QObject *parent) : QObject(parent)
{
    m_leftWeather = new WeatherComponent();
    m_rightWeather = new WeatherComponent();
}

WeatherComponent *HomeScreen_Main_Daily_Model::leftWeather() const
{
    return m_leftWeather;
}

void HomeScreen_Main_Daily_Model::setLeftWeather(WeatherComponent *leftWeather)
{
    m_leftWeather = leftWeather;
}

WeatherComponent *HomeScreen_Main_Daily_Model::rightWeather() const
{
    return m_rightWeather;
}

void HomeScreen_Main_Daily_Model::setRightWeather(WeatherComponent *rightWeather)
{
    m_rightWeather = rightWeather;
}
