#include "StatusbarModel.h"

StatusbarModel::StatusbarModel(QObject *parent) : QObject(parent)
{
    m_bluetoothState = false;
    m_isDayTime = true;
    m_networkState = 0;
}

bool StatusbarModel::bluetoothState() const
{
    return m_bluetoothState;
}

void StatusbarModel::setBluetoothState(bool bluetoothState)
{
    if (m_bluetoothState != bluetoothState)
    {
        m_bluetoothState = bluetoothState;
        emit bluetoothStateChanged();
    }
}

int StatusbarModel::networkState() const
{
    return m_networkState;
}

void StatusbarModel::setNetworkState(int networkState)
{
    if (m_networkState != networkState)
    {
        m_networkState = networkState;
        emit networkStateChanged();
    }
}

bool StatusbarModel::isDayTime() const
{
    return m_isDayTime;
}

void StatusbarModel::setIsDayTime(bool isDayTime)
{
    if (m_isDayTime != isDayTime)
    {
        m_isDayTime = isDayTime;
        emit isDayTimeChanged();
    }
}
