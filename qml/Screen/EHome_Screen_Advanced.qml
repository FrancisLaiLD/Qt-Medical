import QtQuick 2.0

import "../Component/ScreenComponent"
import "../Component/ListViewComponent"
import "../Component/DelegateComponent"
import "../Component/OtherComponent"

EHome_Main_Frame {
    id:root
    screenTitle: "Screen Main Advanced"
    ParallelAnimation {
        id: idMainAnimation
        running: false
        NumberAnimation { target: root; property: "x"; from: -720; to: 0; duration: AppValueConst.time_screen_trans }
        NumberAnimation { target: root; property: "opacity"; from: 0.0 ;to: 1.0; duration: AppValueConst.time_screen_trans }
    }


    Component.onCompleted: {
        idMainAnimation.start()
    }
}


