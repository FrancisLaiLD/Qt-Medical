import QtQuick 2.0

import "../Component/ScreenComponent"
import "../Component/ListViewComponent"
import "../Component/DelegateComponent"
import "../Component/OtherComponent"
import Ehome 1.0
import CustomGeometry 1.0

EHome_Main_Frame {
    id: idRoot
    screenTitle: "Setting"
//    scrrenBgImg: "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/images/main_bg_6.jpg"
    ParallelAnimation {
        id: idMainAnimation
        running: false
        NumberAnimation { target: idRoot; property: "x"; from: -720; to: 0; duration: HomeScreenConst.time_screen_trans }
        NumberAnimation { target: idRoot; property: "opacity"; from: 0.0 ;to: 1.0; duration: HomeScreenConst.time_screen_trans }
    }
    ListView {
        id:lsvLeft
        anchors.top: parent.top
        anchors.topMargin: 50
        width: parent.width ; height: 50
        orientation: ListView.Horizontal
        model: SettingModel.listMenuName
        delegate: Item {
            id: rootDel
            width: 150 ; height: 50
            Rectangle {
                id: idDel
                width: 150 ; height: 50
                gradient:
                    Gradient {
                    GradientStop { position: 0.0; color: index === lsvLeft.currentIndex ? "A0A0A0" : "#606060" }
                    GradientStop { position: 1.0; color: "transparent" }
                }
                opacity: 1
                E_VerticalLine {
                    id: line
                    anchors.right: idDel.right
                    lineWidth: 1
                    lineColor: "gray"
                    lineRange: idDel.height - 10
                }
            }
            Text {
                id: idLabel
                anchors.centerIn: parent
                text: ""
                font.pixelSize: 14 ; font.italic: true
                color: index === lsvLeft.currentIndex ? "white" : "gray"
            }
            MouseArea {
                id: idMouDel
                anchors.fill: parent
                onClicked: {
                    lsvLeft.currentIndex = index
                }
            }
        }
    }
    Loader {
        id: settingContent
        width: parent.width ; height: 600
        anchors.top: lsvLeft.bottom
        anchors.topMargin: 10
        source: ""
    }

    Component.onCompleted: {
        idMainAnimation.start()
        lsvLeft.currentIndex = 1;
    }
}
