#include "AppManager.h"

// GLOBAL DEFINE
AppStringConst GLOBAL_StringConst;
Resource_General GLOBAL_ResGeneral;

AppManager::AppManager(QObject *parent, QQmlApplicationEngine *_pAppEngine) : QObject(parent)
{
    p_qqmlAppEngine         = _pAppEngine;

    this->initQmlProperty();
    this->initInternalThread();
}

void AppManager::initQmlProperty()
{
    p_statusbarModel        = new StatusbarModel();
    p_userProfileModel      = new UserProfileModel();
    p_resStatusbar          = new Resource_Statusbar(nullptr, QString(STATUSBAR_PATH));
    p_resGeneral            = new Resource_General(nullptr, QString(GENERAL_PATH));
    p_homeDailyModel        = new HomeScreen_Main_Daily_Model(nullptr, p_qqmlAppEngine);
    p_settingModel          = new SettingModel();
    p_listUserData          = new ListModelUserData();
    // constant model
    p_AppValueConst         = new AppValueConst();
    p_AppStringConst        = new AppStringConst();
    p_appListCommand        = new AppListCommand();
    p_MeasureController     = new MeasureController();
    p_QMLController         = new QMLController();

    qmlRegisterUncreatableType<App_Enum>("Ehome", 1, 0, "HomeEnum",
                                         "Cannot create WarningLevel in QML");

    p_qqmlAppEngine->rootContext()->setContextProperty("AppManager",        this);
    p_qqmlAppEngine->rootContext()->setContextProperty("StatusbarModel",    p_statusbarModel);
    p_qqmlAppEngine->rootContext()->setContextProperty("UserProfileModel",  p_userProfileModel);
    p_qqmlAppEngine->rootContext()->setContextProperty("SettingModel",      p_settingModel);
    p_qqmlAppEngine->rootContext()->setContextProperty("ListUserData",      p_listUserData);
    //    p_qqmlAppEngine->rootContext()->setContextProperty("HomeDailyModel",    p_homeDailyModel);
    p_qqmlAppEngine->rootContext()->setContextProperty("ResStatusBar",      p_resStatusbar);
    p_qqmlAppEngine->rootContext()->setContextProperty("Resource_General",  p_resGeneral);
    p_qqmlAppEngine->rootContext()->setContextProperty("AppValueConst",     p_AppValueConst);
    p_qqmlAppEngine->rootContext()->setContextProperty("AppStringConst",    p_AppStringConst);
    p_qqmlAppEngine->rootContext()->setContextProperty("AppListCommand",    p_appListCommand);
    p_qqmlAppEngine->rootContext()->setContextProperty("MEASURE_CONTROL",   p_MeasureController);
    p_qqmlAppEngine->rootContext()->setContextProperty("QML_CONTROL",       p_QMLController);

    p_qqmlAppEngine->load("/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/qml/main.qml");
    p_QMLController->setListObject(p_qqmlAppEngine->rootObjects());
}


void AppManager::initApplication()
{
    // init varriable
    // init model
    // init Setting
    p_settingModel->setCurLang(static_cast<int>(App_Enum::ENUM_APP_LANGUAGE::LANGUAGE_EN));
    p_userProfileModel->initUserList();
    p_listUserData->iniListData();
    // init Screen
    handleTransScreen(static_cast<int>(App_Enum::ENUM_SCREEN_EVENT::EVENT_GO_TO_HOME_SCREEN));
}

void AppManager::initInternalThread()
{
    p_timeWorker = new Worker_Time_Management();
    p_timeThread = new QThread();
    p_timeWorker->moveToThread(p_timeThread);
    connect(p_timeWorker, &Worker_Time_Management::sigCurrentTime, this, &AppManager::handleTimeUpdate);
    connect(p_timeThread, &QThread::started, p_timeWorker, &Worker_Time_Management::process);
    p_timeThread->start();
}

void AppManager::handleTransScreen(const int &_index, const QVariant& _data)
{
    qDebug() << "current screen: " << _index;
    // hide all popups before transistion screen
    if (p_QMLController->isShowingPopup())
    {
        p_QMLController->handleQMLEvent(static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_HIDEONSCREEN), -1);
    }
    p_QMLController->handleQMLEvent(static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_SCREEN_TRANS), _index, _data);

}

void AppManager::handleShowPopup(const int &_index)
{
    p_QMLController->handleQMLEvent(static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_ONSCREEN), _index);
}

void AppManager::handleHidePopup(const int &_index)
{
    p_QMLController->handleQMLEvent(static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_HIDEONSCREEN), _index);
}

void AppManager::handleCreateNewUser()
{

}

void AppManager::handleCreateNewRec(const float& _temp, int _heightVal, int _weiVal, QDateTime _dateTime)
{
    // Write to DB
    p_listUserData->addData(_temp, _heightVal, _weiVal, _dateTime);
}

void AppManager::handleWriteToRec(const int& _recID)
{
    // Write to DB

}

bool AppManager::handlePopupOkCancel(const bool &_result)
{
//    handleHidePopup(static_cast<int>(App_Enum::ENUM_POPUP_EVENT::EVENT_SHOW_POPUP_CONFIRMEXIT));
    switch (p_QMLController->currentScreen()) {
    case CAST_INT(App_Enum::ENUM_SCREEN_EVENT::EVENT_GOTO_COMMAND_TEMPMEASURE):
    case CAST_INT(App_Enum::ENUM_SCREEN_EVENT::EVENT_GOTO_COMMAND_HEIGHTDIAMETTER):
    case CAST_INT(App_Enum::ENUM_SCREEN_EVENT::EVENT_GOTO_COMMAND_BLOODPRESSMEASURE):
    case CAST_INT(App_Enum::ENUM_SCREEN_EVENT::EVENT_GOTO_COMMAND_WEIGHTDIAMETTER):
       if (_result)
       {
            this->handleHidePopup(-1);
       }
       else
       {
            this->handleHidePopup(-1);
       }
        break;
    }
    return true;
}

void AppManager::handleTimeUpdate(QDateTime result)
{
    //    qDebug() << "Time receive : " << result;
    p_homeDailyModel->setTimeUpdate(result);
    p_statusbarModel->setCurrentDT(result);
}

bool AppManager::saveUserData(QVariant _data)
{
    p_listUserData->addData(_data.toFloat(), -1, -1, QDateTime::currentDateTime());
}

void AppManager::handleBackScreen()
{
    if (p_MeasureController->isMeasuring())
    {
        p_QMLController->handleQMLEvent(CAST_INT(App_Enum::QML_EVENT_TYPE::EVENT_ONSCREEN), CAST_INT(App_Enum::ENUM_POPUP_EVENT::EVENT_SHOW_POPUP_CONFIRMEXIT));
    }
    else
    {
        p_QMLController->handleQMLEvent(CAST_INT(App_Enum::QML_EVENT_TYPE::EVENT_GO_TO_BACK));
    }
}

void AppManager::handleHomeScreen()
{
    if (p_MeasureController->isMeasuring())
    {
        p_QMLController->handleQMLEvent(CAST_INT(App_Enum::QML_EVENT_TYPE::EVENT_ONSCREEN), CAST_INT(App_Enum::ENUM_POPUP_EVENT::EVENT_SHOW_POPUP_CONFIRMEXIT));
    }
    else
    {
        p_QMLController->handleQMLEvent(CAST_INT(App_Enum::QML_EVENT_TYPE::EVENT_SCREEN_TRANS), CAST_INT(App_Enum::ENUM_SCREEN_EVENT::EVENT_GO_TO_HOME_SCREEN));
    }
}

void AppManager::handleDataScreen()
{
    if (p_MeasureController->isMeasuring())
    {
        p_QMLController->handleQMLEvent(CAST_INT(App_Enum::QML_EVENT_TYPE::EVENT_ONSCREEN), CAST_INT(App_Enum::ENUM_POPUP_EVENT::EVENT_SHOW_POPUP_CONFIRMEXIT));
    }
    else
    {
        p_QMLController->handleQMLEvent(CAST_INT(App_Enum::QML_EVENT_TYPE::EVENT_SCREEN_TRANS), CAST_INT(App_Enum::ENUM_SCREEN_EVENT::EVENT_GO_TO_USER_DATA));
    }
}

QDateTime AppManager::currentTime() const
{
    return m_currentTime;
}

void AppManager::setCurrentTime(const QDateTime &currentTime)
{
    m_currentTime = currentTime;
}


