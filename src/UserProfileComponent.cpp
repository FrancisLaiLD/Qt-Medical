#include "hdr/Component/UserProfileComponent.h"

UserProfileComponent::UserProfileComponent()
{
    m_resGeneral = new Resource_General();
    m_id = 111;
    m_age = 25;
    m_name = "Unknow";
    m_dob = QDateTime::currentDateTime().date();
    m_userIcon = m_resGeneral->ico_boy_1();
    m_dateEstablish = QDateTime::currentDateTime().date();
    m_dateExpert = QDateTime::currentDateTime().date();;
    m_password = "12345678";
    m_loginState = false;
    m_timeLogin = QDateTime::currentDateTime();
}

UserProfileComponent::~UserProfileComponent()
{

}

int UserProfileComponent::id() const
{
    return m_id;
}

void UserProfileComponent::setId(int id)
{
    if(m_id != id)
    {
        m_id = id;
    }
}

int UserProfileComponent::age() const
{
    return m_age;
}

void UserProfileComponent::setAge(int age)
{
    if (m_age != age)
    {
        m_age = age;
    }
}

QString UserProfileComponent::name() const
{
    return m_name;
}

void UserProfileComponent::setName(const QString &name)
{
    if (m_name != name)
    {
        m_name = name;
    }
}

QDate UserProfileComponent::dob() const
{
    return m_dob;
}

void UserProfileComponent::setDob(const QDate &dob)
{
    if (m_dob != dob)
    {
        m_dob = dob;
    }
}

QDate UserProfileComponent::dateEstablish() const
{
    return m_dateEstablish;
}

void UserProfileComponent::setDateEstablish(const QDate &dateEstablish)
{
    if (m_dateEstablish != dateEstablish)
    {
        m_dateEstablish = dateEstablish;
    }
}

QDate UserProfileComponent::dateExpert() const
{
    return m_dateExpert;
}

void UserProfileComponent::setDateExpert(const QDate &dateExpert)
{
    if (m_dateExpert != dateExpert)
    {
        m_dateExpert = dateExpert;
    }
}

QString UserProfileComponent::password() const
{
    return m_password;
}

void UserProfileComponent::setPassword(const QString &password)
{
    if (m_password != password)
    {
        m_password = password;
    }
}

QString UserProfileComponent::userIcon() const
{
    return m_userIcon;
}

void UserProfileComponent::setUserIcon(const QString &userIcon)
{
    if (m_userIcon != userIcon)
    {
        m_userIcon = userIcon;
    }
}

bool UserProfileComponent::loginState() const
{
    return m_loginState;
}

void UserProfileComponent::setLoginState(bool loginState)
{
    if (m_loginState != loginState)
    {
        m_loginState = loginState;
    }
}

QDateTime UserProfileComponent::timeLogin() const
{
    return m_timeLogin;
}

void UserProfileComponent::setTimeLogin(const QDateTime &timeLogin)
{
    if (m_timeLogin != timeLogin)
    {
        m_timeLogin = timeLogin;
    }
}
