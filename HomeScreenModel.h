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
    Q_PROPERTY(int currentScreen READ currentScreen WRITE setCurrentScreen NOTIFY currentScreenChanged)

    QList<QObject*> listHomeModel();
    void setListHomeModel(const QList<QObject*> _data);

    int homeModelSize() const;

    void createListHomeModel();
    bool checkElementVisible(const int &_index);

    int currentScreen() const;
    void setCurrentScreen(int currentScreen);

private:
    QList<QObject*> m_listHome;
    int m_currentScreen;

signals:
    void listHomeModelChanged();
    void currentScreenChanged();

public slots:
};

#endif // HOMESCREENMODEL_H
