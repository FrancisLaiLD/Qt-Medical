#include "HomeListDeviceModel.h"


HomeListDeviceModel::HomeListDeviceModel()
{
    initListDevice();
}

QVariant HomeListDeviceModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_listDevice.size())
    {
        qDebug() << "HungLD";
        return QVariant();
    }
    DeviceComponent m_device = m_listDevice[index.row()];
    if (role == DeviceNameRoles::DEVICE_NAME)
    {
        return m_device.proName();
    }
    else if (role == DeviceNameRoles::DEVICE_STATE)
    {
        return  m_device.proState();
    }
    else if (role == DeviceNameRoles::DEVICE_LASTCONN)
    {
        return m_device.proLastConnect();
    }
    return QVariant();

}

int HomeListDeviceModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_listDevice.size();
}

QHash<int, QByteArray> HomeListDeviceModel::roleNames() const
{
    QHash<int, QByteArray> m_role;
    m_role[DeviceNameRoles::DEVICE_NAME] = "proName";
    m_role[DeviceNameRoles::DEVICE_STATE] = "proState";
    m_role[DeviceNameRoles::DEVICE_LASTCONN] = "proLastConn";
    return m_role;
}

void HomeListDeviceModel::addDevice(const DeviceComponent &m_device)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_listDevice.push_back(m_device);
    endInsertRows();
}

void HomeListDeviceModel::remDevice(const int &_index)
{
    beginRemoveRows(QModelIndex(), rowCount(), rowCount());
    m_listDevice.removeAt(_index);
    endRemoveRows();
}

QVector<DeviceComponent> HomeListDeviceModel::listDevice() const
{
    return m_listDevice;
}

void HomeListDeviceModel::setListDevice(const QVector<DeviceComponent> &listDevice)
{
    m_listDevice = listDevice;
}

void HomeListDeviceModel::initListDevice()
{
    addDevice(DeviceComponent("Blood pressure device", true,      QDateTime::currentDateTime()));
    addDevice(DeviceComponent("Blood analyser device", false,     QDateTime::currentDateTime()));
    addDevice(DeviceComponent("Height diametter device", true,    QDateTime::currentDateTime()));
    addDevice(DeviceComponent("Weight diametter device", false,   QDateTime::currentDateTime()));
    addDevice(DeviceComponent("Image analyser device",    true,   QDateTime::currentDateTime()));
}

