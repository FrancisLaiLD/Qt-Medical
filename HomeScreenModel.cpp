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
                                            true,
                                            TABLE_HOME_MODEL.value(i).s_label,
                                            TABLE_HOME_MODEL.value(i).s_imageLink));

}
