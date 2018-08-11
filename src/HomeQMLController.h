#ifndef HOMEQMLCONTROLLER_H
#define HOMEQMLCONTROLLER_H

#include <QObject>
#include <QDebug>
#include <QQmlApplicationEngine>
#include <QStack>
//#include <>
#include "Common/App_Enum.h"
#include "Common/Home_Screen_Table.h"
#include <QQmlContext>

class HomeQMLController : public QObject
{
    Q_OBJECT

public:
    explicit HomeQMLController(QObject *parent = nullptr, QQmlApplicationEngine* _pAppEngine = nullptr);

    bool handleQMLEvent(const int &_index, const QVariant &_value = 0);

    void SCREEN_TRANSITION(const int _index);
    void SCREEN_SHOWPOPUP(const int _index);
    void SCREEN_HIDEPOPUP(const int _index);

    QStack<int> screenStack() const;
    void setScreenStack(const QStack<int> &screenStack);

    int currentScreen() const;
    void setCurrentScreen(int currentScreen);

signals:
    void currentScreenChanged();
public slots:

private:
    QQmlApplicationEngine* p_AppEngine;
    QList<QObject*> m_listObject;
    QStack<int> m_preScrStack;
    int m_currentScreen;

};

#endif // HOMEQMLCONTROLLER_H
