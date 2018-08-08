#include "HomeWeatherModel.h"

HomeWeatherModel::HomeWeatherModel(QObject *parent) : QObject(parent)
{

}

QDateTime HomeWeatherModel::timeUpdate() const
{
    return m_timeUpdate;
}

void HomeWeatherModel::setTimeUpdate(const QDateTime &timeUpdate)
{
    m_timeUpdate = timeUpdate;
}
