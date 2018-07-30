#include "hdr/AppManager.h"

AppManager::AppManager(QObject *parent, QQmlApplicationEngine *_pAppEngine) : QObject(parent)
{
    p_qqmlAppEngine         = _pAppEngine;
    p_statusbarModel        = new StatusbarModel();
    p_userProfileModel      = new UserProfileModel();
//    p_resManager            = new ResourceManager(p_qqmlAppEngine);
    p_resStatusbar          = new Resource_Statusbar(nullptr, QString(STATUSBAR_PATH));
    p_resGeneral            = new Resource_General(nullptr, QString(GENERAL_PATH));
    p_homeDailyModel        = new HomeScreen_Main_Daily_Model();


    qmlRegisterUncreatableType<HomeScreen_Enum>("com.embeddeduse.models", 1, 0, "HomeEnum",
                                                 "Cannot create WarningLevel in QML");


    p_qqmlAppEngine->rootContext()->setContextProperty("AppManager",        this);
    p_qqmlAppEngine->rootContext()->setContextProperty("StatusbarModel",    p_statusbarModel);
    p_qqmlAppEngine->rootContext()->setContextProperty("UserProfileModel",  p_userProfileModel);
    p_qqmlAppEngine->rootContext()->setContextProperty("HomeDailyModel",    p_homeDailyModel);
//    p_qqmlAppEngine->rootContext()->setContextProperty("ResManager",        p_resManager);
    p_qqmlAppEngine->rootContext()->setContextProperty("ResStatusBar",      p_resStatusbar);
    p_qqmlAppEngine->rootContext()->setContextProperty("Resource_General",  p_resGeneral);


    p_qqmlAppEngine->load("/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/qml/main.qml");

    p_homeQMLController = new HomeQMLController(this, p_qqmlAppEngine);
}

bool AppManager::handleHomeClick(const int &_index)
{
    qDebug() << "Handle index: "<< _index;
    return true;
}

void AppManager::initApplication()
{
    // init varriable
    m_isShowingPopup = false;
    // init model
    p_statusbarModel->setUserIcon(p_resGeneral->ico_boy_2());
    p_statusbarModel->setUserName("Đăng Hưng");

    // init Screen
    p_homeQMLController->SCREEN_TRANSITION(SCREEN_EHOME_MAIN_DAILY);
}

void AppManager::handleHomeScreenClick(const int &_index)
{
    switch (_index) {
    case static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_HOME_SCREEN):
    {
        qDebug() << "handleHomeScreenClick" << "Home Screen";
        p_homeQMLController->SCREEN_TRANSITION(SCREEN_EHOME_MAIN_DAILY);
    }
        break;
//    case static_cast<int>(ENUM_HOME_EVENT::EVENT_GO_TO_BACK):
    case static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_BACK):
    {
        qDebug() << "handleHomeScreenClick" << "Back";
        p_homeQMLController->SCREEN_TRANSITION(SCREEN_EHOME_MAIN_DAILY);
    }
        break;
//    case static_cast<int>(ENUM_HOME_EVENT::EVENT_GO_TO_HOME_WEATHER):
    case static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_HOME_WEATHER):
    {
        qDebug() << "handleHomeScreenClick" << "Home weather";
        p_homeQMLController->SCREEN_TRANSITION(SCREEN_EHOME_MAIN_WEATHER);
    }
        break;
//    case static_cast<int>(ENUM_HOME_EVENT::EVENT_GO_TO_HOME_ADVANCED):
    case static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_HOME_ADVANCED):
    {
        qDebug() << "handleHomeScreenClick" << "Home Advanced";
        p_homeQMLController->SCREEN_TRANSITION(SCREEN_EHOME_MAIN_ADVANCED);
    }
        break;
//    case static_cast<int>(ENUM_HOME_EVENT::EVENT_GO_TO_USER_PROFILE):
    case static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_USER_PROFILE):
    {
        qDebug() << "handleHomeScreenClick" << "User Profile";
        p_homeQMLController->SCREEN_TRANSITION(SCREEN_EHOME_USER_PROFILE);
    }
        break;
//    case static_cast<int>(ENUM_HOME_EVENT::EVENT_GO_TO_USER_DATA):
    case static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_USER_DATA):
    {
        qDebug() << "handleHomeScreenClick" << "User Data";
        p_homeQMLController->SCREEN_TRANSITION(SCREEN_EHOME_MAIN_USER_DATA);
    }
        break;
    default:
    {
        qDebug() << "Invalid Screen" << "Nothing to transition";
    }
    }

}

void AppManager::handlePopupClick(const int &_index)
{
    switch (_index) {
    case static_cast<int>(HomeScreen_Enum::ENUM_POPUP_EVENT::EVENT_SHOW_POPUP_USER_PROFILE):
    {
        setIsShowingPopup(true);
        p_homeQMLController->SCREEN_SHOWPOPUP(POPUP_EHOME_MAIN_USER_POPUP);
    }
        break;
    case static_cast<int>(HomeScreen_Enum::ENUM_POPUP_EVENT::EVENT_HIDE_POPUP):
    {
        setIsShowingPopup(false);
        p_homeQMLController->SCREEN_HIDEPOPUP(POPUP_EHOME_MAIN_USER_POPUP);
    }
    default:
    {
        qDebug() << "Invalid Screen" << "Nothing to transition";
    }
        break;
    }
}

bool AppManager::isShowingPopup() const
{
    return m_isShowingPopup;
}

void AppManager::setIsShowingPopup(bool isShowingPopup)
{
    if (m_isShowingPopup != isShowingPopup)
    {
        m_isShowingPopup = isShowingPopup;
        emit isShowingPopupChanged();
    }
}
