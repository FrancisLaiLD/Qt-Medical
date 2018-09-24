#ifndef COMMANDDEF_H
#define COMMANDDEF_H


#include <QString>
#include <QMap>
#include "App_Enum.h"
#include "AppStringConst.h"
#include "HomeScreenDef.h"

typedef struct CommandStruct{
    QString s_commandName;
    QString s_commandQML;
} COMMANDSTRUCT;


const QMap<int, COMMANDSTRUCT> CONST_TABLE_COMMAND {
    {static_cast<int>(App_Enum::ENUM_COMMAND::COMMAND_MEASURE_TEMPERATURE),     {GLOBAL_StringConst.STR_COMMAND_MEASURE_TEMP(),            ""}},
    {static_cast<int>(App_Enum::ENUM_COMMAND::COMMAND_DIAMETTER_HEIGHT),        {GLOBAL_StringConst.STR_COMMAND_DIAMETTER_HEIGHT(),        ""}},
    {static_cast<int>(App_Enum::ENUM_COMMAND::COMMAND_DIAMETTER_WEIGHT),        {GLOBAL_StringConst.STR_COMMAND_DIAMETTER_WEIGHT(),        ""}},
    {static_cast<int>(App_Enum::ENUM_COMMAND::COMMAND_MEASURE_BLOOD_PRESSURE),  {GLOBAL_StringConst.STR_COMMAND_MEASURE_BOOD_PRESSURE(),   ""}},
    {static_cast<int>(App_Enum::ENUM_COMMAND::COMMAND_MAKE_ARECORD),            {GLOBAL_StringConst.STR_COMMAND_MEASURE_ARECORD(),         ""}}
};

#endif // COMMANDDEF_H
