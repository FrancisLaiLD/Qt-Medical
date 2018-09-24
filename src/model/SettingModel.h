#ifndef SETTINGMODEL_H
#define SETTINGMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QDebug>

#include "../Common/SettingScreenDef.h"
#include "../Common/AppStringConst.h"

class SettingComponent
{

public:
    SettingComponent() {}
    ~SettingComponent() {}

    SettingComponent(QString c_proMenuName, QString c_proMenuQml) :
        m_proMenuName(c_proMenuName),
        m_proMenuQml(c_proMenuQml) {}

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
    Q_PROPERTY(int curInx           READ curInx         WRITE setCurInx     NOTIFY curInxChanged)
    Q_PROPERTY(int curLang          READ curLang        WRITE setCurLang    NOTIFY curLangChanged)
    Q_PROPERTY(QString appVersion   READ appVersion     WRITE setAppVersion NOTIFY appVersionChanged)

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

    void initSettingModel();

    int curLang() const;
    void setCurLang(int curLang);

    QString appVersion() const;
    void setAppVersion(const QString &appVersion);

private:
    QVector<SettingComponent> m_listMenu;
    int m_curInx;
    int m_curLang;
    QString m_appVersion;

signals:
    void curInxChanged();
    void curLangChanged();
    void appVersionChanged();

};

#endif // SETTINGMODEL_H
