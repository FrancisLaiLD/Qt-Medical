import QtQuick 2.9
import QtQuick.Window 2.2
import "Screen"

Window {
    visible: true
    width: 1920
    height: 720
    title: qsTr("Medical Management")
    Rectangle {
        id: idRoot
        anchors.fill: parent
        color: "green"
        opacity: 0.3
        Image {
            id: idBackgroundImg
            anchors.fill: parent
            visible: false
            source: "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/images/background.jpg"
        }
    }
    Loader {
        id: loader1
        source: ""
    }
    Loader {
        id: loader2
        source: ""
    }

    Component.onCompleted:  {
        loader2.source = "Screen/Screen_Home_Menu.qml"
    }
}
