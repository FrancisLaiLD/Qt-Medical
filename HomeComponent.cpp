#include "HomeComponent.h"


HomeComponent::HomeComponent(QString oLabel, QString oImageLink) :
    m_label(oLabel),
    m_imageLink(oImageLink)
{

}
HomeComponent::~HomeComponent()
{

}

QString HomeComponent::label() const
{
    return m_label;
}

void HomeComponent::setLabel(const QString &_data)
{
    if (m_label != _data)
    {
        m_label = _data;
        emit labelChanged();
    }
}

QString HomeComponent::imageLink() const
{
    return m_imageLink;
}

void HomeComponent::setImageLink(const QString &_data)
{
    if (m_imageLink != _data)
    {
        m_imageLink = _data;
        emit imageLinkChanged();
    }
}
