#include "hdr/Component/WeatherComponent.h"

WeatherComponent::WeatherComponent(QObject *parent) : QObject(parent)
{
    m_proLocId = -1;
    m_proLocName = "Ha noi";
    m_proTemp = 32;
    m_proWindVel = -1;
    m_proDry = -1;
    m_proWeatherProperty = -1;
}

int WeatherComponent::proLocId() const
{
    return m_proLocId;
}

void WeatherComponent::setProLocId(int proLocId)
{
    if (m_proLocId != proLocId)
    {
        m_proLocId = proLocId;
        emit proLocIdChanged();
    }
}

QString WeatherComponent::proLocName() const
{
    return m_proLocName;
}

void WeatherComponent::setProLocName(const QString &proLocName)
{
    if (m_proLocName != proLocName)
    {
        m_proLocName = proLocName;
        emit proLocNameChanged();
    }
}

int WeatherComponent::proTemp() const
{
    return m_proTemp;
}

void WeatherComponent::setProTemp(int proTemp)
{
    if (m_proTemp != proTemp)
    {
        m_proTemp = proTemp;
        emit proTempChanged();
    }
}

int WeatherComponent::proWindVel() const
{
    return m_proWindVel;
}

void WeatherComponent::setProWindVel(int proWindVel)
{
    if (m_proWindVel != proWindVel)
    {
        m_proWindVel = proWindVel;
        emit proWindVelChanged();
    }
}

int WeatherComponent::proDry() const
{
    return m_proDry;
}

void WeatherComponent::setProDry(int proDry)
{
    if (m_proDry != proDry)
    {
        m_proDry = proDry;
        emit proDryChanged();
    }
}

int WeatherComponent::proWeatherProperty() const
{
    return m_proWeatherProperty;
}

void WeatherComponent::setProWeatherProperty(int weatherpro)
{
    if (m_proWeatherProperty != weatherpro)
    {
        m_proWeatherProperty = weatherpro;
        emit proWeatherPropertyChanged();
    }
}
