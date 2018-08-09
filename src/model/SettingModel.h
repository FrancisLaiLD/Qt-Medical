#ifndef SETTINGMODEL_H
#define SETTINGMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include "../Common/SettingScreenDef.h"

class SettingComponent
{

public:
    SettingComponent() {};
    SettingComponent(QString c_proMenuName, QString c_proMenuQml);
    ~SettingComponent();
    QString proMenuName() const;
    void setProMenuName(const QString &proMenuName);

    QString proMenuQml() const;
    void setProMenuQml(const QString &proMenuQml);

private:
    QString m_proMenuName;
    QString m_proMenuQml;
};

class SettingModel : public QAbstractListModel
{
    Q_OBJECT
    enum SettingRoles {
        MENU_NAME = Qt::UserRole + 1,
        MENU_QML
    };
    Q_PROPERTY(int curInx READ curInx WRITE setCurInx NOTIFY curInxChanged)

public:
    SettingModel();
    virtual ~SettingModel() override;

    // pure virtuals implementations
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QHash<int, QByteArray> roleNames() const override;

    void addDevice(const SettingComponent& m_device);
    void remDevice(const int& _index);

    int curInx() const;
    void setCurInx(int curInx);

private:
    QVector<SettingComponent> m_listMenu;
    int m_curInx;
signals:
    void curInxChanged();

};

#endif // SETTINGMODEL_H
