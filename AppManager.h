#ifndef APPMANAGER_H
#define APPMANAGER_H

#include <QObject>
#include <QtDebug>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <iostream>

#include "HomeQMLController.h"
#include "HomeScreenModel.h"


class AppManager : public QObject
{
    Q_OBJECT
public:
    explicit AppManager(QObject *parent = nullptr, QQmlApplicationEngine *_pAppEngine = nullptr);

    Q_INVOKABLE bool handleHomeClick(const int& _index);

/*------------------------------------------------------------------UPDATE DATA TO MODEL---------------------------------------------------------------------*/


public slots:
/*------------------------------------------------------------------HANDLE VIEW EVENTS-----------------------------------------------------------------------*/

    void handleHomeScreenClick(const int& _index);

signals:

private:
    QQmlApplicationEngine *p_qqmlAppEngine;
    HomeQMLController *p_homeQMLController;
    HomeScreenModel *p_homeScreenModel;

};

#endif // APPMANAGER_H
