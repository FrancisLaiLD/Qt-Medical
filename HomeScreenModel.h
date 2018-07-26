#ifndef HOMESCREENMODEL_H
#define HOMESCREENMODEL_H

#include <QObject>
#include <QtDebug>

#include "HomeComponent.h"
#include "HomeScreenDef.h"

class HomeScreenModel : public QObject
{
    Q_OBJECT
public:
    explicit HomeScreenModel();
    ~HomeScreenModel();
    Q_PROPERTY(QList<QObject*> listHomeModel READ listHomeModel WRITE setListHomeModel NOTIFY listHomeModelChanged)
    Q_PROPERTY(int homeModelSize READ homeModelSize CONSTANT)

    QList<QObject*> listHomeModel();
    void setListHomeModel(const QList<QObject*> _data);

    int homeModelSize() const;

    void createListHomeModel();
    bool checkElementVisible(const int &_index);

private:
    QList<QObject*> m_listHome;

signals:
    void listHomeModelChanged();

public slots:
};

#endif // HOMESCREENMODEL_H
