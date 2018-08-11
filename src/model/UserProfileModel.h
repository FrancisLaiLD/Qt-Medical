#ifndef USERPROFILEMODEL_H
#define USERPROFILEMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QDebug>
#include <QMetaType>
#include "../Common/Resource_General.h"
#include "../Common/Resource_Statusbar.h"
#include "../Component/UserProfileComponent.h"

class UserProfileModel : public QAbstractListModel
{
    Q_OBJECT
    enum ProfileRoles {
        PROFILE_ID = Qt::UserRole + 1,
        PROFILE_AGE,
        PROFILE_NAME,
        PROFILE_DOB,
        PROFILE_USERICON,
        PROFILE_ESTABLISH,
        PROFILE_EXPERT,
        PROFILE_PASSWORD,
        PROFILE_LOGINSTATE,
        PROFILE_TIMELOGIN
    };

    Q_PROPERTY(QString curUserName                  READ curUserName            CONSTANT)
    Q_PROPERTY(QString curUserIcon                  READ curUserIcon            CONSTANT)
    Q_PROPERTY(UserProfileComponent* currentUser    READ currentUser            CONSTANT)
    Q_PROPERTY(int curUserId                        READ curUserId              CONSTANT)
    Q_PROPERTY(int curUserAge                       READ curUserAge             CONSTANT)
    Q_PROPERTY(QDate curUserDob                     READ curUserDob             CONSTANT)
    Q_PROPERTY(QDate curUserDateEsta                READ curUserDateEsta        CONSTANT)
    Q_PROPERTY(QDate curUserDateExpe                READ curUserDateExpe        CONSTANT)
    Q_PROPERTY(QDateTime dtUserLogin                READ dtUserLogin            CONSTANT)

public:
    UserProfileModel();
    virtual ~UserProfileModel() override;

    // pure virtual implementations
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QHash<int, QByteArray> roleNames() const override;

    void addUser(const UserProfileComponent& m_device);
    void remUser(const int& _index);

    QVector<UserProfileComponent> listUser() const;
    void setListUser(const QVector<UserProfileComponent> &listUser);

    void initUserList();
    QString curUserName();
    QString curUserIcon();
    UserProfileComponent* currentUser();
    int curUserId();
    int curUserAge();
    QDate curUserDob();
    QDate curUserDateEsta();
    QDate curUserDateExpe();

    QDateTime dtUserLogin() const;
    void setDtUserLogin(const QDateTime &dtUserLogin);

private:
    Resource_General *p_resGeneral;
    Resource_Statusbar *p_resStatusbar;
    QVector<UserProfileComponent> m_listUser;
    UserProfileComponent m_curUser;
    UserProfileComponent *p_currentUser;
    QDateTime m_dtUserLogin;

signals:
    void curUserNameChanged();
    void curUserIconChanged();
    void currentUserChanged();
};

#endif // USERPROFILEMODEL_H
