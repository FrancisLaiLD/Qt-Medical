#ifndef USERPROFILEMODEL_H
#define USERPROFILEMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QDebug>
#include "Resource_General.h"
#include "Resource_Statusbar.h"
#include "Component/UserProfileComponent.h"

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
    Q_PROPERTY(UserProfileComponent curUser READ curUser WRITE setCurUser NOTIFY curUserChanged)

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

    UserProfileComponent curUser() const;
    void setCurUser(const UserProfileComponent &curUser);

    void initUserList();

private:
    Resource_General *p_resGeneral;
    Resource_Statusbar *p_resStatusbar;
    QVector<UserProfileComponent> m_listUser;
    UserProfileComponent m_curUser;
signals:
    void curUserChanged();
};


#endif // USERPROFILEMODEL_H
