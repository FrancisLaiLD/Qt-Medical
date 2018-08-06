#ifndef SETTINGMODEL_H
#define SETTINGMODEL_H

#include <QObject>

class SettingModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList listMenuName READ listMenuName WRITE setListMenuName NOTIFY listMenuNameChanged)
public:
    explicit SettingModel(QObject *parent = nullptr);

    QStringList listMenuName() const;
    void setListMenuName(const QStringList &listMenu);

private:
    QStringList m_listMenuName;
signals:
    void listMenuNameChanged();

public slots:
};

#endif // SETTINGMODEL_H
