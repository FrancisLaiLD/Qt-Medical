#ifndef AppStringConst_H
#define AppStringConst_H

#include <QObject>

class AppStringConst : public QObject
{
    Q_OBJECT
public:
    explicit AppStringConst(QObject *parent = nullptr) { Q_UNUSED(parent)}
    // GENERAL USING DECLARE
    Q_PROPERTY(QString STR_GENERAL_TIME                                 READ STR_GENERAL_TIME CONSTANT)
    Q_PROPERTY(QString STR_GENERAL_TIME_ENG_FORMAT                      READ STR_GENERAL_TIME_ENG_FORMAT CONSTANT)
    Q_PROPERTY(QString STR_GENERAL_TIME_VIE_FORMAT                      READ STR_GENERAL_TIME_VIE_FORMAT CONSTANT)
    Q_PROPERTY(QString STR_GENERAL_BACK                                 READ STR_GENERAL_BACK CONSTANT)
    Q_PROPERTY(QString STR_GENERAL_UNDEFINE                             READ STR_GENERAL_UNDEFINE CONSTANT)
    // HOME DECLARE
    Q_PROPERTY(QString STR_HOME_WEATHER_CELCIUS_DEGREE                  READ STR_HOME_WEATHER_CELCIUS_DEGREE CONSTANT)
    Q_PROPERTY(QString STR_HOME_WEATHER_FAHRENHEIT_DEGREE               READ STR_HOME_WEATHER_FAHRENHEIT_DEGREE CONSTANT)
    Q_PROPERTY(QString STR_HOME_WEATHER_MAXTEMP_DIV_MINTEMP             READ STR_HOME_WEATHER_MAXTEMP_DIV_MINTEMP CONSTANT)
    Q_PROPERTY(QString STR_HOME_WEATHER_DIRECTION                       READ STR_HOME_WEATHER_DIRECTION CONSTANT)
    Q_PROPERTY(QString STR_HOME_WEATHER_EAST                            READ STR_HOME_WEATHER_EAST CONSTANT)
    Q_PROPERTY(QString STR_HOME_WEATHER_WEAST                           READ STR_HOME_WEATHER_WEAST CONSTANT)
    Q_PROPERTY(QString STR_HOME_WEATHER_NORTH                           READ STR_HOME_WEATHER_NORTH CONSTANT)
    Q_PROPERTY(QString STR_HOME_WEATHER_SOUTH                           READ STR_HOME_WEATHER_SOUTH CONSTANT)
    Q_PROPERTY(QString STR_HOME_WEATHER_SPEED                           READ STR_HOME_WEATHER_SPEED CONSTANT)
    Q_PROPERTY(QString STR_HOME_WEATHER_KM_H                            READ STR_HOME_WEATHER_KM_H CONSTANT)
    Q_PROPERTY(QString STR_HOME_WEATHER_DATA_WAS_UPDATE                 READ STR_HOME_WEATHER_DATA_WAS_UPDATE CONSTANT)
    Q_PROPERTY(QString STR_HOME_WEATHER_TIPS_TODAY                      READ STR_HOME_WEATHER_TIPS_TODAY CONSTANT)
    Q_PROPERTY(QString STR_HOME_WEATHER_SHOW_MORE_DETAIL                READ STR_HOME_WEATHER_SHOW_MORE_DETAIL CONSTANT)
    Q_PROPERTY(QString STR_HOME_DEVICE_CONNECTION                       READ STR_HOME_DEVICE_CONNECTION CONSTANT)
    Q_PROPERTY(QString STR_HOME_GO_TO_DEVICE_SETTING                    READ STR_HOME_GO_TO_DEVICE_SETTING CONSTANT)
    Q_PROPERTY(QString STR_HOME_GO_TO_USER_DATA                         READ STR_HOME_GO_TO_USER_DATA CONSTANT)
    Q_PROPERTY(QString STR_HOME_GO_TO_USER_SCHEDULE                     READ STR_HOME_GO_TO_USER_SCHEDULE CONSTANT)

    Q_PROPERTY(QString STR_USER_DATA                                    READ STR_USER_DATA CONSTANT)
    Q_PROPERTY(QString STR_USER_DATA_BLOOD_PRESSUER                     READ STR_USER_DATA_BLOOD_PRESSUER CONSTANT)
    Q_PROPERTY(QString STR_USER_DATA_SEND_TO_DOCTOR                     READ STR_USER_DATA_SEND_TO_DOCTOR CONSTANT)
    Q_PROPERTY(QString STR_USER_DATA_YOUR_DATA                          READ STR_USER_DATA_YOUR_DATA CONSTANT)

    // USER PROFILE DECLARE
    Q_PROPERTY(QString STR_USER_PROFILE_CHANGE_USER                     READ STR_USER_PROFILE_CHANGE_USER CONSTANT)
    // COMMAN DECLARE
    Q_PROPERTY(QString STR_DEVICE_TEMPERATURE_MEASUREMENT               READ STR_COMMAND_MEASURE_TEMP CONSTANT)
    Q_PROPERTY(QString STR_DEVICE_HEIGHT_DIAMETTER                      READ STR_COMMAND_MEASURE_TEMP CONSTANT)
    Q_PROPERTY(QString STR_DEVICE_WEIGHT_DIAMETTER                      READ STR_COMMAND_MEASURE_TEMP CONSTANT)
    Q_PROPERTY(QString STR_DEVICE_BLOOD_PRESSUSER_DIAMETTER             READ STR_COMMAND_MEASURE_TEMP CONSTANT)
    Q_PROPERTY(QString STR_DEVICE_BLOOD_ANALYZER_DIAMETTER              READ STR_COMMAND_MEASURE_TEMP CONSTANT)
    Q_PROPERTY(QString STR_DEVICE_IMAGE_ANALYZER                        READ STR_COMMAND_MEASURE_TEMP CONSTANT)

    Q_PROPERTY(QString STR_COMMAND_MEASURE_TEMP                         READ STR_COMMAND_MEASURE_TEMP CONSTANT)
    Q_PROPERTY(QString STR_COMMAND_DIAMETTER_HEIGHT                     READ STR_COMMAND_DIAMETTER_HEIGHT CONSTANT)
    Q_PROPERTY(QString STR_COMMAND_DIAMETTER_WEIGHT                     READ STR_COMMAND_DIAMETTER_WEIGHT CONSTANT)
    Q_PROPERTY(QString STR_COMMAND_MEASURE_BOOD_PRESSURE                READ STR_COMMAND_MEASURE_BOOD_PRESSURE CONSTANT)
    Q_PROPERTY(QString STR_COMMAND_MEASURE_ARECORD                      READ STR_COMMAND_MEASURE_ARECORD CONSTANT)



    QString STR_GENERAL_TIME()                                  {return "Time";}
    QString STR_GENERAL_TIME_ENG_FORMAT()                       {return "%MM %DD %YYYY";}
    QString STR_GENERAL_TIME_VIE_FORMAT()                       {return "%DD %MM %YYYY";}
    QString STR_GENERAL_BACK()                                  {return "Back";}
    QString STR_GENERAL_UNDEFINE()                              {return "Undefine";}

    QString STR_HOME_WEATHER_CELCIUS_DEGREE()                   {return "°C";}
    QString STR_HOME_WEATHER_FAHRENHEIT_DEGREE()                {return "°F";}
    QString STR_HOME_WEATHER_MAXTEMP_DIV_MINTEMP()              {return "@°/#°";}
    QString STR_HOME_WEATHER_DIRECTION()                        {return "Direction";}
    QString STR_HOME_WEATHER_EAST()                             {return "East";}
    QString STR_HOME_WEATHER_WEAST()                            {return "Weast";}
    QString STR_HOME_WEATHER_NORTH()                            {return "North";}
    QString STR_HOME_WEATHER_SOUTH()                            {return "South";}
    QString STR_HOME_WEATHER_SPEED()                            {return "Speed";}
    QString STR_HOME_WEATHER_KM_H()                             {return "km/h";}
    QString STR_HOME_WEATHER_DATA_WAS_UPDATE()                  {return "Data was updated at :";}
    QString STR_HOME_WEATHER_TIPS_TODAY()                       {return "Tips of today :";}
    QString STR_HOME_WEATHER_SHOW_MORE_DETAIL()                 {return "Show more detail...";}
    QString STR_HOME_DEVICE_CONNECTION()                        {return "Devices connection";}
    QString STR_HOME_GO_TO_DEVICE_SETTING()                     {return "Click to go to device setting >>";}
    QString STR_HOME_GO_TO_USER_DATA()                          {return "Click to go to user data >>";}
    QString STR_HOME_GO_TO_USER_SCHEDULE()                      {return "Click to go to your schedule >>";}

    QString STR_USER_DATA()                                     {return "User Data";}
    QString STR_USER_DATA_BLOOD_PRESSUER()                      {return "Blood pressure";}
    QString STR_USER_DATA_SEND_TO_DOCTOR()                      {return "Send data to Doctor";}
    QString STR_USER_DATA_YOUR_DATA()                           {return "Your data";}

    QString STR_USER_PROFILE_CHANGE_USER()                      {return "Change user";}

    QString STR_COMMAND_MEASURE_TEMP()                          {return "Measure temperature";}
    QString STR_COMMAND_DIAMETTER_HEIGHT()                      {return "Diametter your height";}
    QString STR_COMMAND_DIAMETTER_WEIGHT()                      {return "Diametter your weight";}
    QString STR_COMMAND_MEASURE_BOOD_PRESSURE()                 {return "Measure your blood pressure";}
    QString STR_COMMAND_MEASURE_ARECORD()                       {return "Make a full record";}

    QString STR_DEVICE_TEMPERATURE_MEASUREMENT()                {return "Temperature measurement";}
    QString STR_DEVICE_HEIGHT_DIAMETTER()                       {return "Height diametter";}
    QString STR_DEVICE_WEIGHT_DIAMETTER()                       {return "Weight diametter";}
    QString STR_DEVICE_BLOOD_PRESSUSER_DIAMETTER()              {return "Blood pressuer diametter";}
    QString STR_DEVICE_BLOOD_ANALYZER_DIAMETTER()               {return "Blood analyser";}
    QString STR_DEVICE_IMAGE_ANALYZER()                         {return "Image analyser";}

};
extern AppStringConst GLOBAL_StringConst;
#endif // AppStringConst_H
