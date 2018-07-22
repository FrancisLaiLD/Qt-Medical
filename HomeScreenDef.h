#ifndef HOMESCREENDEF_H
#define HOMESCREENDEF_H

#include <QObject>
#include <QMap>

enum class ENUM_HOME_MODEL{
    HOME_SCREEN = 0,
    HOME_HEART_BEAT,
    HOME_HOSPITAL,
    HOME_SETTINGS
};

typedef struct homeComp{
    QString s_label;
    QString s_imageLink;
} homeComponent;
const QMap<int, homeComponent> TABLE_HOME_MODEL
{
    {static_cast<int>(ENUM_HOME_MODEL::HOME_SCREEN), {"Home Screen", "/home/moonlight/app/share/images/doctor.png"}},
    {static_cast<int>(ENUM_HOME_MODEL::HOME_SCREEN), {"Home Screen", "/home/moonlight/app/share/images/heart-rate-monitor.png"}}
};

class HomeScreenDef : public QObject
{
    Q_OBJECT
public:
    explicit HomeScreenDef(QObject *parent = nullptr);

signals:

public slots:
};

#endif // HOMESCREENDEF_H
