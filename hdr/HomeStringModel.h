#ifndef HOMESTRINGMODEL_H
#define HOMESTRINGMODEL_H

#include <QObject>

class HomeStringModel : public QObject
{
    Q_OBJECT
public:
    explicit HomeStringModel(QObject *parent = nullptr);
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


    QString STR_HOME_WEATHER_CELCIUS_DEGREE()           {return "°C";}
    QString STR_HOME_WEATHER_FAHRENHEIT_DEGREE()        {return "°F";}
    QString STR_HOME_WEATHER_MAXTEMP_DIV_MINTEMP()      {return "@°/#°";}
    QString STR_HOME_WEATHER_DIRECTION()                {return "Direction";}
    QString STR_HOME_WEATHER_EAST()                     {return "East";}
    QString STR_HOME_WEATHER_WEAST()                    {return "Weast";}
    QString STR_HOME_WEATHER_NORTH()                    {return "North";}
    QString STR_HOME_WEATHER_SOUTH()                    {return "South";}
    QString STR_HOME_WEATHER_SPEED()                    {return "Speed";}
    QString STR_HOME_WEATHER_KM_H()                     {return "km/h";}
    QString STR_HOME_WEATHER_DATA_WAS_UPDATE()          {return "Data was updated at :";}
    QString STR_HOME_WEATHER_TIPS_TODAY()               {return "Tips of today :";}
    QString STR_HOME_WEATHER_SHOW_MORE_DETAIL()         {return "Show more detail...";}

};

#endif // HOMESTRINGMODEL_H
