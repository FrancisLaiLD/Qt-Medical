#ifndef APPMANAGER_H
#define APPMANAGER_H

#include <QObject>
#include <QtDebug>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <iostream>
#include <QDateTime>

// E-num
#include "Common/App_Enum.h"
#include "Common/HomeScreenDef.h"

// Controller
#include "QMLController.h"
#include "MeasureController.h"

// Resource
#include "Common/ResourceManager.h"

// Model for QML
#include "model/StatusbarModel.h"
#include "model/UserProfileModel.h"
#include "model/HomeScreenMainDailyModel.h"
#include "model/SettingModel.h"
#include "model/AppListCommand.h"

// Constant
#include "Common/AppValueConst.h"
#include "Common/AppStringConst.h"

// Worker
#include <QThread>
#include "Worker/Worker_Time_Management.h"

// User Data
#include "model/ListModelUserData.h"

#define CAST_INT(a) static_cast<int>(a)

class AppManager : public QObject
{
    Q_OBJECT
public:
    explicit AppManager(QObject *parent = nullptr, QQmlApplicationEngine *_pAppEngine = nullptr);

    Q_PROPERTY(QDateTime currentTime    READ currentTime            WRITE setCurrentTime            NOTIFY currentTimeChanged)

/*------------------------------------------------------------------INIT APPLICATION-------------------------------------------------------------------------*/
    void initQmlProperty();
    void initApplication();
    void initInternalThread();

/*------------------------------------------------------------------UPDATE DATA TO STATUSBAR---------------------------------------------------------------------*/


/*------------------------------------------------------------------UPDATE DATA TO MODELS---------------------------------------------------------------------*/


/*------------------------------------------------------------------UPDATE DATA TO UserProfile---------------------------------------------------------------------*/


    QDateTime currentTime() const;
    void setCurrentTime(const QDateTime &currentTime);



public slots:

    /*------------------------------------------------------------------HANDLE VIEW EVENTS-----------------------------------------------------------------------*/
    bool handlePopupOkCancel(const bool& _result);
    void handleBackScreen();
    void handleHomeScreen();
    void handleDataScreen();
    void handleTransScreen(const int&, const QVariant& _data = QVariant());
    void handleShowPopup(const int&);
    void handleHidePopup(const int&);

    /*------------------------------------------------------------------HANDLE USER PROFILE--------------------------------------------------------------------*/
    void handleCreateNewUser();

    /*------------------------------------------------------------------HANDLE INTERNAL THREAD--------------------------------------------------------------------*/
    void handleTimeUpdate(QDateTime result);

    /*------------------------------------------------------------------SAVING USER DATA--------------------------------------------------------------------*/
    bool saveUserData(QVariant _data);
    void handleCreateNewRec(const float& _temp = -1, int _heightVal = -1, int _weiVal = -1, QDateTime _dateTime = QDateTime::currentDateTime());
    void handleWriteToRec(const int& _recID);

signals:
    void currentTimeChanged();

private:

    QDateTime   m_currentTime;

    QQmlApplicationEngine   *p_qqmlAppEngine;
    QMLController           *p_QMLController;
    MeasureController       *p_MeasureController;

    // Constant model
    AppValueConst                   *p_AppValueConst;
    AppStringConst                  *p_AppStringConst;
    HomeScreen_Main_Daily_Model     *p_homeDailyModel;
    StatusbarModel                  *p_statusbarModel;
    UserProfileModel                *p_userProfileModel;
    SettingModel                    *p_settingModel;
    AppListCommand                  *p_appListCommand;
//    ResourceManager         *p_resManager;
    Resource_Statusbar              *p_resStatusbar;
    Resource_General                *p_resGeneral;
// Worker
    QThread *p_timeThread;
    Worker_Time_Management *p_timeWorker;
    ListModelUserData *p_listUserData;

};

#endif // APPMANAGER_H
