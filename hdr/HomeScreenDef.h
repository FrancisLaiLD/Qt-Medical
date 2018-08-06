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

// Define screen
#define QML_NONE                                ""
#define SCREEN_EHOME_MAIN_DAILY                 "Screen/EHome_Screen_Main_Daily.qml"
#define SCREEN_EHOME_USER_PROFILE               "Screen/EHome_Screen_UserProfile.qml"
#define SCREEN_EHOME_MAIN_WEATHER               "Screen/EHome_Screen_Weather.qml"
#define SCREEN_EHOME_MAIN_ADVANCED              "Screen/EHome_Screen_Advanced.qml"
#define SCREEN_EHOME_MAIN_USER_DATA             "Screen/EHome_Screen_UserData_Stored.qml"
#define SCREEN_EHOME_USER_DATA_REALTIME         "Screen/EHome_Screen_UserData_RealTime.qml"
#define SCREEN_EHOME_TECHNICAL_OVERVIEW         "Screen/EHome_Screen_Teachnical_Overview.qml"
#define SCREEN_EHOME_SETTING                    "Screen/EHome_Screen_Setting.qml"


#define POPUP_EHOME_MAIN_USER_POPUP             "Popup/EHome_Popup_UserProfile.qml"
#define POPUP_EHOME_NO_CONNECTION               "Popup/Small_Popup.qml"





typedef struct homeComp{
    QString s_label;
    QString s_imageLink;
} homeComponent;

typedef struct QMLStruct{
    int         s_INDX_SCREEN;
    QString     s_QmlLink;
} QMLSTRUCT;



#endif // HOMESCREENDEF_H
