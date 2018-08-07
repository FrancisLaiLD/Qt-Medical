import QtQuick 2.0

import "../Component/ScreenComponent"
import "../Component/ListViewComponent"
import "../Component/DelegateComponent"
import "../Component/OtherComponent"
import "../Component/SettingComponent"
import Ehome 1.0
import CustomGeometry 1.0

EHome_Main_Frame {
    id: _root
    screenTitle: "Setting"
//    scrrenBgImg: "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/images/main_bg_6.jpg"
    property string currentQmlSetting: ""
    ParallelAnimation {
        id: idMainAnimation
        running: false
        NumberAnimation { target: _root; property: "x"; from: -720; to: 0; duration: HomeScreenConst.time_screen_trans }
        NumberAnimation { target: _root; property: "opacity"; from: 0.0 ;to: 1.0; duration: HomeScreenConst.time_screen_trans }
    }
    ListView {
        id:_lsvLeft
        anchors.top: parent.top
        anchors.topMargin: 50
        width: parent.width ; height: 50
        orientation: ListView.Horizontal
        snapMode: ListView.SnapToItem
        model: SettingModel
        delegate: Item {
            id: rootDel
            width: _lsvLeft.width/5 ; height: 50
            Rectangle {
                id: idDel
                width: parent.width ; height: parent.height
                gradient:
                    Gradient {
                    GradientStop { position: 0.0; color: index === _lsvLeft.currentIndex ? "#606060" : "#A0A0A0" }
                    GradientStop { position: 1.0; color: "transparent" }
                }
                opacity: 1
                E_VerticalLine {
                    id: line
                    anchors.right: idDel.right
                    lineWidth: 1
                    lineColor: HomeScreenConst.line_normal_color
                    lineRange: idDel.height - 10
                }
            }
            Text {
                id: idLabel
                anchors.centerIn: parent
                text: proName
                font.pixelSize: 14 ; font.italic: true
                color: index === _lsvLeft.currentIndex ? "white" : HomeScreenConst.line_normal_color
            }
            MouseArea {
                id: idMouDel
                anchors.fill: parent
                onClicked: {
                    SettingModel.curInx = index
                    _lsvLeft.currentIndex = index
                    _root.currentQmlSetting = proQml
                }
            }
            Component.onCompleted: {
                if (SettingModel.curInx === index)
                    _root.currentQmlSetting = proQml
            }
        }
    }
    Loader {
        id: _settingContent
        width: 660 ; height: 800
        anchors.top: _lsvLeft.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        source: _root.currentQmlSetting
    }

    Component.onCompleted: {
        idMainAnimation.start()
        _lsvLeft.currentIndex = SettingModel.curInx
    }
}
