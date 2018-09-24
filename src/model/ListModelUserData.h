#ifndef LISTMODELUSERDATA_H
#define LISTMODELUSERDATA_H

#include <QObject>
#include <QAbstractListModel>
#include <QDebug>
#include "../Component/UserDataComp.h"

class ListModelUserData : public QAbstractListModel
{
    Q_OBJECT
    enum DataRoles {
        DATA_TEMP = Qt::UserRole + 1,
        DATA_HEIGHT,
        DATA_WEIGHT,
        DATA_TIMECREATE
    };
    Q_PROPERTY(bool isEmpty READ isEmpty CONSTANT)
public:
    ListModelUserData();
    virtual ~ListModelUserData() override {}

    // pure virtuals implementations
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QHash<int, QByteArray> roleNames() const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;

    void iniListData();
    bool addData(const UserDataComponent& _data);
    void remData();
    bool isEmpty();
    QVector<UserDataComponent> listData() const;
    void setListData(const QVector<UserDataComponent> &listData);

    Q_INVOKABLE bool addData(float _tempVal = -1, int _heiVal = -1, int _weiVal = -1, QDateTime _timeVal = QDateTime::currentDateTime());

private:
    QVector<UserDataComponent> m_listData;

};

#endif // LISTMODELUSERDATA_H
