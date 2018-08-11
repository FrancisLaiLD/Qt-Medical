#ifndef APPMANAGER_H
#define APPMANAGER_H

#include <QObject>
#include <QtDebug>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <iostream>

// E-num
#include "Common/HomeScreen_Enum.h"
#include "Common/HomeScreenDef.h"
// QML Controller
#include "HomeQMLController.h"
// Resource
#include "Common/ResourceManager.h"
// Model for QML
#include "model/StatusbarModel.h"
#include "model/UserProfileModel.h"
#include "model/HomeScreenMainDailyModel.h"
#include "model/SettingModel.h"
// Constant
#include "Common/HomeScreenConst.h"
#include "Common/AppStringConst.h"
// Worker
#include <QThread>
#include "Worker/Worker_Time_Management.h"


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
    void initInternalThread();

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
    void handleHomeScreenClick(const int&, const QVariant& _data = QVariant());
    void handlePopupClick(const int&);
    void handleHidePopupClick(const int&);

    // thread internal
    void handleTimeUpdate(QDateTime result);

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
    AppStringConst                 *p_AppStringConst;
    HomeScreen_Main_Daily_Model     *p_homeDailyModel;
    StatusbarModel                  *p_statusbarModel;
    UserProfileModel                *p_userProfileModel;
    SettingModel                    *p_settingModel;
//    ResourceManager         *p_resManager;
    Resource_Statusbar              *p_resStatusbar;
    Resource_General                *p_resGeneral;
// Worker
    QThread *p_timeThread;
    Worker_Time_Management *p_timeWorker;


};

#endif // APPMANAGER_H
