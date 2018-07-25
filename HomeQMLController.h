#ifndef HOMEQMLCONTROLLER_H
#define HOMEQMLCONTROLLER_H

#include <QObject>
#include <QDebug>
#include <QQmlApplicationEngine>
//#include <>

class HomeQMLController : public QObject
{
    Q_OBJECT
public:
    explicit HomeQMLController(QObject *parent = nullptr, QQmlApplicationEngine* _pAppEngine = nullptr);

    void SCREEN_TRANSITION(const QString &_destScreen);

signals:

public slots:

private:
    QQmlApplicationEngine* p_AppEngine;
    QList<QObject*> m_listObject;

};

#endif // HOMEQMLCONTROLLER_H
