#ifndef SETTINGSCREENDEF_H
#define SETTINGSCREENDEF_H


#include <QString>
#include <QMap>
#include "App_Enum.h"
#include "AppStringConst.h"

typedef struct DeviceStruct{
    QString m_proName;
    QString m_manufacturer;
} DEVICESTRUCT;

const QMap<int, DEVICESTRUCT> CONST_TABLE_DEVICE {
    {static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_TEMPERATURE_MEASUREMENT),            {m_appString.STR_DEVICE_TEMPERATURE_MEASUREMENT(),      "Unknow"}},
    {static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_HEIGHT_DIAMETTER),                   {m_appString.STR_DEVICE_HEIGHT_DIAMETTER(),             "Unknow"}},
    {static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_WEIGHT_DIAMETTER),                   {m_appString.STR_DEVICE_WEIGHT_DIAMETTER(),             "Unknow"}},
    {static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_BLOOD_PRESSUSER_DIAMETTER),          {m_appString.STR_DEVICE_BLOOD_PRESSUSER_DIAMETTER(),    "Unknow"}},
    {static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_BLOOD_ANALYZER_DIAMETTER),           {m_appString.STR_DEVICE_BLOOD_ANALYZER_DIAMETTER(),     "Unknow"}},
    {static_cast<int>(App_Enum::ENUM_DEVICE::DEVICE_IMAGE_ANALYZER),                     {m_appString.STR_DEVICE_IMAGE_ANALYZER(),               "Unknow"}}
};

#endif // SETTINGSCREENDEF_H
