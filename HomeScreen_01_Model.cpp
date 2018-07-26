#include "HomeScreen_01_Model.h"

HomeScreen_01_Model::HomeScreen_01_Model(QObject *parent) : QObject(parent)
{

}

HomeScreen_01_Model::~HomeScreen_01_Model()
{

}

int HomeScreen_01_Model::circleSize() const
{
    return m_circleSize;
}

void HomeScreen_01_Model::setCircleSize(const int &_size)
{
    if (m_circleSize != _size)
    {
        m_circleSize = _size;
        emit circleSizeChanged();
    }
}
