import QtQuick 2.0

import "../Component/ScreenComponent"
import "../Component/ListViewComponent"
import "../Component/DelegateComponent"
import "../Component/OtherComponent"

EHome_Main_Frame {
    id:root
    screenTitle: AppStringConst.STR_COMMAND_DIAMETTER_HEIGHT
    __titleMarginTop: 15
    ParallelAnimation {
        id: idMainAnimation
        running: false
        NumberAnimation { target: root; property: "x"; from: -720; to: 0; duration: AppValueConst.time_screen_trans }
        NumberAnimation { target: root; property: "opacity"; from: 0.0 ;to: 1.0; duration: AppValueConst.time_screen_trans }
    }

    Component.onCompleted: {
        // C++
        idMainAnimation.start()
        MEASURE_CONTROL.isHasMeasureResult = false
        MEASURE_CONTROL.isMeasuring = false
    }
    Component.onDestruction: {
        // remove Measure states
        MEASURE_CONTROL.isHasMeasureResult = false
        MEASURE_CONTROL.isMeasuring = false
        // stop all timer
    }
}


