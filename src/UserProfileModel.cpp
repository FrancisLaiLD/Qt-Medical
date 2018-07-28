#include "hdr/UserProfileModel.h"

UserProfileModel::UserProfileModel(QObject *parent) : QObject(parent)
{

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

