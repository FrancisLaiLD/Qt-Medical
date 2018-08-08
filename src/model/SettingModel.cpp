#include "SettingModel.h"

SettingComponent::SettingComponent(QString c_proMenuName, QString c_proMenuQml)
                           : m_proMenuName(c_proMenuName), m_proMenuQml(c_proMenuQml)
{

}

SettingComponent::~SettingComponent()
{

}

SettingModel::SettingModel()
{
    addDevice(SettingComponent("General", ESETTING_GENERAL));
    addDevice(SettingComponent("Network", ESETTING_NETWORK));
    addDevice(SettingComponent("Device management", ESETTING_DEVICE_MANAGEMENT));
    addDevice(SettingComponent("User profile", ESETTING_USERPROFILE));

    addDevice(SettingComponent("Version info", ""));
    addDevice(SettingComponent("Updating...", ""));
    addDevice(SettingComponent("Updating...", ""));
    addDevice(SettingComponent("Updating...", ""));
    addDevice(SettingComponent("Updating...", ""));
}

SettingModel::~SettingModel()
{

}

QVariant SettingModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_listMenu.size())
    {
        return QVariant();
    }
    SettingComponent m_menu = m_listMenu[index.row()];
    if (role == SettingRoles::MENU_NAME)
    {
        return m_menu.proMenuName();
    }
    else if (role == SettingRoles::MENU_QML)
    {
        return  m_menu.proMenuQml();
    }

    return QVariant();
}

int SettingModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_listMenu.size();
}

QHash<int, QByteArray> SettingModel::roleNames() const
{
    QHash<int, QByteArray> m_role;
    m_role[SettingRoles::MENU_NAME] = "proName";
    m_role[SettingRoles::MENU_QML] = "proQml";
    return m_role;
}

void SettingModel::addDevice(const SettingComponent &m_device)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_listMenu.push_back(m_device);
    endInsertRows();
}

void SettingModel::remDevice(const int &_index)
{
    beginRemoveRows(QModelIndex(), rowCount(), rowCount());
    m_listMenu.removeAt(_index);
    endRemoveRows();
}

int SettingModel::curInx() const
{
    return m_curInx;
}

void SettingModel::setCurInx(int curInx)
{
    m_curInx = curInx;
}

QString SettingComponent::proMenuName() const
{
    return m_proMenuName;
}

void SettingComponent::setProMenuName(const QString &proMenuName)
{
    m_proMenuName = proMenuName;
}

QString SettingComponent::proMenuQml() const
{
    return m_proMenuQml;
}

void SettingComponent::setProMenuQml(const QString &proMenuQml)
{
    m_proMenuQml = proMenuQml;
}
