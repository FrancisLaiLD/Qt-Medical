#include "UserProfileModel.h"

UserProfileModel::UserProfileModel()
{
    p_resGeneral = new Resource_General();
    p_resStatusbar = new Resource_Statusbar();
//    UserProfileComponent *m_user = new UserProfileComponent();
//    m_user->setAge(28);
//    m_user->setDateEstablish(QDate(2018, 03, 26));
//    m_user->setDateExpert(QDate(2100, 05, 27));
//    m_user->setDob(QDate(01, 04, 1990));
//    m_user->setId(100110111);
//    m_user->setLoginState(true);
//    m_user->setUserIcon(p_resGeneral->ico_boy_2());
//    m_user->setName("Lai Dang Hung");
//    m_user->setPassword("kakalot");
//    m_user->setTimeLogin(QDateTime::currentDateTime());
    initUserList();
}

UserProfileModel::~UserProfileModel()
{

}

QVariant UserProfileModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_listUser.size())
    {
        qDebug() << "HungLD";
        return QVariant();
    }
    const UserProfileComponent& m_user = m_listUser[index.row()];
    if (role == ProfileRoles::PROFILE_ID)
    {
        return m_user.id();
    }
    else if (role == ProfileRoles::PROFILE_AGE)
    {
        return  m_user.age();
    }
    else if (role == ProfileRoles::PROFILE_NAME)
    {
        return  m_user.name();
    }
    else if (role == ProfileRoles::PROFILE_DOB)
    {
        return m_user.dob();
    }
    else if (role == ProfileRoles::PROFILE_USERICON)
    {
        return m_user.userIcon();
    }
    else if (role == ProfileRoles::PROFILE_ESTABLISH)
    {
        return m_user.dateEstablish();
    }
    else if (role == ProfileRoles::PROFILE_EXPERT)
    {
        return m_user.dateExpert();
    }
    else if (role == ProfileRoles::PROFILE_PASSWORD)
    {
        return m_user.password();
    }
    else if (role == ProfileRoles::PROFILE_LOGINSTATE)
    {
        return m_user.loginState();
    }
    else if (role == ProfileRoles::PROFILE_TIMELOGIN)
    {
        return m_user.timeLogin();
    }
    return QVariant();
}

int UserProfileModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_listUser.size();
}

QHash<int, QByteArray> UserProfileModel::roleNames() const
{
    QHash<int, QByteArray> m_role;
    m_role[ProfileRoles::PROFILE_ID]        =   "id";
    m_role[ProfileRoles::PROFILE_AGE]       =   "age";
    m_role[ProfileRoles::PROFILE_NAME]       =   "name";
    m_role[ProfileRoles::PROFILE_DOB]       =   "dob";
    m_role[ProfileRoles::PROFILE_USERICON]  =   "userIcon";
    m_role[ProfileRoles::PROFILE_ESTABLISH] =   "dateEstablish";
    m_role[ProfileRoles::PROFILE_EXPERT]    =   "dateExpert";
    m_role[ProfileRoles::PROFILE_PASSWORD]  =   "password";
    m_role[ProfileRoles::PROFILE_LOGINSTATE]=   "loginState";
    m_role[ProfileRoles::PROFILE_TIMELOGIN] =   "timeLogin";
    return m_role;
}

void UserProfileModel::addUser(const UserProfileComponent &m_device)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_listUser.push_back(m_device);
    endInsertRows();
}

void UserProfileModel::remUser(const int &_index)
{
    beginRemoveRows(QModelIndex(), rowCount(), rowCount());
    m_listUser.removeAt(_index);
    endRemoveRows();
}

QVector<UserProfileComponent> UserProfileModel::listUser() const
{
    return m_listUser;
}

void UserProfileModel::setListUser(const QVector<UserProfileComponent> &listUser)
{
    m_listUser = listUser;
}

void UserProfileModel::initUserList()
{
    for (int i= 0; i< 5; i++)
    {
        UserProfileComponent nUserProfile;
        this->addUser(nUserProfile);
    }
    m_curUser = m_listUser.at(0);
    p_currentUser = &m_curUser;
}

QString UserProfileModel::curUserName()
{
    return m_curUser.name();
}

QString UserProfileModel::curUserIcon()
{
    return m_curUser.userIcon();
}

UserProfileComponent *UserProfileModel::currentUser()
{
    return p_currentUser;
}

int UserProfileModel::curUserId()
{
    return m_curUser.id();
}

int UserProfileModel::curUserAge()
{
    return m_curUser.age();
}

QDate UserProfileModel::curUserDob()
{
    return m_curUser.dob();
}

QDate UserProfileModel::curUserDateEsta()
{
    return m_curUser.dateEstablish();
}

QDate UserProfileModel::curUserDateExpe()
{
    return m_curUser.dateExpert();
}

