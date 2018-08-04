#include "hdr/Component/HomeComponent.h"



HomeComponent::HomeComponent(bool c_proVisible, bool c_proEnable, QString c_proLabel, QString c_proImgLink) :
     m_proVisible(c_proVisible)
    ,m_proEnable(c_proEnable)
    ,m_proLabel(c_proLabel)
    ,m_proImgLink(c_proImgLink)
{

}

HomeComponent::~HomeComponent()
{

}

bool HomeComponent::proVisible() const
{
    return m_proVisible;
}

void HomeComponent::setProVisible(bool proVisible)
{
    m_proVisible = proVisible;
}

bool HomeComponent::proEnable() const
{
    return m_proEnable;
}

void HomeComponent::setProEnable(bool proEnable)
{
    m_proEnable = proEnable;
}

QString HomeComponent::proLabel() const
{
    return m_proLabel;
}

void HomeComponent::setProLabel(const QString &proLabel)
{
    m_proLabel = proLabel;
}

QString HomeComponent::proImgLink() const
{
    return m_proImgLink;
}

void HomeComponent::setProImgLink(const QString &proImgLink)
{
    m_proImgLink = proImgLink;
}

