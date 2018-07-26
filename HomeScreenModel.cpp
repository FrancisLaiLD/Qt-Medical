#include "HomeScreenModel.h"



HomeScreenModel::HomeScreenModel()
{

}

HomeScreenModel::~HomeScreenModel()
{

}

QList<QObject*> HomeScreenModel::listHomeModel()
{
    if (m_listHome.empty())
    {
        this->createListHomeModel();
    }
    return m_listHome;
}

void HomeScreenModel::setListHomeModel(const QList<QObject*> _data)
{
    if (m_listHome != _data)
    {
        m_listHome = _data;
        emit listHomeModelChanged();
    }
}

int HomeScreenModel::homeModelSize() const
{
    return TABLE_HOME_MODEL.count();
}

void HomeScreenModel::createListHomeModel()
{
    m_listHome.clear();

    int m_listSize = TABLE_HOME_MODEL.count();
    qDebug() << "size Model= " << m_listSize;
    for (int i= 0; i< m_listSize; i++)
        m_listHome.append(new HomeComponent(true,
                                            checkElementVisible(i),
                                            TABLE_HOME_MODEL.value(i).s_label,
                                            TABLE_HOME_MODEL.value(i).s_imageLink));

}

bool HomeScreenModel::checkElementVisible(const int &_index)
{
    bool uResult = false;
    switch (_index) {
    case static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_24_HOURS):
    {
        uResult = true;
    }
        break;
    case static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_MOLE_CULE):
    {
        uResult = true;
    }
        break;
    default:
    {
        uResult = true;
    }
        break;
    }
    return uResult;
}
