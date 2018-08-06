#ifndef APPMANAGER_H
#define APPMANAGER_H

#include <QObject>
#include <QtDebug>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <iostream>

// E-num
#include "HomeScreen_Enum.h"
#include "HomeScreenDef.h"
#include "BezierCurve.h"
// QML Controller
#include "HomeQMLController.h"
// Resource
#include "ResourceManager.h"
// Model for QML
#include "StatusbarModel.h"
#include "UserProfileModel.h"
#include "HomeScreenMainDailyModel.h"
#include "SettingModel.h"
// Constant
#include "HomeScreenConst.h"
#include "HomeStringModel.h"



class AppManager : public QObject
{
    Q_OBJECT
public:

    explicit AppManager(QObject *parent = nullptr, QQmlApplicationEngine *_pAppEngine = nullptr);
    Q_PROPERTY(bool isShowingPopup      READ isShowingPopup         WRITE setIsShowingPopup         NOTIFY isShowingPopupChanged)
    Q_PROPERTY(int currentScreen        READ currentScreen          WRITE setCurrentScreen          NOTIFY currentScreenChanged)
    Q_PROPERTY(QDateTime currentTime    READ currentTime            WRITE setCurrentTime            NOTIFY currentTimeChanged)

/*------------------------------------------------------------------INIT APPLICATION-------------------------------------------------------------------------*/
    void initQmlProperty();
    void initApplication();

/*------------------------------------------------------------------UPDATE DATA TO STATUSBAR---------------------------------------------------------------------*/


/*------------------------------------------------------------------UPDATE DATA TO HomeModel---------------------------------------------------------------------*/


/*------------------------------------------------------------------UPDATE DATA TO UserProfile---------------------------------------------------------------------*/
    bool isShowingPopup() const;
    void setIsShowingPopup(bool isShowingPopup);

    int currentScreen() const;
    void setCurrentScreen(int currentScreen);

    QDateTime currentTime() const;
    void setCurrentTime(const QDateTime &currentTime);

public slots:

    /*------------------------------------------------------------------HANDLE VIEW EVENTS-----------------------------------------------------------------------*/
    bool handleHomeClick(const int& );
    void handleHomeScreenClick(const int& );
    void handlePopupClick(const int&);
    void handleHidePopupClick(const int&);

signals:
    void isShowingPopupChanged();
    void currentScreenChanged();
    void currentTimeChanged();

private:
    bool        m_isShowingPopup;
    int         m_currentScreen;
    QDateTime   m_currentTime;
    QQmlApplicationEngine   *p_qqmlAppEngine;
    HomeQMLController       *p_homeQMLController;

    // Constant model
    HomeScreenConst                 *p_homeScreenConst;
    HomeStringModel                 *p_homeStringModel;
    HomeScreen_Main_Daily_Model     *p_homeDailyModel;
    StatusbarModel                  *p_statusbarModel;
    UserProfileModel                *p_userProfileModel;
    SettingModel                    *p_settingModel;
//    ResourceManager         *p_resManager;
    Resource_Statusbar              *p_resStatusbar;
    Resource_General                *p_resGeneral;


};

#endif // APPMANAGER_H
