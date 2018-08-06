#include "hdr/SettingModel.h"

SettingModel::SettingModel(QObject *parent) : QObject(parent)
{
    m_listMenuName << QString("General") << QString("Device setting") << QString("Weather setting")<< QString("Time setting")<<QString("About");
}

QStringList SettingModel::listMenuName() const
{
    return m_listMenuName;
}

void SettingModel::setListMenuName(const QStringList &listMenu)
{
    m_listMenuName = listMenu;
}
