#ifndef HOMESCREENDEF_H
#define HOMESCREENDEF_H

#include <QObject>
#include <QMap>

enum class ENUM_HOME_MODEL{
    HOME_MENU_HEART = 0,
    HOME_MENU_TEMPERATURE,
    HOME_MENU_NURSE,
    HOME_MENU_HOSPITAL,
    HOME_MENU_SETTING
};

typedef struct homeComp{
    QString s_label;
    QString s_imageLink;
} homeComponent;
const QMap<int, homeComponent> TABLE_HOME_MODEL
{
    {static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_HEART),            {"Heart",              "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/icons/heart.png"}},
    {static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_TEMPERATURE),      {"Temperature", "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/icons/deg-tem.png"}},
    {static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_NURSE),            {"Nurse", "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/icons/first-aid.png"}},
    {static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_HOSPITAL),         {"Hospital", "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/icons/nurse.png"}},
    {static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_SETTING),          {"Setting", "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/icons/paramedic.png"}}
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
