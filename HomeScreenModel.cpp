#include "HomeScreenModel.h"



HomeScreenModel::HomeScreenModel()
{

}

HomeScreenModel::~HomeScreenModel()
{

}

QList<HomeComponent *> HomeScreenModel::listHomeModel()
{
    if (m_listHome.empty())
    {
        this->createListHomeModel();
    }
    return m_listHome;
}

void HomeScreenModel::setListHomeModel(const QList<HomeComponent *> _data)
{
    if (m_listHome != _data)
    {
        m_listHome = _data;
        emit listHomeModelChanged();
    }
}

void HomeScreenModel::createListHomeModel()
{
    m_listHome.clear();

    int m_listSize = TABLE_HOME_MODEL.count();
    for (int i= 0; i< m_listSize; i++)
        m_listHome.append(new HomeComponent(TABLE_HOME_MODEL.value(i).s_label,
                                            TABLE_HOME_MODEL.value(i).s_imageLink));

}
