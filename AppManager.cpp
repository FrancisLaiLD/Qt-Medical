#include "AppManager.h"

AppManager::AppManager(QObject *parent, QQmlApplicationEngine *_pAppEngine) : QObject(parent)
{
    p_qqmlAppEngine = _pAppEngine;
    p_qqmlAppEngine->load("/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/qml/main.qml");

    p_homeScreenModel = new HomeScreenModel();
    p_homeQMLController = new HomeQMLController(this, p_qqmlAppEngine);

    p_qqmlAppEngine->rootContext()->setContextProperty("AppManager", this);
    p_qqmlAppEngine->rootContext()->setContextProperty("HomeModel", p_homeScreenModel);


}

bool AppManager::handleHomeClick(const int &_index)
{
    qDebug() << "Handle index: "<< _index;
    return true;
}

void AppManager::handleHomeScreenClick(const int &_index)
{
    switch (_index) {
    case 1:
    {
        p_homeQMLController->SCREEN_TRANSITION(SCREEN_E_HOME_01);
    }
        break;
    case 2:
    {
        p_homeQMLController->SCREEN_TRANSITION(SCREEN_E_HOME_02);
    }
        break;
    case 3:
    {
        p_homeQMLController->SCREEN_TRANSITION(SCREEN_E_HOME_03);
    }
        break;
    case 4:
    {
        p_homeQMLController->SCREEN_TRANSITION(SCREEN_E_HOME_04);
    }
        break;
    case 5:
    {
        p_homeQMLController->SCREEN_TRANSITION(SCREEN_E_HOME_05);
    }
        break;
    default:
    {
        qDebug() << "Invalid Screen" << "Nothing to transition";
    }
    }

}
