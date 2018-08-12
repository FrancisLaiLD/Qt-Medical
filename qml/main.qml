import QtQuick 2.9
import QtQuick.Window 2.2
import "Screen"
import "Component/ScreenComponent"
import Ehome 1.0

Window {
    visible: true
    width: 720
    height: 1280
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
    Image {
        id: _imgBackground
        source: "../resource/images/main_bg_19 (1).png"
        fillMode: Image.PreserveAspectCrop
        anchors.fill: parent
    }
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

    Loader {
        id: idContentLoader
//        width: 1800 ; height: 640
//        anchors.fill: parent
        x: 0 ; y: 60
        source: ""
//        Image {
//            id: idBackgroundImg
//            anchors.fill: parent
//            opacity: 0.5
//            visible: true
//            fillMode: Image.PreserveAspectCrop
//            source: "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/images/main_bg_25.jpg"
//        }
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
        idSttBarLoader.source = "Statusbar/EHome_Main_Statusbar.qml"
    }
}
