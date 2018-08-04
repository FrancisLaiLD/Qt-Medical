#include "hdr/UserProfileModel.h"

UserProfileModel::UserProfileModel(QObject *parent) : QObject(parent)
{
    p_resGeneral = new Resource_General();
    p_resStatusbar = new Resource_Statusbar();
    UserProfileComponent *m_user = new UserProfileComponent();
    m_user->setAge(28);
    m_user->setDateEstablish(QDate(2018, 03, 26));
    m_user->setDateExpert(QDate(2100, 05, 27));
    m_user->setDob(QDate(01, 04, 1990));
    m_user->setId(100110111);
    m_user->setLoginState(true);
    m_user->setUserIcon(p_resGeneral->ico_boy_2());
    m_user->setName("Lai Dang Hung");
    m_user->setPassword("kakalot");
    m_user->setTimeLogin(QDateTime::currentDateTime());
    this->setCurUser(m_user);
}

void UserProfileModel::addUserProfile(UserProfileModel* _newUser)
{
    m_listUserProfile.append(_newUser);
    emit listUserProfileChanged();
}

void UserProfileModel::removeUserProfile(int &_index)
{
    m_listUserProfile.removeAt(_index);
    emit listUserProfileChanged();
}

void UserProfileModel::clearListUserProfile()
{
    m_listUserProfile.clear();
    emit listUserProfileChanged();
}

QList<QObject *> UserProfileModel::listUserProfile() const
{
    return m_listUserProfile;
}

void UserProfileModel::setListUserProfile(const QList<QObject *> &listUserProfile)
{
    m_listUserProfile = listUserProfile;
}

int UserProfileModel::curUserIndex() const
{
    return m_curUserIndex;
}

void UserProfileModel::setCurUserIndex(int curUserIndex)
{
    m_curUserIndex = curUserIndex;
}

UserProfileComponent *UserProfileModel::curUser() const
{
    return m_curUser;
}

void UserProfileModel::setCurUser(UserProfileComponent *curUser)
{
    m_curUser = curUser;
}

