#include "UserDataComp.h"

UserDataComponent::UserDataComponent(float c_temp, int c_Height, int c_Weight, QDateTime c_time):
                    m_temp(c_temp),
                    m_height(c_Height),
                    m_weight(c_Weight),
                    m_timeGetData(c_time)
{

}

float UserDataComponent::temp() const
{
    return m_temp;
}

void UserDataComponent::setTemp(float temp)
{
        m_temp = temp;
}

QDateTime UserDataComponent::timeGetData() const
{
    return m_timeGetData;
}

void UserDataComponent::setTimeGetData(const QDateTime &timeGetData)
{
    if (m_timeGetData != timeGetData)
        m_timeGetData = timeGetData;
}

int UserDataComponent::weight() const
{
    return m_weight;
}

void UserDataComponent::setWeight(int weight)
{
    if (m_weight != weight)
        m_weight = weight;
}

int UserDataComponent::height() const
{
    return m_height;
}

void UserDataComponent::setHeight(int height)
{
    if (m_height != height)
        m_height = height;
}
