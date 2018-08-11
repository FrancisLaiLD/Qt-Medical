#include "DeviceComponent.h"

/* Define all functions of Component */

QString DeviceComponent::proName() const
{
    return m_proName;
}

void DeviceComponent::setProName(const QString &proName)
{
    if (m_proName != proName)
        m_proName = proName;
}

bool DeviceComponent::proState() const
{
    return m_proState;
}

void DeviceComponent::setProState(bool proState)
{
    if (m_proState != proState)
        m_proState = proState;
}

QDateTime DeviceComponent::proLastConnect() const
{
    return m_proLastConnect;
}

void DeviceComponent::setProLastConnect(const QDateTime &proLastConnect)
{
    if (m_proLastConnect != proLastConnect)
        m_proLastConnect = proLastConnect;
}

QString DeviceComponent::manufacturer() const
{
    return m_manufacturer;
}

void DeviceComponent::setManufacturer(const QString &manufacturer)
{
    if (m_manufacturer != manufacturer)
        m_manufacturer = manufacturer;
}

bool DeviceComponent::isShowInMain() const
{
    return m_isShowInMain;
}

void DeviceComponent::setIsShowInMain(bool isShowInMain)
{
    if (m_isShowInMain != isShowInMain)
        m_isShowInMain = isShowInMain;
}
