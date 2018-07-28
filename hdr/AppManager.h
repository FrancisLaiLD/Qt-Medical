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
#include "UserProfileModel.h"



class AppManager : public QObject
{
    Q_OBJECT
public:
    explicit AppManager(QObject *parent = nullptr, QQmlApplicationEngine *_pAppEngine = nullptr);

    Q_INVOKABLE bool handleHomeClick(const int& );
/*------------------------------------------------------------------INIT APPLICATION-------------------------------------------------------------------------*/
    void initApplication();

/*------------------------------------------------------------------UPDATE DATA TO STATUSBAR---------------------------------------------------------------------*/


/*------------------------------------------------------------------UPDATE DATA TO HomeModel---------------------------------------------------------------------*/


/*------------------------------------------------------------------UPDATE DATA TO UserProfile---------------------------------------------------------------------*/
public slots:

/*------------------------------------------------------------------HANDLE VIEW EVENTS-----------------------------------------------------------------------*/

    void handleHomeScreenClick(const int& );

signals:

private:
    QQmlApplicationEngine   *p_qqmlAppEngine;
    HomeQMLController       *p_homeQMLController;

    HomeScreenModel         *p_homeScreenModel;
    StatusbarModel          *p_statusbarModel;
    UserProfileModel        *p_userProfileModel;

};

#endif // APPMANAGER_H
