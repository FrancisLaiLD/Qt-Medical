#include "hdr/AppManager.h"

AppManager::AppManager(QObject *parent, QQmlApplicationEngine *_pAppEngine) : QObject(parent)
{
    p_qqmlAppEngine         = _pAppEngine;
    this->initQmlProperty();
}

void AppManager::initQmlProperty()
{
    p_statusbarModel        = new StatusbarModel();
    p_userProfileModel      = new UserProfileModel();
    p_resStatusbar          = new Resource_Statusbar(nullptr, QString(STATUSBAR_PATH));
    p_resGeneral            = new Resource_General(nullptr, QString(GENERAL_PATH));
    p_homeDailyModel        = new HomeScreen_Main_Daily_Model();
    // constant model
    p_homeScreenConst       = new HomeScreenConst();
    p_homeStringModel       = new HomeStringModel();


    qmlRegisterUncreatableType<HomeScreen_Enum>("com.embeddeduse.models", 1, 0, "HomeEnum",
                                                 "Cannot create WarningLevel in QML");
    qmlRegisterType<BezierCurve>("CustomGeometry", 1, 0, "BezierCurve");

    p_qqmlAppEngine->rootContext()->setContextProperty("AppManager",        this);
    p_qqmlAppEngine->rootContext()->setContextProperty("StatusbarModel",    p_statusbarModel);
    p_qqmlAppEngine->rootContext()->setContextProperty("UserProfileModel",  p_userProfileModel);
    p_qqmlAppEngine->rootContext()->setContextProperty("HomeDailyModel",    p_homeDailyModel);
    p_qqmlAppEngine->rootContext()->setContextProperty("ResStatusBar",      p_resStatusbar);
    p_qqmlAppEngine->rootContext()->setContextProperty("Resource_General",  p_resGeneral);
    p_qqmlAppEngine->rootContext()->setContextProperty("HomeScreenConst",   p_homeScreenConst);
    p_qqmlAppEngine->rootContext()->setContextProperty("HomeStringModel",   p_homeStringModel);

//    p_qqmlAppEngine->rootContext()->setContextProperty("QmlController",     p_homeStringModel);


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
    emit isShowingPopupChanged();
    // init model
    p_statusbarModel->setUserIcon(p_resGeneral->ico_boy_2());
    p_statusbarModel->setUserName("Đăng Hưng");

    // init Screen
    p_homeQMLController->handleQMLEvent(static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_HOME_SCREEN));
}

void AppManager::handleHomeScreenClick(const int &_index)
{
    p_homeQMLController->handleQMLEvent(_index);
}

void AppManager::handlePopupClick(const int &_index)
{
    p_homeQMLController->handleQMLEvent(_index);
    setIsShowingPopup(true);
}

void AppManager::handleHidePopupClick(const int &_index)
{
    p_homeQMLController->handleQMLEvent(_index);
    setIsShowingPopup(false);
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
