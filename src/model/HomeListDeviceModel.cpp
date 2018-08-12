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
    else if (role == DeviceNameRoles::DEVICE_MANUFACTURER)
    {
        return m_device.manufacturer();
    }
    else if (role == DeviceNameRoles::DEVICE_SHOW_IN_MAIN)
    {
        return m_device.isShowInMain();
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
    m_role[DeviceNameRoles::DEVICE_MANUFACTURER] = "proManufact";
    m_role[DeviceNameRoles::DEVICE_SHOW_IN_MAIN] = "proShowInMain";
    return m_role;
}

bool HomeListDeviceModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (index.row() < 0 || index.row() >= m_listDevice.size())
        return false;
    DeviceComponent &m_device = m_listDevice[index.row()];

    switch (role) {
    case DeviceNameRoles::DEVICE_SHOW_IN_MAIN: {
        m_device.setIsShowInMain(value.toBool());
        break;
        }
    default:
        break;
    }
    emit dataChanged(index, index);
    return true;
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
    int m_size = CONST_TABLE_DEVICE.size();
    for (int i= 0; i< m_size; i++)
    {
        DeviceComponent m_device = DeviceComponent(CONST_TABLE_DEVICE[i].m_proName,         // device name
                                                   CONST_TABLE_DEVICE[i].m_manufacturer,    // device manufacturer
                                                   this->askItemConnected(i),               // device connect state
                                                   this->askItemShowInMain(i),              // device show in main
                                                   QDateTime::currentDateTime());           // device last time connect
        this->addDevice(m_device);
    }
}

bool HomeListDeviceModel::askItemConnected(const int &_index)
{
    switch (_index) {
    case static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_TEMPERATURE_MEASUREMENT):
        return false;
    case static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_HEIGHT_DIAMETTER):
        return false;
    case static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_WEIGHT_DIAMETTER):
        return false;
    case static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_BLOOD_PRESSUSER_DIAMETTER):
        return false;
    case static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_BLOOD_ANALYZER_DIAMETTER):
        return false;
    case static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_IMAGE_ANALYZER):
        return false;
    default:
        return true;
    }
}

bool HomeListDeviceModel::askItemShowInMain(const int &_index)
{
    switch (_index) {
    case static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_TEMPERATURE_MEASUREMENT):
        return true;
    case static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_HEIGHT_DIAMETTER):
        return true;
    case static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_WEIGHT_DIAMETTER):
        return true;
    case static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_BLOOD_PRESSUSER_DIAMETTER):
        return true;
    case static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_BLOOD_ANALYZER_DIAMETTER):
        return true;
    case static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_IMAGE_ANALYZER):
        return true;
    default:
        return true;
    }
}

