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
        NumberAnimation { target: idRoot; property: "x"; from: -720; to: 0; duration: HomeScreenConst.time_screen_trans }
        NumberAnimation { target: idRoot; property: "opacity"; from: 0.0 ;to: 1.0; duration: HomeScreenConst.time_screen_trans }
    }

    EHome_Half_Frame {
        id: idAboveFrame
        x: 0; y: 0
        //        mainColor: "#6A8CDA"
        Item {
            id: leftSide
            x: 0
            width: parent.width/2
            height: parent.height
            Text {
                id: idLocation
                text: "Location :"
                font.pixelSize: 22
                anchors.top: parent.top
                anchors.topMargin: 250
                anchors.right: parent.right
                anchors.rightMargin: 200
            }
            Text {
                id: idLocation_val
                text: HomeDailyModel.listWeather[0].proLocName
                font.pixelSize: 22
                anchors.left: idLocation.right
                anchors.leftMargin: 5
                anchors.verticalCenter: idLocation.verticalCenter
            }

            Text {
                id: idTemp
                anchors.right: idLocation.right
                anchors.verticalCenter: idLocation.verticalCenter
                anchors.verticalCenterOffset: 40
                text: qsTr("Temperature :")
                font.pixelSize: 22
            }
            Text {
                id: idTemp_val
                text: HomeDailyModel.listWeather[0].proTemp
                font.pixelSize: 22
                anchors.left: idTemp.right
                anchors.leftMargin: 5
                anchors.verticalCenter: idTemp.verticalCenter
            }

            Text {
                id: idWindVel
                anchors.right: idLocation.right
                anchors.verticalCenter: idTemp.verticalCenter
                anchors.verticalCenterOffset: 40
                text: qsTr("Wind Velocity :")
                font.pixelSize: 22
            }

            Text {
                id: idDry
                anchors.right: idLocation.right
                anchors.verticalCenter: idWindVel.verticalCenter
                anchors.verticalCenterOffset: 40
                text: qsTr("Dry :")
                font.pixelSize: 22
            }

        }

        Item {
            id: righSide
            x: 360
            width: parent.width/2
            height: parent.height
            Text {
                id: idRightLocation
                text: qsTr("Location :" + HomeDailyModel.listWeather )
                font.pixelSize: 22
                anchors.top: parent.top
                anchors.topMargin: 250
                anchors.right: parent.right
                anchors.rightMargin: 200
            }

            Text {
                id: idRightTemp
                anchors.right: idRightLocation.right
                anchors.verticalCenter: idRightLocation.verticalCenter
                anchors.verticalCenterOffset: 40
                text: ("Temperature :")
                color: "black"
                font.pixelSize: 22
            }

            Text {
                id: idRightWindVel
                anchors.right: idRightLocation.right
                anchors.verticalCenter: idRightTemp.verticalCenter
                anchors.verticalCenterOffset: 40
                text: qsTr("Wind Velocity :")
                font.pixelSize: 22
            }

            Text {
                id: idRightDry
                anchors.right: idRightLocation.right
                anchors.verticalCenter: idRightWindVel.verticalCenter
                anchors.verticalCenterOffset: 40
                text: qsTr("Dry :")
                font.pixelSize: 22
            }

        }

        Text {
            id: idShowDetail
            anchors.horizontalCenter: idAboveFrame.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            text: qsTr("Show more detail...")
            font.italic: true
            font.pixelSize: 20
            color: idMouDetailWea.pressed ? "#B3B712" : "green"
            opacity: 0.5
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
            id: idTitleTips
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 30
            text: "Tips of today :"
            font.italic: true
            font.pixelSize: 20
            color: "black"
            font.underline: true
        }

        Text {
            id: idTitleAdvanced
            anchors.horizontalCenter: idUnderFrame.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            text: qsTr("Show more detail...")
            font.italic: true
            font.pixelSize: 20
            color: idMouDetailAdv.pressed ? "#B3B712" : "green"
            opacity: 0.5
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
