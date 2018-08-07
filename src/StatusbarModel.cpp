#include "hdr/StatusbarModel.h"

StatusbarModel::StatusbarModel(QObject *parent) : QObject(parent)
{
    m_bluetoothState = false;
    m_isDayTime = false;
    m_networkState = 4;
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

QString StatusbarModel::userIcon() const
{
    return m_userIcon;
}

void StatusbarModel::setUserIcon(const QString &userIcon)
{
    if(m_userIcon != userIcon)
    {
        m_userIcon = userIcon;
        emit userIconChanged();
    }
}

QString StatusbarModel::userName() const
{
    return m_userName;
}

void StatusbarModel::setUserName(const QString &userName)
{
    if(m_userName != userName)
    {
        m_userName = userName;
        emit userNameChanged();
    }
}
