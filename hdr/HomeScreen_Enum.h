#ifndef HOMESCREEN_ENUM_H
#define HOMESCREEN_ENUM_H

#include <QObject>
class HomeScreen_Enum : public QObject
{
    Q_OBJECT

public:
    explicit HomeScreen_Enum(QObject *parent = nullptr)
    {
        Q_UNUSED(parent);
    }

    enum class ENUM_HOME_MODEL {
        HOME_MENU_CHIEF_DOCTOR = 0,
        HOME_MENU_MY_DOCTOR,
        HOME_MENU_MY_NURSE,
        HOME_MENU_CURRENT_INFO,
        HOME_MENU_EXPERIMENT,
        HOME_MENU_24_HOURS,
        HOME_MENU_DRUG_INJECTION,
        HOME_MENU_MOLE_CULE,
        HOME_MENU_SLEEP,
        HOME_MENU_WHEEL_CHAIR
    };

    // define ENUM_EVENTS
    enum class ENUM_HOME_EVENT {
        EVENT_GO_TO_HOME_SCREEN = 0,
        EVENT_GO_TO_BACK,
        EVENT_GO_TO_HOME_WEATHER,
        EVENT_GO_TO_HOME_ADVANCED,
        EVENT_GO_TO_USER_PROFILE,
        EVENT_GO_TO_USER_DATA,

        EVENT_MAX = 65536
    };

    enum class ENUM_POPUP_EVENT {
        EVENT_SHOW_POPUP = 0,
        EVENT_SHOW_POPUP_USER_PROFILE,

        EVENT_HIDE_POPUP = 65536
    };
    enum class ENUM_STATUSBAR_NETWORK_STRENGTH {
        STATUSBAR_NETWORK_NO_NETWORK = 0,
        STATUSBAR_NETWORK_VERY_WEAK,
        STATUSBAR_NETWORK_WEAK,
        STATUSBAR_NETWORK_NORMAL,
        STATUSBAR_NETWORK_GOOD,
        STATUSBAR_NETWORK_EXCELLENT
    };
    Q_ENUM(ENUM_HOME_MODEL)
    Q_ENUM(ENUM_HOME_EVENT)
    Q_ENUM(ENUM_POPUP_EVENT)
    Q_ENUM(ENUM_STATUSBAR_NETWORK_STRENGTH)



signals:

public slots:
};


#endif // HOMESCREEN_ENUM_H
