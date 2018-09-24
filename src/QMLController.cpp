#include "QMLController.h"

QMLController::QMLController(QObject *parent, QQmlApplicationEngine* _pAppEngine) : QObject(parent)
{
    this->p_AppEngine = _pAppEngine;
    m_isShowingPopup = false;
    m_popupOkCancelResult = false;
    m_currentScreen = -1;
    m_nextScreen = -1;
    m_screenStack.clear();
}

bool QMLController::handleQMLEvent(const int& _eventType, const int &_index, const QVariant &_value)
{
    qDebug() << "event type: " << _eventType << "event value: " << _value;;
    if (_eventType == static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_GO_TO_BACK))
    {
        if (m_screenStack.size() == 1)
        {
            return false;
        }
//        int m_curScreen = m_screenStack.pop();
//        int m_prevScreen= m_screenStack.pop();
//        m_screenStack.push(m_curScreen);
//        // check if Back to Home Screen -> clear Stack Screen and Add the Home Screen to first current Screen
//        if (m_prevScreen == 0)
//        {
//            m_screenStack.clear();
//            m_screenStack.push(0);
//        }
        int m_nextScreen = m_screenStack.pop();
        m_nextScreen = m_screenStack.top();
        SCREEN_TRANSITION(m_nextScreen);
    }
    else if (_eventType == static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_SCREEN_TRANS))
    {
        qDebug() << "next screen: " << _index;
        if (_index == static_cast<int>(App_Enum::ENUM_SCREEN_EVENT::EVENT_GO_TO_HOME_SCREEN))
        {
            m_screenStack.clear();
            m_screenStack.push(_index);
        }
        else
        {
            if (!m_screenStack.contains(_index))
            {
                m_screenStack.push(_index);
            }
            else
            {
                qDebug() << "Stack contain index";
                // remove screen from this to end
                int screenIndex = m_screenStack.indexOf(_index);
                for (int i = screenIndex +1; i < m_screenStack.size(); i++)
                    m_screenStack.pop();
            }
        }
        SCREEN_TRANSITION(_index);
    }
    else if (_eventType == static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_ONSCREEN))
    {
        if (!isShowingPopup())
        {
            qDebug() << "handleQMLEvent" << "EVENT_ONSCREEN";
            setIsShowingPopup(true);
            SCREEN_SHOWPOPUP(_index);
        }
    }
    else if (_eventType == static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_HIDEONSCREEN))
    {
        if (isShowingPopup())
        {
            qDebug() << "handleQMLEvent" << "EVENT_HIDEONSCREEN";
            setIsShowingPopup(false);
            SCREEN_HIDEPOPUP(_index);
        }
    }
    else
    {
        qDebug() << "handleQMLEvent" << "do nothing";
        return false;
    }
    qDebug() << "screen stack size: " << m_screenStack.size();
    return true;
}

void QMLController::SCREEN_TRANSITION(const int _index)
{

    if (m_listObject.isEmpty())
    {
        return ;
    }
    this->setCurrentScreen(_index);
    QVariant returnedValue;
    QVariant msg = CONST_TABLE_SCREEN_QML.value(_index).s_QmlLink;
    QMetaObject::invokeMethod(m_listObject[0], "transtionScreen", Q_RETURN_ARG(QVariant, returnedValue),Q_ARG(QVariant, msg));
}

void QMLController::SCREEN_SHOWPOPUP(const int _index)
{
    QVariant returnedValue;
    QVariant msg = CONST_TABLE_POPUP_QML.value(_index).s_QmlLink;
    QMetaObject::invokeMethod(m_listObject[0], "showPopup",
            Q_RETURN_ARG(QVariant, returnedValue),
            Q_ARG(QVariant, msg));
    qDebug() << "Func result: " << returnedValue.toBool();
}

void QMLController::SCREEN_HIDEPOPUP(const int _index)
{
    QVariant returnedValue;
    QVariant msg = CONST_TABLE_POPUP_QML.value(_index).s_QmlLink;
    QMetaObject::invokeMethod(m_listObject[0], "hidePopup",
            Q_RETURN_ARG(QVariant, returnedValue),
            Q_ARG(QVariant, msg));
    qDebug() << "Func result: " << returnedValue.toBool();
}

QStack<int> QMLController::screenStack() const
{
    return m_screenStack;
}

void QMLController::setScreenStack(const QStack<int> &screenStack)
{
    m_screenStack = screenStack;
}

int QMLController::currentScreen() const
{
    return m_currentScreen;
}

void QMLController::setCurrentScreen(int currentScreen)
{
    if (m_currentScreen != currentScreen)
    {
        m_currentScreen = currentScreen;
        emit currentScreenChanged();
    }
}

QList<QObject *> QMLController::listObject() const
{
    return m_listObject;
}

void QMLController::setListObject(const QList<QObject *> &listObject)
{
    m_listObject = listObject;
}

QString QMLController::popupContent() const
{
    return m_popupContent;
}

void QMLController::setPopupContent(const QString &popupContent)
{
    if (m_popupContent != popupContent)
    {
        m_popupContent = popupContent;
        emit popupContentChanged();
    }
}

bool QMLController::popupOkCancelResult() const
{
    return m_popupOkCancelResult;
}

void QMLController::setPopupOkCancelResult(bool popupOkCancelResult)
{
    if (m_popupOkCancelResult != popupOkCancelResult)
    {
        m_popupOkCancelResult = popupOkCancelResult;
        emit popupOkCancelResultChanged();
    }
}

int QMLController::nextScreen() const
{
    return m_nextScreen;
}

void QMLController::setNextScreen(int nextScreen)
{
    if (m_nextScreen != nextScreen)
    {
        m_nextScreen = nextScreen;
        emit nextScreenChanged();
    }
}

bool QMLController::isShowingPopup() const
{
    return m_isShowingPopup;
}

void QMLController::setIsShowingPopup(bool isShowingPopup)
{
    if (m_isShowingPopup != isShowingPopup)
    {
        m_isShowingPopup = isShowingPopup;
        emit isShowingPopupChanged();
    }
}
