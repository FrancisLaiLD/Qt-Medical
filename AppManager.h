#ifndef APPMANAGER_H
#define APPMANAGER_H

#include <QObject>
#include <QtDebug>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <iostream>

// E-num
#include "HomeScreen_Enum.h"
// QML Controller
#include "HomeQMLController.h"
// Model for QML
#include "StatusbarModel.h"
#include "HomeScreenModel.h"
#include "HomeScreen_01_Model.h"


class AppManager : public QObject
{
    Q_OBJECT
public:
    explicit AppManager(QObject *parent = nullptr, QQmlApplicationEngine *_pAppEngine = nullptr);

    Q_INVOKABLE bool handleHomeClick(const int& );
/*------------------------------------------------------------------INIT APPLICATION-------------------------------------------------------------------------*/
    void initApplication();

/*------------------------------------------------------------------UPDATE DATA TO MODEL---------------------------------------------------------------------*/


public slots:
/*------------------------------------------------------------------HANDLE VIEW EVENTS-----------------------------------------------------------------------*/

    void handleHomeScreenClick(const int& );

signals:

private:
    QQmlApplicationEngine *p_qqmlAppEngine;
    HomeQMLController *p_homeQMLController;
    HomeScreenModel *p_homeScreenModel;
    HomeScreen_01_Model *p_homeScreen01Model;
    StatusbarModel *p_statusbarModel;

};

#endif // APPMANAGER_H
