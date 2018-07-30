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
        NumberAnimation { target: root; property: "x"; from: -720; to: 0; duration: 500 }
        NumberAnimation { target: root; property: "opacity"; from: 0.0 ;to: 1.0; duration: 500 }
    }

    Text {
        id: name
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        font.pixelSize: 36
        text: qsTr("Screen User Data in detail")
    }


    Component.onCompleted: {
        idMainAnimation.start()
    }
}


