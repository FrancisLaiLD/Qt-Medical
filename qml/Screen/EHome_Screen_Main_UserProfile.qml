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
        anchors.verticalCenter: parent.top
        anchors.verticalCenterOffset: 60
        font.pixelSize: 36
        text: qsTr("User profile management")
    }

    E_HorizentalLine {
        id: idMainLine
        anchors.centerIn: parent
        lineRange: parent.width - 60
        lineColor: "red"
    }

    Item {
        id: idAddMoreUser
        anchors.horizontalCenter: parent.horizontalCenter
        y: 540
        width: parent.width - 60
        height: 300
        Text {
            id: new_name_label
            text: qsTr("Your name : ")
        }

        EUserProfile_TextInput {
            id: new_name_val
            anchors.left: new_name_label.right
            anchors.leftMargin: 5
        }

    }



    Component.onCompleted: {
        idMainAnimation.start()
    }
}


