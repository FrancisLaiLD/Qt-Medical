#ifndef HOME_SCREEN_TABLE_H
#define HOME_SCREEN_TABLE_H


#include "App_Enum.h"

const QMap<int, QMLStruct> CONST_TABLE_SCREEN_QML {
    {static_cast<int>(App_Enum::ENUM_SCREEN_EVENT::EVENT_GO_TO_HOME_SCREEN) ,       {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_SCREEN_TRANS),     SCREEN_EHOME_MAIN_DAILY}},
    {static_cast<int>(App_Enum::ENUM_SCREEN_EVENT::EVENT_GO_TO_HOME_WEATHER) ,      {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_SCREEN_TRANS),     SCREEN_EHOME_MAIN_WEATHER}},
    {static_cast<int>(App_Enum::ENUM_SCREEN_EVENT::EVENT_GO_TO_HOME_ADVANCED) ,     {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_SCREEN_TRANS),     SCREEN_EHOME_MAIN_ADVANCED}},
    {static_cast<int>(App_Enum::ENUM_SCREEN_EVENT::EVENT_GO_TO_USER_PROFILE) ,      {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_SCREEN_TRANS),     SCREEN_EHOME_USER_PROFILE}},
    {static_cast<int>(App_Enum::ENUM_SCREEN_EVENT::EVENT_GO_TO_USER_DATA) ,         {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_SCREEN_TRANS),     SCREEN_EHOME_MAIN_USER_DATA}},
    {static_cast<int>(App_Enum::ENUM_SCREEN_EVENT::EVENT_GO_TO_TECHNICAL_OVERVIEW), {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_SCREEN_TRANS),     SCREEN_EHOME_TECHNICAL_OVERVIEW}},
    {static_cast<int>(App_Enum::ENUM_SCREEN_EVENT::EVENT_GO_TO_SETTING),            {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_SCREEN_TRANS),     SCREEN_EHOME_SETTING}},

    {static_cast<int>(App_Enum::ENUM_SCREEN_EVENT::EVENT_GOTO_COMMAND_TEMPMEASURE),               {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_SCREEN_TRANS),     SCREEN_FUNCTION_TEMPMEASURE}},
    {static_cast<int>(App_Enum::ENUM_SCREEN_EVENT::EVENT_GOTO_COMMAND_HEIGHTDIAMETTER),           {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_SCREEN_TRANS),     SCREEN_FUNCTION_HEIGHTDIAMETTER}},
    {static_cast<int>(App_Enum::ENUM_SCREEN_EVENT::EVENT_GOTO_COMMAND_WEIGHTDIAMETTER),           {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_SCREEN_TRANS),     SCREEN_FUNCTION_WEIGHTDIAMETTER}},
    {static_cast<int>(App_Enum::ENUM_SCREEN_EVENT::EVENT_GOTO_COMMAND_BLOODPRESSMEASURE),         {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_SCREEN_TRANS),     SCREEN_FUNCTION_BLOODPRESSMEASURE}},
};

const QMap<int, QMLStruct> CONST_TABLE_POPUP_QML {
    {static_cast<int>(App_Enum::ENUM_POPUP_EVENT::EVENT_SHOW_POPUP_USER_PROFILE),   {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_ONSCREEN),         POPUP_EHOME_MAIN_USER_POPUP}},
    {static_cast<int>(App_Enum::ENUM_POPUP_EVENT::EVENT_SHOW_POPUP_NO_CONNECTION),  {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_ONSCREEN),         POPUP_EHOME_NO_CONNECTION}},
    {static_cast<int>(App_Enum::ENUM_POPUP_EVENT::EVENT_SHOW_POPUP_CREATINGUSER),   {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_ONSCREEN),         POPUP_EHOME_CREATINGUSER}},
    {static_cast<int>(App_Enum::ENUM_POPUP_EVENT::EVENT_SHOW_POPUP_CONFIRMEXIT),    {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_ONSCREEN),         POPUP_EHOME_CONFIRMEXIT}},
    {static_cast<int>(App_Enum::ENUM_POPUP_EVENT::EVENT_SHOW_POPUP_NOTCHANGEUSER),  {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_ONSCREEN),         POPUP_EHOME_NOTCHANGEUSER}},
    {static_cast<int>(App_Enum::ENUM_POPUP_EVENT::EVENT_SHOW_POPUP_SAVEDATA),       {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_ONSCREEN),         POPUP_EHOME_SAVEDATA}},
    {static_cast<int>(App_Enum::ENUM_POPUP_EVENT::EVENT_HIDE_POPUP),                {static_cast<int>(App_Enum::QML_EVENT_TYPE::EVENT_HIDEONSCREEN),     QML_NONE}}
};


#endif // HOME_SCREEN_TABLE_H
