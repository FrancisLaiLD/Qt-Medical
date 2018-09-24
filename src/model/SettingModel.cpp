#include "SettingModel.h"


SettingModel::SettingModel()
{
    this->initSettingModel();
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

void SettingModel::initSettingModel()
{
    int m_size = CONST_TABLE_SETTING.size();
    qDebug() << "Size of Setting :" << m_size;
    for (int i= 0; i < m_size; i++)
    {
        SettingComponent m_settingComp = SettingComponent(CONST_TABLE_SETTING[i].s_MenuName, CONST_TABLE_SETTING[i].s_QmlLink);
        addDevice(m_settingComp);
    }

    // Version info
    setAppVersion(GLOBAL_StringConst.STR_GENERAL_UNDEFINE());
}

int SettingModel::curLang() const
{
    return m_curLang;
}

void SettingModel::setCurLang(int curLang)
{
    if (m_curLang != curLang)
    {
        m_curLang = curLang;
        emit curLangChanged();
    }
}

QString SettingModel::appVersion() const
{
    return m_appVersion;
}

void SettingModel::setAppVersion(const QString &appVersion)
{
    if (m_appVersion != appVersion)
    {
        m_appVersion = appVersion;
        emit appVersionChanged();
    }
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
