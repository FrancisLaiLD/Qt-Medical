#ifndef SETTINGSCREENDEF_H
#define SETTINGSCREENDEF_H

#define ESETTING_GENERAL                          "../Component/SettingComponent/ESetting_General.qml"
#define ESETTING_DISPLAY                          "../Component/SettingComponent/ESetting_Display.qml"
#define ESETTING_SOUND                            "../Component/SettingComponent/ESetting_Sound.qml"
#define ESETTING_NETWORK                          "../Component/SettingComponent/ESetting_Network.qml"
#define ESETTING_USERPROFILE                      "../Component/SettingComponent/ESetting_UserProfile.qml"
#define ESETTING_DEVICE_MANAGEMENT                "../Component/SettingComponent/ESetting_Device_Management.qml"

#include <QString>
#include <QMap>
#include "HomeScreen_Enum.h"

typedef struct SETTINGStruct{
    QString s_MenuName;
    QString s_QmlLink;

} SETTINGSTRUCT;

const QMap<int, SETTINGSTRUCT> CONST_TABLE_SETTING {
    {static_cast<int>(HomeScreen_Enum::ENUM_SETTING::SETTING_GENERAL),          {"General",         ESETTING_GENERAL}},
//    {static_cast<int>(HomeScreen_Enum::ENUM_SETTING::SETTING_DISPLAY),          {"Display",         ESETTING_DISPLAY}},
//    {static_cast<int>(HomeScreen_Enum::ENUM_SETTING::SETTING_SOUND),            {"Sound",           ESETTING_SOUND}},
    {static_cast<int>(HomeScreen_Enum::ENUM_SETTING::SETTING_NETWORK),          {"Network",         ESETTING_NETWORK}},
    {static_cast<int>(HomeScreen_Enum::ENUM_SETTING::SETTING_USERPROFILE),      {"User Profile",    ESETTING_USERPROFILE}},
    {static_cast<int>(HomeScreen_Enum::ENUM_SETTING::SETTING_DEVICE),           {"Device",          ESETTING_DEVICE_MANAGEMENT}},
    {static_cast<int>(HomeScreen_Enum::ENUM_SETTING::SETTING_ABOUT),            {"About",           ""}}
};

#endif // SETTINGSCREENDEF_H
