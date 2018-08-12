#ifndef COMMANDDEF_H
#define COMMANDDEF_H


#include <QString>
#include <QMap>
#include "App_Enum.h"
#include "AppStringConst.h"

typedef struct CommandStruct{
    QString s_commandName;
    QString s_commandQML;
} COMMANDSTRUCT;


const QMap<int, COMMANDSTRUCT> CONST_TABLE_COMMAND {
    {static_cast<int>(App_Enum::ENUM_COMMAND::COMMAND_MEASURE_TEMPERATURE),     {m_appString.STR_COMMAND_MEASURE_TEMP(),            ""}},
    {static_cast<int>(App_Enum::ENUM_COMMAND::COMMAND_DIAMETTER_HEIGHT),        {m_appString.STR_COMMAND_DIAMETTER_HEIGHT(),        ""}},
    {static_cast<int>(App_Enum::ENUM_COMMAND::COMMAND_DIAMETTER_WEIGHT),        {m_appString.STR_COMMAND_DIAMETTER_WEIGHT(),        ""}},
    {static_cast<int>(App_Enum::ENUM_COMMAND::COMMAND_MEASURE_BLOOD_PRESSURE),  {m_appString.STR_COMMAND_MEASURE_BOOD_PRESSURE(),   ""}}

};

#endif // COMMANDDEF_H
