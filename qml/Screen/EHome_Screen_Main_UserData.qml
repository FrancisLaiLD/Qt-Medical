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
    screenTitle: "Screen Main User Data"
    backgroundImage: ""

    E_HorizentalLine {
        lineHeight: 1
        lineRange: parent.width - 60
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height/3
    }

    E_HorizentalLine {
        lineHeight: 1
        lineRange: parent.width - 60
        anchors.horizontalCenter: parent.horizontalCenter
        y: 2*parent.height/3
    }

    Component.onCompleted: {
        idMainAnimation.start()
    }
}


