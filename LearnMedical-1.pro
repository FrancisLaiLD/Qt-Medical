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

SOURCES += \
        main.cpp \
    HomeComponent.cpp \
    AppManager.cpp \
    HomeScreenModel.cpp \
    HomeQMLController.cpp \
    HomeStringModel.cpp \
    HomeScreen_01_Model.cpp \
    HomeScreen_Enum.cpp \
    StatusbarModel.cpp

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
    qml/main.qml \
    qml/Component/ScreenComponent/EHome_Main_Frame.qml \
    qml/Component/DelegateComponent/EHome_GridviewDelegate.qml \
    qml/Component/ScreenComponent/EHome_StatusBar_Frame.qml \
    qml/Statusbar/EHome_Main_Statusbar.qml \
    qml/Component/ScreenComponent/EHome_Half_Frame.qml \
    qml/Screen/EHome_Screen_Main_Daily.qml \
    qml/Screen/EHome_Screen_User_Interface.qml \
    qml/Screen/EHome_Screen_Main_Weather.qml \
    qml/Screen/EHome_Screen_Main_Advanced.qml \
    qml/Screen/EHome_Screen_Main_UserProfile.qml \
    qml/Screen/EHome_Screen_Main_UserData.qml

HEADERS += \
    HomeComponent.h \
    AppManager.h \
    HomeScreenDef.h \
    HomeScreenModel.h \
    HomeQMLController.h \
    HomeStringModel.h \
    HomeScreen_01_Model.h \
    HomeScreen_Enum.h \
    StatusbarModel.h
