#ifndef RESOURCE_GENERAL_H
#define RESOURCE_GENERAL_H

#include    <QObject>

class Resource_General : public QObject
{
    Q_OBJECT
public:

    Resource_General(QObject *parent = nullptr, QString cPrefix = "")
    {
        Q_UNUSED(parent);
        Q_UNUSED(cPrefix);
        m_prefix = "file:///home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/icons/general/";
        m_prefixChart = "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/icons/chart/";
        m_prefixWeather = "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/images/weather/weather-1/";
        m_prefixHumanImgs = "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/images/human-images/";

    }
    virtual ~Resource_General() {}
    // define Q_PROPERTY
    Q_PROPERTY(QString ico_boy_1                    READ ico_boy_1                      CONSTANT)
    Q_PROPERTY(QString ico_boy_2                    READ ico_boy_2                      CONSTANT)
    Q_PROPERTY(QString ico_father_1                 READ ico_father_1                   CONSTANT)
    Q_PROPERTY(QString ico_father_2                 READ ico_father_2                   CONSTANT)
    Q_PROPERTY(QString ico_girl_1                   READ ico_girl_1                     CONSTANT)
    Q_PROPERTY(QString ico_grandfather_1            READ ico_grandfather_1              CONSTANT)
    Q_PROPERTY(QString ico_grandmother_1            READ ico_grandmother_1              CONSTANT)
    Q_PROPERTY(QString ico_kidboy_1                 READ ico_kidboy_1                   CONSTANT)
    Q_PROPERTY(QString ico_kidgirl_1                READ ico_kidgirl_1                  CONSTANT)
    Q_PROPERTY(QString ico_mother_1                 READ ico_mother_1                   CONSTANT)
    Q_PROPERTY(QString ico_mother_2                 READ ico_mother_2                   CONSTANT)
    Q_PROPERTY(QString rad_btn_check                READ rad_btn_check                  CONSTANT)
    Q_PROPERTY(QString rad_btn_uncheck              READ rad_btn_uncheck                CONSTANT)
    Q_PROPERTY(QString chart_ver_bottom             READ chart_ver_bottom               CONSTANT)
    Q_PROPERTY(QString chart_ver_middle             READ chart_ver_middle               CONSTANT)
    Q_PROPERTY(QString chart_ver_top                READ chart_ver_top                  CONSTANT)
    Q_PROPERTY(QString weather_shine_rainny         READ weather_shine_rainny           CONSTANT)
    Q_PROPERTY(QString weather_wind_velocity        READ weather_wind_velocity          CONSTANT)
    Q_PROPERTY(QString home_location                READ home_location                  CONSTANT)
    Q_PROPERTY(QString celsius_degrees_n            READ celsius_degrees_n              CONSTANT)
    Q_PROPERTY(QString celsius_degrees_p            READ celsius_degrees_p              CONSTANT)
    Q_PROPERTY(QString celsius_degrees_d            READ celsius_degrees_d              CONSTANT)
    Q_PROPERTY(QString fahrenheit_degrees_n         READ celsius_degrees_n              CONSTANT)
    Q_PROPERTY(QString fahrenheit_degrees_p         READ celsius_degrees_p              CONSTANT)
    Q_PROPERTY(QString fahrenheit_degrees_d         READ celsius_degrees_d              CONSTANT)
    Q_PROPERTY(QString weather_cloud                READ weather_cloud                  CONSTANT)
    Q_PROPERTY(QString weather_cloudy_wind          READ weather_cloudy_wind            CONSTANT)
    Q_PROPERTY(QString weather_night_cloudy         READ weather_night_cloudy           CONSTANT)
    Q_PROPERTY(QString weather_night_rain           READ weather_night_rain             CONSTANT)
    Q_PROPERTY(QString weather_rain                 READ weather_rain                   CONSTANT)
    Q_PROPERTY(QString weather_rain_storm           READ weather_rain_storm             CONSTANT)
    Q_PROPERTY(QString weather_rain_sunny           READ weather_rain_sunny             CONSTANT)
    Q_PROPERTY(QString weather_shine_cloudy         READ weather_shine_cloudy           CONSTANT)
    Q_PROPERTY(QString weather_snow                 READ weather_snow                   CONSTANT)
    Q_PROPERTY(QString weather_storm                READ weather_storm                  CONSTANT)
    Q_PROPERTY(QString weather_shine_big            READ weather_shine_big              CONSTANT)
    Q_PROPERTY(QString weather_shine_windy          READ weather_shine_windy            CONSTANT)
    Q_PROPERTY(QString btn_state_on                 READ btn_state_on                   CONSTANT)
    Q_PROPERTY(QString btn_state_off                READ btn_state_off                  CONSTANT)
    Q_PROPERTY(QString ico_checkbox_check           READ ico_checkbox_check             CONSTANT)
    Q_PROPERTY(QString ico_checkbox_uncheck         READ ico_checkbox_uncheck           CONSTANT)
    Q_PROPERTY(QString ico_edit_16_red              READ ico_edit_16_red                CONSTANT)
    Q_PROPERTY(QString ico_edit_16_gray             READ ico_edit_16_gray               CONSTANT)
    Q_PROPERTY(QString ico_loading                  READ ico_loading                    CONSTANT)
    Q_PROPERTY(QString ico_info_64                  READ ico_info_64                    CONSTANT)
    Q_PROPERTY(QString ico_error_64                 READ ico_error_64                   CONSTANT)
    Q_PROPERTY(QString ico_right_arrow_n            READ ico_right_arrow_n              CONSTANT)
    Q_PROPERTY(QString ico_right_arrow_p            READ ico_right_arrow_p              CONSTANT)
    Q_PROPERTY(QString ico_right_arrow_d            READ ico_right_arrow_d              CONSTANT)

    Q_PROPERTY(QString human_overview               READ human_overview                 CONSTANT)


    /*
                                define QString return function                                      */
    QString ico_boy_1()                 {return m_prefix + "ico_boy_1.png";}
    QString ico_boy_2()                 {return m_prefix + "ico_boy_2.png";}
    QString ico_father_1()              {return m_prefix + "ico_father_1.png";}
    QString ico_father_2()              {return m_prefix + "ico_father_2.png";}
    QString ico_girl_1()                {return m_prefix + "ico_girl_1.png";}
    QString ico_grandfather_1()         {return m_prefix + "ico_grandfather_1.png";}
    QString ico_grandmother_1()         {return m_prefix + "ico_grandmother_1.png";}
    QString ico_kidboy_1()              {return m_prefix + "ico_kidboy_1.png";}
    QString ico_kidgirl_1()             {return m_prefix + "ico_kidgirl_1.png";}
    QString ico_mother_1()              {return m_prefix + "ico_mother_1.png";}
    QString ico_mother_2()              {return m_prefix + "ico_mother_2.png";}
    QString rad_btn_check()             {return m_prefix + "rad-btn-check.png";}
    QString rad_btn_uncheck()           {return m_prefix + "rad-btn-uncheck.png";}
    QString celsius_degrees_n()         {return m_prefix + "celsius_degrees_n.png";}
    QString celsius_degrees_p()         {return m_prefix + "celsius_degrees_p.png";}
    QString celsius_degrees_d()         {return m_prefix + "celsius_degrees_d.png";}
    QString fahrenheit_degrees_n()      {return m_prefix + "fahrenheit_degrees_n.png";}
    QString fahrenheit_degrees_p()      {return m_prefix + "fahrenheit_degrees_p.png";}
    QString fahrenheit_degrees_d()      {return m_prefix + "fahrenheit_degrees_d.png";}
    QString home_location()             {return m_prefix + "home_location.png";}
    QString btn_state_on()              {return m_prefix + "btn_state_on.png";}
    QString btn_state_off()             {return m_prefix + "btn_state_off.png";}
    QString ico_checkbox_check()        {return m_prefix + "ico_checkbox_check.png";}
    QString ico_checkbox_uncheck()      {return m_prefix + "ico_checkbox_uncheck.png";}
    QString ico_edit_16_red()           {return m_prefix + "ico_edit_16_red.png";}
    QString ico_edit_16_gray()          {return m_prefix + "ico_edit_16_gray.png";}
    QString ico_loading()               {return m_prefix + "ico_loading.gif";}
    QString ico_error_64()              {return m_prefix + "ico_error_64.png";}
    QString ico_info_64()               {return m_prefix + "ico_info_64.png";}
    QString ico_right_arrow_n()         {return m_prefix + "ico_right_arrow_n.png";}
    QString ico_right_arrow_p()         {return m_prefix + "ico_right_arrow_p.png";}
    QString ico_right_arrow_d()         {return m_prefix + "ico_right_arrow_d.png";}

    QString chart_ver_bottom()          {return m_prefixChart + "chart_ver_bottom.png";}
    QString chart_ver_middle()          {return m_prefixChart + "chart_ver_middle.png";}
    QString chart_ver_top()             {return m_prefixChart + "chart_ver_top.png";}
    QString weather_shine_rainny()      {return m_prefixWeather + "shine-rainny.png";}
    QString weather_wind_velocity()     {return m_prefixWeather + "wind-velocity.png";}


    QString weather_cloud()             {return m_prefixWeather + "weather_cloud.png";}
    QString weather_cloudy_wind ()      {return m_prefixWeather + "weather_cloudy_wind.png";}
    QString weather_night_cloudy()      {return m_prefixWeather + "weather_night_cloudy.png";}
    QString weather_night_rain()        {return m_prefixWeather + "weather_night_rain.png";}
    QString weather_rain()              {return m_prefixWeather + "weather_rain.png";}
    QString weather_rain_storm()        {return m_prefixWeather + "weather_rain_storm.png";}
    QString weather_rain_sunny()        {return m_prefixWeather + "weather_rain_sunny.png";}
    QString weather_shine_cloudy()      {return m_prefixWeather + "weather_shine_cloudy.png";}
    QString weather_snow()              {return m_prefixWeather + "weather_snow.png";}
    QString weather_storm()             {return m_prefixWeather + "weather_storm.png";}
    QString weather_shine_big()         {return m_prefixWeather + "weather_shine_big.png";}
    QString weather_shine_windy()       {return m_prefixWeather + "weather_shine_windy.png";}

    QString human_overview()            {return m_prefixHumanImgs + "human_overview.jpg";}


private:
    QString m_prefix;
    QString m_prefixChart;
    QString m_prefixWeather;
    QString m_prefixHumanImgs;
};

#endif // RESOURCE_GENERAL_H
