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
    hdr/WeatherComponent.h \
    hdr/AppManager.h \
    hdr/HomeComponent.h \
    hdr/HomeQMLController.h \
    hdr/HomeScreen_Enum.h \
    hdr/HomeScreenDef.h \
    hdr/HomeStringModel.h \
    hdr/HomeWeatherModel.h \
    hdr/StatusbarModel.h \
    hdr/WeatherComponent.h \
    hdr/UserProfileComponent.h \
    hdr/UserProfileModel.h \
    hdr/ResourceManager.h \
    hdr/Resource_Statusbar.h \
    hdr/Resource_General.h \
    hdr/HomeScreenMainDailyModel.h \
    hdr/Home_Screen_Table.h \
    hdr/HomeScreenConst.h \
    hdr/BezierCurve.h \
    hdr/Component/HomeComponent.h \
    hdr/Component/UserProfileComponent.h \
    hdr/Component/WeatherComponent.h \
    hdr/Component/DeviceComponent.h

SOURCES += \
        main.cpp \
    src/AppManager.cpp \
    src/HomeComponent.cpp \
    src/HomeQMLController.cpp \
    src/HomeScreen_Enum.cpp \
    src/HomeWeatherModel.cpp \
    src/StatusbarModel.cpp \
    src/WeatherComponent.cpp \
    src/UserProfileComponent.cpp \
    src/UserProfileModel.cpp \
    src/HomeScreenMainDailyModel.cpp \
    src/BezierCurve.cpp \
    src/DeviceComponent.cpp

RESOURCES +=

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
    qml/Screen/EHome_Screen_Teachnical_Overview.qml

