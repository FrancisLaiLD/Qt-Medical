#include "hdr/HomeQMLController.h"

HomeQMLController::HomeQMLController(QObject *parent, QQmlApplicationEngine* _pAppEngine) : QObject(parent)
{
    this->p_AppEngine = _pAppEngine;
    m_listObject = this->p_AppEngine->rootObjects();
    qDebug() << "Number of Object: " << m_listObject.count();

}

void HomeQMLController::SCREEN_TRANSITION(const QString &_destScreen)
{
    QVariant returnedValue;
    QVariant msg = _destScreen;
    if (m_listObject.isEmpty())
        return ;
    QMetaObject::invokeMethod(m_listObject[0], "transtionScreen",
            Q_RETURN_ARG(QVariant, returnedValue),
            Q_ARG(QVariant, msg));
    qDebug() << "Func result: " << returnedValue.toBool();
    //    QMetaObject::invokeMethod();
}

void HomeQMLController::SCREEN_SHOWPOPUP(const QString &_popupName)
{
    QVariant returnedValue;
    QVariant msg = _popupName;
    QMetaObject::invokeMethod(m_listObject[0], "showPopup",
            Q_RETURN_ARG(QVariant, returnedValue),
            Q_ARG(QVariant, msg));
    qDebug() << "Func result: " << returnedValue.toBool();
}

void HomeQMLController::SCREEN_HIDEPOPUP(const QString &_popupName)
{
    QVariant returnedValue;
    QVariant msg = _popupName;
    QMetaObject::invokeMethod(m_listObject[0], "hidePopup",
            Q_RETURN_ARG(QVariant, returnedValue),
            Q_ARG(QVariant, msg));
    qDebug() << "Func result: " << returnedValue.toBool();
}
