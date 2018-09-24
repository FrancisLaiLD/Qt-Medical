#include "ListModelUserData.h"

ListModelUserData::ListModelUserData()
{

}

QVariant ListModelUserData::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_listData.size())
    {
        qDebug() << "HungLD";
        return QVariant();
    }

    UserDataComponent m_device = m_listData.at(index.row());
    if (role == DataRoles::DATA_TEMP)
    {
        return m_device.temp();
    }
    else if (role == DataRoles::DATA_HEIGHT)
    {
        return  m_device.height();
    }
    else if (role == DataRoles::DATA_WEIGHT)
    {
        return m_device.weight();
    }
    else if (role == DataRoles::DATA_TIMECREATE)
    {
        return m_device.timeGetData();
    }
    return QVariant();
}

int ListModelUserData::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    qDebug() << "size: " << m_listData.size();
    return m_listData.size();
}

QHash<int, QByteArray> ListModelUserData::roleNames() const
{
    QHash<int, QByteArray> m_role;
    m_role[DataRoles::DATA_TEMP]        = "dataTemp";
    m_role[DataRoles::DATA_HEIGHT]      = "dataHeight";
    m_role[DataRoles::DATA_WEIGHT]      = "dataWeight";
    m_role[DataRoles::DATA_TIMECREATE]  = "dataTimeCreate";
    return m_role;
}

bool ListModelUserData::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (role < 0 || role > m_listData.size())
        return false;
    int m_index = index.row();
    switch (role) {
    case static_cast<int>(DataRoles::DATA_TEMP):
        m_listData[m_index].setTemp(value.toFloat());
        break;
    case static_cast<int>(DataRoles::DATA_HEIGHT):
        m_listData[m_index].setHeight(value.toInt());
        break;
    case static_cast<int>(DataRoles::DATA_WEIGHT):
        m_listData[m_index].setWeight(value.toInt());
        break;
    case static_cast<int>(DataRoles::DATA_TIMECREATE):
        m_listData[m_index].setTimeGetData(value.toDateTime());
        break;
    default:
        break;
    }
    emit dataChanged(index, index);
    return true;
}

void ListModelUserData::iniListData()
{

}

bool ListModelUserData::addData(const UserDataComponent& _data)
{
    m_listData.append(_data);
    return true;
}

bool ListModelUserData::addData(float _tempVal, int _heiVal, int _weiVal, QDateTime _timeVal)
{
    UserDataComponent _newRecord = UserDataComponent(_tempVal, _heiVal, _weiVal, _timeVal);
    addData(_newRecord);
    return true;
}

void ListModelUserData::remData()
{

}

bool ListModelUserData::isEmpty()
{
    return (m_listData.size() == 0);
}

QVector<UserDataComponent> ListModelUserData::listData() const
{
    return m_listData;
}

void ListModelUserData::setListData(const QVector<UserDataComponent> &listData)
{
    m_listData = listData;
}
