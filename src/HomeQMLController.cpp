#include "hdr/HomeQMLController.h"

HomeQMLController::HomeQMLController(QObject *parent, QQmlApplicationEngine* _pAppEngine) : QObject(parent)
{
    this->p_AppEngine = _pAppEngine;
    m_listObject = this->p_AppEngine->rootObjects();

    this->m_currentScreen = static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_HOME_SCREEN);
    this->m_preScrStack.clear();

}

bool HomeQMLController::handleQMLEvent(const int &_index, const QVariant &_value)
{

    int evt = CONST_TABLE_QML.value(_index).s_INDX_SCREEN;
    if (evt == static_cast<int>(HomeScreen_Enum::QML_EVENT::EVENT_SCREEN_TRANS))
    {
        SCREEN_TRANSITION(_index);
    } else if (evt == static_cast<int>(HomeScreen_Enum::QML_EVENT::EVENT_ONSCREEN))
    {
        SCREEN_SHOWPOPUP(_index);
    }
    else if (evt == static_cast<int>(HomeScreen_Enum::QML_EVENT::EVENT_HIDEONSCREEN))
    {
        SCREEN_HIDEPOPUP(_index);
    }
    else
    {
        return false;
    }
    return true;
}

void HomeQMLController::SCREEN_TRANSITION(const int _index)
{

    if (m_listObject.isEmpty())
    {
        return ;
    }
    if (_index != static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_BACK))
    {
        if (_index != static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_HOME_SCREEN))
        {
            m_preScrStack.push(m_currentScreen);
            QVariant returnedValue;
            QVariant msg = CONST_TABLE_QML.value(_index).s_QmlLink;
            QMetaObject::invokeMethod(m_listObject[0], "transtionScreen", Q_RETURN_ARG(QVariant, returnedValue),Q_ARG(QVariant, msg));
            qDebug() << "Func result: " << returnedValue.toBool() << "Screen stack append : " << _index << "Current stack size: " << m_preScrStack.size();
            m_currentScreen = _index;
        }
        else
        {
            m_preScrStack.clear();
            m_currentScreen = static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_HOME_SCREEN);
            QVariant returnedValue;
            QVariant msg = CONST_TABLE_QML.value(_index).s_QmlLink;
            QMetaObject::invokeMethod(m_listObject[0], "transtionScreen", Q_RETURN_ARG(QVariant, returnedValue),Q_ARG(QVariant, msg));
            qDebug() << "Func result: " << returnedValue.toBool() << "Screen stack append : " << _index << "Current stack size: " << m_preScrStack.size();
        }
    } else
    {
        if (m_preScrStack.isEmpty())
            return;
        int preScreen = m_preScrStack.pop();
        QVariant returnedValue;
        QVariant msg = CONST_TABLE_QML.value(preScreen).s_QmlLink;
        QMetaObject::invokeMethod(m_listObject[0], "transtionScreen", Q_RETURN_ARG(QVariant, returnedValue),Q_ARG(QVariant, msg));
        qDebug() << "previous screen: "<< msg;
        m_currentScreen = preScreen;
    }

}

void HomeQMLController::SCREEN_SHOWPOPUP(const int _index)
{
    QVariant returnedValue;
    QVariant msg = CONST_TABLE_QML.value(_index).s_QmlLink;
    QMetaObject::invokeMethod(m_listObject[0], "showPopup",
            Q_RETURN_ARG(QVariant, returnedValue),
            Q_ARG(QVariant, msg));
    qDebug() << "Func result: " << returnedValue.toBool();
}

void HomeQMLController::SCREEN_HIDEPOPUP(const int _index)
{
    QVariant returnedValue;
    QVariant msg = CONST_TABLE_QML.value(_index).s_QmlLink;
    QMetaObject::invokeMethod(m_listObject[0], "hidePopup",
            Q_RETURN_ARG(QVariant, returnedValue),
            Q_ARG(QVariant, msg));
    qDebug() << "Func result: " << returnedValue.toBool();
}

QStack<int> HomeQMLController::screenStack() const
{
    return m_preScrStack;
}

void HomeQMLController::setScreenStack(const QStack<int> &screenStack)
{
    m_preScrStack = screenStack;
}

int HomeQMLController::currentScreen() const
{
    return m_currentScreen;
}

void HomeQMLController::setCurrentScreen(int currentScreen)
{
    if (m_currentScreen != currentScreen)
    {
        m_currentScreen = currentScreen;
        emit currentScreenChanged();
    }
}
