#include "HomeQMLController.h"

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
    QMetaObject::invokeMethod(m_listObject[0], "transtionScreen",
            Q_RETURN_ARG(QVariant, returnedValue),
            Q_ARG(QVariant, msg));
    qDebug() << "Func result: " << returnedValue.toBool();
//    QMetaObject::invokeMethod();
}
