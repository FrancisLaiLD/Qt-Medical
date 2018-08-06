#include "hdr/HomeScreenMainDailyModel.h"

HomeScreen_Main_Daily_Model::HomeScreen_Main_Daily_Model(QObject *parent, QQmlApplicationEngine* cAppEngine) : QObject(parent)
{
    p_qqmlEngine = cAppEngine;
    p_homeListDevice = new HomeListDeviceModel();
    p_homeListDevice->addDevice(DeviceComponent("Device number 1", true,    QDateTime::currentDateTime()));
    p_homeListDevice->addDevice(DeviceComponent("Device number 2", false,   QDateTime::currentDateTime()));
    p_homeListDevice->addDevice(DeviceComponent("Device number 3", true,    QDateTime::currentDateTime()));
    p_homeListDevice->addDevice(DeviceComponent("Device number 4", false,   QDateTime::currentDateTime()));
    p_homeListDevice->addDevice(DeviceComponent("Device number 5", true,    QDateTime::currentDateTime()));

    m_leftWeather   = new WeatherComponent();
    m_leftWeather->setProWeatherProperty(static_cast<int>(HomeScreen_Enum::ENUM_WEATHER_PROPERTY::WEATHER_DAY_STORM_RAINNY));
    m_rightWeather  = new WeatherComponent();
    m_timeUpdate    = QDateTime::currentDateTime();
    this->initContextProperty();
}

void HomeScreen_Main_Daily_Model::initContextProperty()
{
    p_qqmlEngine->rootContext()->setContextProperty("HomeDailyModel", this);
    p_qqmlEngine->rootContext()->setContextProperty("listDevice", p_homeListDevice);
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

QList<QObject*> HomeScreen_Main_Daily_Model::listDevice() const
{
    return m_listDevice;
}

void HomeScreen_Main_Daily_Model::setListDevice(QList<QObject *> listDevice)
{
    m_listDevice = listDevice;
}

HomeListDeviceModel *HomeScreen_Main_Daily_Model::homeListDevice() const
{
    return p_homeListDevice;
}

void HomeScreen_Main_Daily_Model::setHomeListDevice(HomeListDeviceModel *value)
{
    p_homeListDevice = value;
}

