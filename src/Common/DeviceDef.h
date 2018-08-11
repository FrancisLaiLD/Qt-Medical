#ifndef SETTINGSCREENDEF_H
#define SETTINGSCREENDEF_H

//#define ESETTING_GENERAL                          "../Component/SettingComponent/ESetting_General.qml"
//#define ESETTING_DISPLAY                          "../Component/SettingComponent/ESetting_Display.qml"
//#define ESETTING_SOUND                            "../Component/SettingComponent/ESetting_Sound.qml"
//#define ESETTING_NETWORK                          "../Component/SettingComponent/ESetting_Network.qml"
//#define ESETTING_USERPROFILE                      "../Component/SettingComponent/ESetting_UserProfile.qml"
//#define ESETTING_DEVICE_MANAGEMENT                "../Component/SettingComponent/ESetting_Device_Management.qml"
//#define DEVICE_BLOOD_PRESSURE_DIAMETTER         "Blood pressure"
//#define DEVICE_BLOOD_ANALYZER                   "Blood analyser"
//#define DEVICE_HEIGHT_DIAMETTER                 ""
//#define DEVICE_WEIGHT_DIAMETTER                 ""
//#define DEVICE_IMAGE_ANALYZER                   ""

//#define DEVICE_BLOOD_PRESSURE_DIAMETTER_MANUFACT         ""
//#define DEVICE_BLOOD_ANALYZER_MANUFACT                   ""
//#define DEVICE_HEIGHT_DIAMETTER_MANUFACT                 ""
//#define DEVICE_WEIGHT_DIAMETTER_MANUFACT                 ""
//#define DEVICE_IMAGE_ANALYZER_MANUFACT                   ""

#include <QString>
#include <QMap>
#include "App_Enum.h"

typedef struct DeviceStruct{
    QString m_proName;
    QString m_manufacturer;
} DEVICESTRUCT;

const QMap<int, DEVICESTRUCT> CONST_TABLE_DEVICE {
    {static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_HEIGHT_DIAMETTER),                   {"Height diametter",             "Unknow"}},
    {static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_WEIGHT_DIAMETTER),                   {"Weight diametter",             "Unknow"}},
    {static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_BLOOD_PRESSUSER_DIAMETTER),          {"Blood pressuer diametter",     "Unknow"}},
    {static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_BLOOD_ANALYZER_DIAMETTER),           {"Blood analyser",               "Unknow"}},
    {static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_IMAGE_ANALYZER),                     {"Image analyser",               "Unknow"}}
};

#endif // SETTINGSCREENDEF_H
