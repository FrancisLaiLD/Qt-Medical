#ifndef QMLController_H
#define QMLController_H

#include <QObject>
#include <QDebug>
#include <QQmlApplicationEngine>
#include <QStack>
//#include <>
#include "Common/App_Enum.h"
#include "Common/Home_Screen_Table.h"
#include <QQmlContext>

class QMLController : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool isShowingPopup      READ isShowingPopup         WRITE setIsShowingPopup         NOTIFY isShowingPopupChanged)
    Q_PROPERTY(int currentScreen        READ currentScreen          WRITE setCurrentScreen          NOTIFY currentScreenChanged)
    Q_PROPERTY(int nextScreen           READ nextScreen             WRITE setNextScreen             NOTIFY nextScreenChanged)
    Q_PROPERTY(bool popupOkCancelResult READ popupOkCancelResult    WRITE setPopupOkCancelResult    NOTIFY popupOkCancelResultChanged)
    Q_PROPERTY(QString popupContent     READ popupContent           WRITE setPopupContent           NOTIFY popupContentChanged)

public:
    explicit QMLController(QObject *parent = nullptr, QQmlApplicationEngine* _pAppEngine = nullptr);

    bool handleQMLEvent(const int& _eventType, const int &_index = -1, const QVariant &_value = 0);

    void SCREEN_TRANSITION(const int _index);
    void SCREEN_SHOWPOPUP(const int _index);
    void SCREEN_HIDEPOPUP(const int _index);

    QStack<int> screenStack() const;
    void setScreenStack(const QStack<int> &screenStack);

    int nextScreen() const;
    void setNextScreen(int nextScreen);

    bool isShowingPopup() const;
    void setIsShowingPopup(bool isShowingPopup);

    bool popupOkCancelResult() const;
    void setPopupOkCancelResult(bool popupOkCancelResult);

    int currentScreen() const;
    void setCurrentScreen(int currentScreen);

    QList<QObject *> listObject() const;
    void setListObject(const QList<QObject *> &listObject);

    QString popupContent() const;
    void setPopupContent(const QString &popupContent);

signals:
    void currentScreenChanged();
    void isShowingPopupChanged();
    void nextScreenChanged();
    void popupOkCancelResultChanged();
    void popupContentChanged();

public slots:

private:
    QQmlApplicationEngine* p_AppEngine;
    QList<QObject*> m_listObject;
    QStack<int> m_screenStack;
    QString m_popupContent;
    bool        m_isShowingPopup;
    bool        m_popupOkCancelResult;
    int         m_currentScreen;
    int         m_nextScreen;

};

#endif // QMLController_H
