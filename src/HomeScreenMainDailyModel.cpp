#include "hdr/HomeScreenMainDailyModel.h"

HomeScreen_Main_Daily_Model::HomeScreen_Main_Daily_Model(QObject *parent) : QObject(parent)
{
    m_leftWeather   = new WeatherComponent();
    m_leftWeather->setProWeatherProperty(static_cast<int>(HomeScreen_Enum::ENUM_WEATHER_PROPERTY::WEATHER_DAY_STORM_RAINNY));
    m_rightWeather  = new WeatherComponent();
    m_timeUpdate    = QDateTime::currentDateTime();
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

QDateTime HomeScreen_Main_Daily_Model::timeUpdate() const
{
    return m_timeUpdate;
}

void HomeScreen_Main_Daily_Model::setTimeUpdate(const QDateTime &timeUpdate)
{
    m_timeUpdate = timeUpdate;
}
