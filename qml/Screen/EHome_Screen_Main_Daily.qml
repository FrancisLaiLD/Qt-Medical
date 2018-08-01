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

        Item {
            id: leftSide
            x: 0
            width: parent.width/2
            height: parent.height
            MouseArea {
                id: idMouDetailWea
                anchors.fill: parent
                onClicked: {
                    AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_HOME_WEATHER)
                }
            }
            Text {
                id: idLocation_val
                text: HomeDailyModel.leftWeather.proLocName === "" ? "---" : HomeDailyModel.leftWeather.proLocName
                font.pixelSize: 22
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 10
            }
            Image {
                id: idImgLocation
                anchors.verticalCenter: idLocation_val.verticalCenter
                anchors.left: idLocation_val.right
                anchors.leftMargin: 3
                source:Resource_General.home_location
            }
            Image {
                id: idImgWeather
                width: 200 ; height: 200
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.top: parent.top
                anchors.topMargin: 50
                source: Resource_General.weather_shine_big
            }
            Text {
                id: idTemp_val
                text: HomeDailyModel.leftWeather.proTemp === -1 ? "---" : HomeDailyModel.leftWeather.proTemp
                font.pixelSize: 48
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: idImgWeather.top
                anchors.topMargin: 60
            }
            Text {
                id: idTemp_unit
                text: "°C"
                font.pixelSize: 48
                anchors.left: idTemp_val.right
                anchors.leftMargin: 0
                anchors.bottom: idTemp_val.bottom
            }

            Text {
                id: idTemp_ave_val
                text: "35°/18°"
                font.pixelSize: 20
                anchors.left: idTemp_val.left
                anchors.leftMargin: 18
                anchors.top: idTemp_val.bottom
                anchors.topMargin: 3
                color: "gray"
            }

            Image {
                id: idImgWindVelocity
                width: 100; height: 100
                anchors.top: idImgWeather.bottom
                anchors.topMargin: 15
                anchors.horizontalCenter: idImgWeather.horizontalCenter
                anchors.horizontalCenterOffset: 30
                source: Resource_General.weather_wind_velocity
            }
            Text {
                id: idWind_direction
                anchors.top: idImgWindVelocity.top
                anchors.topMargin: 40
                anchors.right: idImgWindVelocity.left
                anchors.rightMargin: 100
                text: "direction"
                font.pixelSize: 16
                color: "gray"
            }
            Text {
                id: idWind_direction_val
                anchors.verticalCenter: idWind_direction.verticalCenter
                anchors.left: idWind_direction.right
                anchors.leftMargin: 5
                text: "eastnorth"
                font.pixelSize: 16
                color: "black"
            }
            Text {
                id: idWind_speed
                anchors.top: idWind_direction.bottom
                anchors.topMargin: 5
                anchors.right: idWind_direction.right
                text: "speed"
                font.pixelSize: 16
                color: "gray"
            }
            Text {
                id: idWind_speed_val
                anchors.verticalCenter: idWind_speed.verticalCenter
                anchors.left: idWind_speed.right
                anchors.leftMargin: 5
                text: "12 km/h"
                font.pixelSize: 16
                color: "black"
            }
        }

        Item {
            id: righSide
            x: 360
            width: parent.width/2
            height: parent.height
            MouseArea {
                id: idMouUnderFrm
                anchors.fill: parent
                onClicked: {
                    AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_USER_DATA)
                }
            }
            Text {
                id: idRightLocation
                text: "Location :"
                font.pixelSize: 22
                anchors.top: parent.top
                anchors.topMargin: 250
                anchors.right: parent.right
                anchors.rightMargin: 200
            }
            Text {
                id: idRightLocation_val
                text: HomeDailyModel.rightWeather.proLocName === "" ? "---" : HomeDailyModel.rightWeather.proLocName
                font.pixelSize: 22
                anchors.left: idRightLocation.right
                anchors.leftMargin: 5
                anchors.verticalCenter: idRightLocation.verticalCenter
            }

            Text {
                id: idRightTemp
                anchors.right: idRightLocation.right
                anchors.verticalCenter: idRightLocation.verticalCenter
                anchors.verticalCenterOffset: 40
                text: ("Temperature :")
                font.pixelSize: 22
            }
            Text {
                id: idRightTemp_val
                text: HomeDailyModel.rightWeather.proTemp === -1 ? "---" : HomeDailyModel.rightWeather.proLocName
                font.pixelSize: 22
                anchors.left: idRightTemp.right
                anchors.leftMargin: 5
                anchors.verticalCenter: idRightTemp.verticalCenter
            }

            Text {
                id: idRightWindVel
                anchors.right: idRightLocation.right
                anchors.verticalCenter: idRightTemp.verticalCenter
                anchors.verticalCenterOffset: 40
                text: "Wind Velocity :"
                font.pixelSize: 22
            }
            Text {
                id: idRightWindVel_val
                text: HomeDailyModel.rightWeather.proWindVel === -1 ? "---" : HomeDailyModel.rightWeather.proWindVel
                font.pixelSize: 22
                anchors.left: idRightWindVel.right
                anchors.leftMargin: 5
                anchors.verticalCenter: idRightWindVel.verticalCenter
            }

            Text {
                id: idRightDry
                anchors.right: idRightLocation.right
                anchors.verticalCenter: idRightWindVel.verticalCenter
                anchors.verticalCenterOffset: 40
                text: "Dry :"
                font.pixelSize: 22
            }
            Text {
                id: idRightDry_val
                text: HomeDailyModel.rightWeather.proDry === -1 ? "---" : HomeDailyModel.rightWeather.proDry
                font.pixelSize: 22
                anchors.left: idRightDry.right
                anchors.leftMargin: 5
                anchors.verticalCenter: idRightDry.verticalCenter
            }

        }

        E_VerticalLine {
            id:idVerLine
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            lineColor: "gray"
            lineRange: parent.height - 30
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
    }

    Component.onCompleted: {
        idMainAnimation.start()
    }
}
