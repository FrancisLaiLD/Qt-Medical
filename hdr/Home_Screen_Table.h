#ifndef HOME_SCREEN_TABLE_H
#define HOME_SCREEN_TABLE_H


#include "HomeScreen_Enum.h"

const QMap<int, QMLStruct> CONST_TABLE_QML {
    {static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_BACK) ,              {static_cast<int>(HomeScreen_Enum::QML_EVENT::EVENT_SCREEN_TRANS),     QML_NONE}},
    {static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_HOME_SCREEN) ,       {static_cast<int>(HomeScreen_Enum::QML_EVENT::EVENT_SCREEN_TRANS),     SCREEN_EHOME_MAIN_DAILY}},
    {static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_HOME_WEATHER) ,      {static_cast<int>(HomeScreen_Enum::QML_EVENT::EVENT_SCREEN_TRANS),     SCREEN_EHOME_MAIN_WEATHER}},
    {static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_HOME_ADVANCED) ,     {static_cast<int>(HomeScreen_Enum::QML_EVENT::EVENT_SCREEN_TRANS),     SCREEN_EHOME_MAIN_ADVANCED}},
    {static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_USER_PROFILE) ,      {static_cast<int>(HomeScreen_Enum::QML_EVENT::EVENT_SCREEN_TRANS),     SCREEN_EHOME_USER_PROFILE}},
    {static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_USER_DATA) ,         {static_cast<int>(HomeScreen_Enum::QML_EVENT::EVENT_SCREEN_TRANS),     SCREEN_EHOME_MAIN_USER_DATA}},
    {static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_TECHNICAL_OVERVIEW), {static_cast<int>(HomeScreen_Enum::QML_EVENT::EVENT_SCREEN_TRANS),     SCREEN_EHOME_TECHNICAL_OVERVIEW}},
    {static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_GO_TO_SETTING),            {static_cast<int>(HomeScreen_Enum::QML_EVENT::EVENT_SCREEN_TRANS),     SCREEN_EHOME_SETTING}},

    {static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_SHOW_POPUP_USER_PROFILE),  {static_cast<int>(HomeScreen_Enum::QML_EVENT::EVENT_ONSCREEN),         POPUP_EHOME_MAIN_USER_POPUP}},
    {static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_SHOW_POPUP_NO_CONNECTION),  {static_cast<int>(HomeScreen_Enum::QML_EVENT::EVENT_ONSCREEN),        POPUP_EHOME_NO_CONNECTION}},
    {static_cast<int>(HomeScreen_Enum::ENUM_HOME_EVENT::EVENT_HIDE_POPUP),               {static_cast<int>(HomeScreen_Enum::QML_EVENT::EVENT_HIDEONSCREEN),     QML_NONE}}
};

#endif // HOME_SCREEN_TABLE_H
