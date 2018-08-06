import QtQuick 2.0

import "../Component/ScreenComponent"
import "../Component/ListViewComponent"
import "../Component/DelegateComponent"
import "../Component/OtherComponent"
import Ehome 1.0
import CustomGeometry 1.0

EHome_Main_Frame {
    id: idRoot
    screenTitle: "Technical Overview"
//    scrrenBgImg: "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/images/main_bg_6.jpg"
    ParallelAnimation {
        id: idMainAnimation
        running: false
        NumberAnimation { target: idRoot; property: "x"; from: -720; to: 0; duration: HomeScreenConst.time_screen_trans }
        NumberAnimation { target: idRoot; property: "opacity"; from: 0.0 ;to: 1.0; duration: HomeScreenConst.time_screen_trans }
    }

    Component.onCompleted: {
        idMainAnimation.start()
    }
}
