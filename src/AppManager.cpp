#include "hdr/AppManager.h"

AppManager::AppManager(QObject *parent, QQmlApplicationEngine *_pAppEngine) : QObject(parent)
{
    p_qqmlAppEngine         = _pAppEngine;
    p_homeScreenModel       = new HomeScreenModel();
    p_statusbarModel        = new StatusbarModel();
    p_userProfileModel      = new UserProfileModel();
    qmlRegisterUncreatableType<HomeScreen_Enum>("com.embeddeduse.models", 1, 0, "HomeEnum",
                                                 "Cannot create WarningLevel in QML");


    p_qqmlAppEngine->rootContext()->setContextProperty("AppManager",        this);
    p_qqmlAppEngine->rootContext()->setContextProperty("HomeModel",         p_homeScreenModel);
    p_qqmlAppEngine->rootContext()->setContextProperty("StatusbarModel",    p_statusbarModel);
    p_qqmlAppEngine->rootContext()->setContextProperty("UserProfileModel",  p_userProfileModel);

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
    p_statusbarModel->setUserIcon("/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/icons/family/ico_boy_1.png");
    p_statusbarModel->setUserName("Đăng Hưng");
    p_statusbarModel->setIsDayTime(false);
    p_statusbarModel->setBluetoothState(false);
    p_statusbarModel->setNetworkState(5);

    p_homeScreenModel->setCurrentScreen(static_cast<int>(ENUM_HOME_EVENT::EVENT_GO_TO_HOME_SCREEN));
    p_homeQMLController->SCREEN_TRANSITION(SCREEN_EHOME_MAIN_DAILY);
}

void AppManager::handleHomeScreenClick(const int &_index)
{
    switch (_index) {
    case static_cast<int>(ENUM_HOME_EVENT::EVENT_GO_TO_HOME_SCREEN):
    {
        qDebug() << "handleHomeScreenClick" << "Home Screen";
        p_homeQMLController->SCREEN_TRANSITION(SCREEN_EHOME_MAIN_DAILY);
    }
        break;
    case static_cast<int>(ENUM_HOME_EVENT::EVENT_GO_TO_BACK):
    {
        qDebug() << "handleHomeScreenClick" << "Back";
        p_homeQMLController->SCREEN_TRANSITION(SCREEN_EHOME_MAIN_DAILY);
    }
        break;
    case static_cast<int>(ENUM_HOME_EVENT::EVENT_GO_TO_HOME_WEATHER):
    {
        qDebug() << "handleHomeScreenClick" << "Home weather";
        p_homeQMLController->SCREEN_TRANSITION(SCREEN_EHOME_MAIN_WEATHER);
    }
        break;
    case static_cast<int>(ENUM_HOME_EVENT::EVENT_GO_TO_HOME_ADVANCED):
    {
        qDebug() << "handleHomeScreenClick" << "Home Advanced";
        p_homeQMLController->SCREEN_TRANSITION(SCREEN_EHOME_MAIN_ADVANCED);
    }
        break;
    case static_cast<int>(ENUM_HOME_EVENT::EVENT_GO_TO_USER_PROFILE):
    {
        qDebug() << "handleHomeScreenClick" << "User Profile";
        p_homeQMLController->SCREEN_TRANSITION(SCREEN_EHOME_USER_PROFILE);
    }
        break;
    case static_cast<int>(ENUM_HOME_EVENT::EVENT_GO_TO_USER_DATA):
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
