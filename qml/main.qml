import QtQuick 2.9
import QtQuick.Window 2.2
import "Screen"
import "Component/ScreenComponent"
import com.embeddeduse.models 1.0

Window {
    visible: true
    width: 720
    height: 1080
    title: qsTr("All in your hand")

    function transtionScreen(newScreenLink) {
        idContentLoader.source = newScreenLink
        return true
    }

    function showPopup(popupLink) {
        idLoadPopup.source = popupLink
        return true
    }

    function hidePopup(popupLink) {
        idLoadPopup.source = ""
        return true
    }

//    function getBgSource() {
//        switch (AppManager.currentScreen) {
//        case HomeEnum.EVENT_GO_TO_HOME_SCREEN:
//            return "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/images/main_bg_weather.jpg"
//        case HomeEnum.EVENT_GO_TO_HOME_WEATHER:
//            return "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/images/main_bg_weather.jpg"
//        default:
//            return "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/images/main_bg_5.jpg"
//        }
//    }

//    Connections {
//        target: AppManager
//        onCurrentScreenChanged:
//            idBackgroundImg.source = getBgSource()
//    }

    Rectangle {
        id: idRoot
        anchors.fill: parent
        color: "transparent"
        opacity: 0.1
    }

    Loader {
        id: idSttBarLoader
        x: 0; y: 0
        width: parent.width
        height: 60
        source: ""
    }
    Rectangle {
        id: idLine
        color: "gray"
        width: parent.width - 60
        height: 1
        anchors.top: idSttBarLoader.bottom
        anchors.topMargin: 0
        anchors.horizontalCenter: idRoot.horizontalCenter
        opacity: 0.5
    }

    Loader {
        id: idContentLoader
//        width: 1800 ; height: 640
//        anchors.fill: parent
        x: 0 ; y: 60
        source: ""
        Image {
            id: idBackgroundImg
            anchors.fill: parent
            opacity: 0.5
            visible: true
            fillMode: Image.PreserveAspectCrop
            source: "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/images/main_bg_25.jpg"
        }
    }

    Rectangle {
        id: idBackground
        signal outsideClick()
        visible: AppManager.isShowingPopup
        width: 720 ; height: 1080
        color: "black"
        opacity: 0.6
        MouseArea {
            id: idMou
            anchors.fill: parent
            onClicked: {
                console.log('Popup outside click')
                AppManager.handleHidePopupClick(HomeEnum.EVENT_HIDE_POPUP)
            }
        }
    }

    Loader {
        id: idLoadPopup
//        anchors.fill: parent
        anchors.horizontalCenter: idBackground.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 200
    }

    Component.onCompleted:  {
        console.log('[qml] main.qml onComplete')
//        transtionScreen("Screen/EHome_Screen_Home_Menu.qml")
        idSttBarLoader.source = "Statusbar/EHome_Main_Statusbar.qml"
    }
}
