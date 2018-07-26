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
        onStopped: idMainTimer.start()
    }

    Rectangle {
        id:idMainRect
        anchors.centerIn: parent
        width: HomeModel01.circleSize ; height: HomeModel01.circleSize
        radius: HomeModel01.circleSize
        color: "red"
        opacity: 0.5
    }

    Timer {
        id: idMainTimer
        running: false
        onTriggered: {
            HomeModel01.circleSize += 5;
            if (HomeModel01.circleSize === parent.height)
                HomeModel01.circleSize = 0
        }
        interval: 10
        repeat: true
    }

    Text {
        id: name
        anchors.centerIn: parent
        font.pixelSize: 60
        text: qsTr("Screen number 01")
    }
    MouseArea {
        id: idMainMouse
        anchors.fill: parent
        onClicked: {
            AppManager.handleHomeScreenClick(02)
        }
    }

    Component.onCompleted: {
        idMainAnimation.start()
    }
}
