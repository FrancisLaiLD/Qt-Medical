import QtQuick 2.9
import QtQuick.Window 2.2
import "Screen"
import "Component/ScreenComponent"

Window {
    visible: true
    width: 1920
    height: 720
    title: qsTr("MEDICAL")

    function transtionScreen(newScreenLink) {
        idContentLoader.source = newScreenLink
        return true
    }

    Rectangle {
        id: idRoot
        anchors.fill: parent
        color: "green"
        opacity: 0.3
        Image {
            id: idBackgroundImg
            anchors.fill: parent
            visible: true
            source: "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/images/background.jpg"
        }
    }
    Loader {
        id: idSttBarLoader
        x: 0; y: 0
        source: ""
    }
    Loader {
        id: idContentLoader
        width: 1800 ; height: 640
        x: 0 ; y: 80
        source: ""
    }

    Component.onCompleted:  {
        console.log('[qml] main.qml onComplete')
//        transtionScreen("Screen/EHome_Screen_Home_Menu.qml")
        idSttBarLoader.source = "Statusbar/EHome_Main_Statusbar.qml"
    }
}
