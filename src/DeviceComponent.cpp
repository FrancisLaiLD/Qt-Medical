#include "hdr/Component/DeviceComponent.h"

/* Define all functions of Component */

QString DeviceComponent::proName() const
{
    return m_proName;
}

void DeviceComponent::setProName(const QString &proName)
{
    m_proName = proName;
}

bool DeviceComponent::proState() const
{
    return m_proState;
}

void DeviceComponent::setProState(bool proState)
{
    m_proState = proState;
}

QDateTime DeviceComponent::proLastConnect() const
{
    return m_proLastConnect;
}

void DeviceComponent::setProLastConnect(const QDateTime &proLastConnect)
{
    m_proLastConnect = proLastConnect;
}
