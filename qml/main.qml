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

    Rectangle {
        id: idRoot
        anchors.fill: parent
        color: "transparent"
        opacity: 0.3
        Image {
            id: idBackgroundImg
            anchors.fill: parent
            visible: true
            source: "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/images/Background_720x1280.jpg"
        }
    }
    Loader {
        id: idSttBarLoader
        x: 0; y: 0
        width: parent.width
        height: 55
        source: ""
    }
    Rectangle {
        id: idLine
        color: "green"
        width: parent.width - 60
        height: 1
        anchors.top: idSttBarLoader.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: idRoot.horizontalCenter
        opacity: 0.5
    }

    Loader {
        id: idContentLoader
//        width: 1800 ; height: 640
//        anchors.fill: parent
        x: 0 ; y: 60
        source: ""
    }

    Component.onCompleted:  {
        console.log('[qml] main.qml onComplete')
//        transtionScreen("Screen/EHome_Screen_Home_Menu.qml")
        idSttBarLoader.source = "Statusbar/EHome_Main_Statusbar.qml"
    }
}
