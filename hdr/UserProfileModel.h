#ifndef USERPROFILEMODEL_H
#define USERPROFILEMODEL_H

#include <QObject>
#include "UserProfileComponent.h"

class UserProfileModel : public QObject
{
    Q_OBJECT
public:
    explicit UserProfileModel(QObject *parent = nullptr);

    Q_PROPERTY(QList<QObject*> listUserProfile READ listUserProfile WRITE setListUserProfile NOTIFY listUserProfileChanged)
    Q_PROPERTY(int curUserIndex READ curUserIndex WRITE setCurUserIndex NOTIFY curUserIndexChanged)
    Q_PROPERTY(UserProfileComponent* curUser READ curUser WRITE setCurUser NOTIFY curUserChanged)

    void addUserProfile(UserProfileModel* _newUser);
    void removeUserProfile(int &_index);
    void clearListUserProfile();

    QList<QObject *> listUserProfile() const;
    void setListUserProfile(const QList<QObject *> &listUserProfile);

    int curUserIndex() const;
    void setCurUserIndex(int curUserIndex);

    UserProfileComponent *curUser() const;
    void setCurUser(UserProfileComponent *curUser);

private:
    QList<QObject*>         m_listUserProfile;
    int                     m_curUserIndex;
    UserProfileComponent*   m_curUser;

signals:
    void listUserProfileChanged();
    void curUserIndexChanged();
    void curUserChanged();

public slots:

};

#endif // USERPROFILEMODEL_H
