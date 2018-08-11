QT += quick
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
HEADERS += \
    src/AppManager.h \
    src/HomeQMLController.h \
    src/Component/DeviceComponent.h \
    src/Component/HomeComponent.h \
    src/Component/UserProfileComponent.h \
    src/Component/WeatherComponent.h \
    src/model/HomeListDeviceModel.h \
    src/model/HomeScreenMainDailyModel.h \
    src/model/HomeWeatherModel.h \
    src/model/SettingModel.h \
    src/model/StatusbarModel.h \
    src/model/UserProfileModel.h \
    src/Common/Home_Screen_Table.h \
    src/Common/HomeScreenConst.h \
    src/Common/HomeScreenDef.h \
    src/Common/Resource_General.h \
    src/Common/Resource_Statusbar.h \
    src/Common/ResourceManager.h \
    src/Common/SettingScreenDef.h \
    src/Common/HomeScreen_Enum.h \
    src/Worker/Worker_Time_Management.h \
    src/Common/DeviceDef.h \
    src/Common/AppStringConst.h
    src/Worker/Worker_Time_Management.h \


SOURCES += \
    src/AppManager.cpp \
    src/Ehome_Main.cpp \
    src/HomeQMLController.cpp \
    src/Component/DeviceComponent.cpp \
    src/Component/HomeComponent.cpp \
    src/Component/UserProfileComponent.cpp \
    src/Component/WeatherComponent.cpp \
    src/model/HomeListDeviceModel.cpp \
    src/model/HomeScreenMainDailyModel.cpp \
    src/model/HomeWeatherModel.cpp \
    src/model/SettingModel.cpp \
    src/model/StatusbarModel.cpp \
    src/model/UserProfileModel.cpp \
    src/Worker/Worker_Time_Management.cpp


RESOURCES +=

unix:MOC_DIR = ../build-Medical-1/moc_files
unix:OBJECTS_DIR = ../build-Medical-1/obj_files

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    qml/main.qml \
    qml/Component/ScreenComponent/EHome_Main_Frame.qml \
    qml/Component/DelegateComponent/EHome_GridviewDelegate.qml \
    qml/Component/ScreenComponent/EHome_StatusBar_Frame.qml \
    qml/Statusbar/EHome_Main_Statusbar.qml \
    qml/Component/ScreenComponent/EHome_Half_Frame.qml \
    qml/Screen/EHome_Screen_Main_Daily.qml \
    qml/Component/OtherComponent/E_HorizentalLine.qml \
    qml/Component/OtherComponent/E_VerticalLine.qml \
    qml/Component/OtherComponent/EUserProfile_TextInput.qml \
    qml/Popup/Small_Popup.qml \
    qml/Popup/Medium_Popup.qml \
    qml/Popup/Huge_Popup.qml \
    qml/Component/OtherComponent/EHome_Popup_Frame.qml \
    qml/Component/OtherComponent/EButton_StandAlone.qml \
    qml/Component/OtherComponent/ERadio_Button.qml \
    qml/Component/OtherComponent/EChart_Weather.qml \
    qml/Component/OtherComponent/EXAxisLine.qml \
    qml/Component/OtherComponent/EYAxisLine.qml \
    qml/Screen/EHome_Screen_UserData_RealTime.qml \
    qml/Screen/EHome_Screen_UserData_Stored.qml \
    qml/Screen/EHome_Screen_Advanced.qml \
    qml/Screen/EHome_Screen_UserProfile.qml \
    qml/Screen/EHome_Screen_Weather.qml \
    qml/Screen/EHome_Screen_Teachnical_Overview.qml \
    qml/Component/OtherComponent/Huge_Popup.qml \
    qml/Component/OtherComponent/Small_Popup.qml \
    qml/Component/OtherComponent/Medium_Popup.qml \
    qml/Popup/EHome_Popup_UserProfile.qml \
    qml/Component/OtherComponent/EButton_Combobox.qml \
    qml/Screen/EHome_Screen_Setting.qml \
    qml/Component/SettingComponent/ESetting_General.qml \
    qml/Component/SettingComponent/ESetting_UserProfile.qml \
    qml/Component/SettingComponent/ESetting_Device_Management.qml \
    qml/Component/SettingComponent/ESetting_Network.qml \
    qml/Popup/EHome_Popup_NoConnection.qml \
    qml/Component/OtherComponent/EButton_Text.qml \
    qml/Component/OtherComponent/EButton_Image.qml \
    qml/Component/SettingComponent/ESetting_Display.qml \
    qml/Component/SettingComponent/ESetting_Sound.qml

