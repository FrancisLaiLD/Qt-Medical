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
        NumberAnimation { target: parent; property: "x"; from: -1920; to: 0; duration: 500 }
        NumberAnimation { target: parent; property: "opacity"; from: 0.0 ;to: 1.0; duration: 500 }
    }

    Text {
        id: name
        anchors.centerIn: parent
        font.pixelSize: 60
        text: qsTr("Screen number 02")
    }
    MouseArea {
        id: idMainMouse
        anchors.fill: parent
        onClicked: {
            AppManager.handleHomeScreenClick(03)
        }
    }

    Component.onCompleted: {
        idMainAnimation.start()
    }
}
