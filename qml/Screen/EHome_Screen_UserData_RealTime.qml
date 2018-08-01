import QtQuick 2.0

import "../Component/ScreenComponent"
import "../Component/ListViewComponent"
import "../Component/DelegateComponent"
import "../Component/OtherComponent"

EHome_Main_Frame {
    id:root
    ParallelAnimation {
        id: idMainAnimation
        running: false
        NumberAnimation { target: root; property: "x"; from: -720; to: 0; duration: HomeScreenConst.time_screen_trans }
        NumberAnimation { target: root; property: "opacity"; from: 0.0 ;to: 1.0; duration: HomeScreenConst.time_screen_trans }
    }
    screenTitle: "User Data"
    backgroundImage: ""

    EChart_Weather {
        id: idTempChart
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        chartWidth: parent.width - 60
        chartHeight: parent.height/2 - 60
    }

    E_HorizentalLine {
        id: idFirstLine
        y: parent.height/2
        anchors.horizontalCenter: parent.horizontalCenter
        lineHeight: 1
        lineRange: parent.width - 60
    }

    EChart_Weather {
        id: idDryChart
        anchors.top: idFirstLine.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        chartWidth: parent.width - 60
        chartHeight: parent.height/2 - 60
    }

    Component.onCompleted: {
        idMainAnimation.start()
    }
}


