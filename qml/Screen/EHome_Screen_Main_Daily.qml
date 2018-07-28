import QtQuick 2.0

import "../Component/ScreenComponent"
import "../Component/ListViewComponent"
import "../Component/DelegateComponent"
import "../Component/OtherComponent"
import com.embeddeduse.models 1.0

EHome_Main_Frame {
    id:idRoot

    ParallelAnimation {
        id: idMainAnimation
        running: false
        NumberAnimation { target: idRoot; property: "x"; from: -720; to: 0; duration: 500 }
        NumberAnimation { target: idRoot; property: "opacity"; from: 0.0 ;to: 1.0; duration: 500 }
    }

    EHome_Half_Frame {
        id: idAboveFrame
        x: 0; y: 0
//        mainColor: "#6A8CDA"
        Text {
            id: idTitleWeather
            anchors.horizontalCenter: idAboveFrame.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            text: qsTr("Show more detail...")
            font.italic: true
            font.pixelSize: 20
            color: idMouDetailWea.pressed ? "#B3B712" : "green"
            MouseArea {
                id: idMouDetailWea
                anchors.fill: parent
                onClicked: {
                    AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_HOME_WEATHER)
                }
            }
        }
        E_VerticalLine {
            id:idVerLine
            y: 30
            anchors.horizontalCenter: parent.horizontalCenter
            lineColor: "gray"
            lineRange: parent.height - 80
        }

        onRelease: {

        }
    }

    E_HorizentalLine {
        id: idLineCenter
        lineRange: parent.width - 60
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    EHome_Half_Frame {
        id: idUnderFrame
        x: 0; y:510
//        mainColor: "#EDDC8F"
        Text {
            id: idTitleAdvanced
            anchors.horizontalCenter: idUnderFrame.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            text: qsTr("Show more detail...")
            font.italic: true
            font.pixelSize: 20
            color: idMouDetailAdv.pressed ? "#B3B712" : "green"
            MouseArea {
                id: idMouDetailAdv
                anchors.fill: parent
                onClicked: {
                    AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_HOME_ADVANCED)
                }
            }
        }

        onRelease: {

        }
    }


    Component.onCompleted: {
        idMainAnimation.start()
    }
}
