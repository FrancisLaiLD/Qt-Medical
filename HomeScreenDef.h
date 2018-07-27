#ifndef HOMESCREENDEF_H
#define HOMESCREENDEF_H

#include <QObject>
#include <QMap>

#define TITLE_E_HOME_CHIEF_DOCTOR               "Chief Doctor"
#define TITLE_E_HOME_MY_DOCTOR                  "My Doctor"
#define TITLE_E_HOME_MY_NURSE                   "My Nurse"
#define TITLE_E_HOME_CURRENT_INFO               "Current Information"
#define TITLE_E_HOME_EXPERIMENT                 "Medical Schedule"
#define TITLE_E_HOME_24_HOURS                   "24/7 Service"
#define TITLE_E_HOME_DRUG_INJECTION             "Drug-injection"
#define TITLE_E_HOME_MOLE_CULE                  "Molecule"
#define TITLE_E_HOME_SLEEP                      "Sleep"
#define TITLE_E_HOME_WHEEL_CHAIR                "Wheelchair"

#define IMAGE_E_HOME_ICON_CHIEF_DOCTOR          "doctor_@.png"
#define IMAGE_E_HOME_ICON_MY_DOCTOR             "doctor-2_@.png"
#define IMAGE_E_HOME_ICON_MY_NURSE              "nurse-head_@.png"
#define IMAGE_E_HOME_ICON_CURRENT_INFO          "life_@.png"
#define IMAGE_E_HOME_ICON_EXPERIMENT            "medical-result_@.png"
#define IMAGE_E_HOME_ICON_24_HOURS              "24hours_@.png"
#define IMAGE_E_HOME_ICON_DRUG_INJECTION        "drug-injection_@.png"
#define IMAGE_E_HOME_ICON_MOLE_CULE             "molecule_@.png"
#define IMAGE_E_HOME_ICON_SLEEP                 "sleep_@.png"
#define IMAGE_E_HOME_ICON_WHEEL_CHAIR           "wheelchair_@.png"

#define SCREEN_EHOME_MAIN_DAILY                "Screen/EHome_Screen_Main_Daily.qml"
#define SCREEN_EHOME_USER_PROFILE              "Screen/EHome_Screen_Main_UserProfile.qml"
#define SCREEN_EHOME_MAIN_WEATHER              "Screen/EHome_Screen_Main_Weather.qml"
#define SCREEN_EHOME_MAIN_ADVANCED             "Screen/EHome_Screen_Main_Advanced.qml"
#define SCREEN_EHOME_MAIN_USER_DATA            "Screen/EHome_Screen_Main_UserData.qml"


typedef struct homeComp{
    QString s_label;
    QString s_imageLink;
} homeComponent;

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

enum class ENUM_HOME_EVENT {
    EVENT_GO_TO_HOME_SCREEN = 0,
    EVENT_GO_TO_BACK,
    EVENT_GO_TO_HOME_WEATHER,
    EVENT_GO_TO_HOME_ADVANCED,
    EVENT_GO_TO_USER_PROFILE,
    EVENT_GO_TO_USER_DATA
};
const QMap<int, homeComponent> TABLE_HOME_MODEL
{
    {static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_CHIEF_DOCTOR),             {TITLE_E_HOME_CHIEF_DOCTOR,                 IMAGE_E_HOME_ICON_CHIEF_DOCTOR}},
    {static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_MY_DOCTOR),                {TITLE_E_HOME_MY_DOCTOR,                    IMAGE_E_HOME_ICON_MY_DOCTOR}},
    {static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_MY_NURSE),                 {TITLE_E_HOME_MY_NURSE,                     IMAGE_E_HOME_ICON_MY_NURSE}},
    {static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_CURRENT_INFO),             {TITLE_E_HOME_CURRENT_INFO,                 IMAGE_E_HOME_ICON_CURRENT_INFO}},
    {static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_EXPERIMENT),               {TITLE_E_HOME_EXPERIMENT,                   IMAGE_E_HOME_ICON_EXPERIMENT}},
    {static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_24_HOURS),                 {TITLE_E_HOME_24_HOURS,                     IMAGE_E_HOME_ICON_24_HOURS}},
    {static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_DRUG_INJECTION),           {TITLE_E_HOME_DRUG_INJECTION,               IMAGE_E_HOME_ICON_DRUG_INJECTION}},
    {static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_MOLE_CULE),                {TITLE_E_HOME_MOLE_CULE,                    IMAGE_E_HOME_ICON_MOLE_CULE}},
    {static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_SLEEP),                    {TITLE_E_HOME_SLEEP,                        IMAGE_E_HOME_ICON_SLEEP}},
    {static_cast<int>(ENUM_HOME_MODEL::HOME_MENU_WHEEL_CHAIR),              {TITLE_E_HOME_WHEEL_CHAIR,                  IMAGE_E_HOME_ICON_WHEEL_CHAIR}}

};

Q_DECLARE_METATYPE(ENUM_HOME_MODEL)
#endif // HOMESCREENDEF_H
