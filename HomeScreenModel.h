#ifndef HOMESCREENMODEL_H
#define HOMESCREENMODEL_H

#include <QObject>
#include "HomeComponent.h"
#include "HomeScreenDef.h"
class HomeScreenModel : public QObject
{
    Q_OBJECT
public:
    explicit HomeScreenModel();
    ~HomeScreenModel();
    Q_PROPERTY(QList<HomeComponent*> listHomeModel READ listHomeModel WRITE setListHomeModel NOTIFY listHomeModelChanged)

    QList<HomeComponent*> listHomeModel();
    void setListHomeModel(const QList<HomeComponent*> _data);

    void createListHomeModel();

private:
    QList<HomeComponent*> m_listHome;

signals:
    void listHomeModelChanged();

public slots:
};

#endif // HOMESCREENMODEL_H
