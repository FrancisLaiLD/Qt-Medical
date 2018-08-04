import QtQuick 2.0

import "../Component/ScreenComponent"
import "../Component/ListViewComponent"
import "../Component/DelegateComponent"
import "../Component/OtherComponent"
import com.embeddeduse.models 1.0
import CustomGeometry 1.0

EHome_Main_Frame {
    id:idRoot
    ParallelAnimation {
        id: idMainAnimation
        running: false
        NumberAnimation { target: idRoot; property: "x"; from: -720; to: 0; duration: HomeScreenConst.time_screen_trans }
        NumberAnimation { target: idRoot; property: "opacity"; from: 0.0 ;to: 1.0; duration: HomeScreenConst.time_screen_trans }
    }
//    Timer {
//        id: idMainTimer
//        interval: 500
//        onTriggered: {
//            HomeDailyModel.leftWeather.proTemp += 1
//            HomeDailyModel.leftWeather.proWeatherProperty += 1
//        }
//        repeat: true
//    }

    property string lastTime: HomeDailyModel.timeUpdate
    EHome_Half_Frame {
        id: idAboveFrame
        x: 0; y: 0
        function getImgSrc() {
            switch(HomeDailyModel.leftWeather.proWeatherProperty) {
            case HomeEnum.WEATHER_DAY_SHINE_BIG:
                return Resource_General.weather_shine_big
            case HomeEnum.WEATHER_DAY_SHINE_CLOUDY:
                return Resource_General.weather_shine_cloudy
            default:
                return Resource_General.weather_rain_storm
            }
        }

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
                source: idAboveFrame.getImgSrc()
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
                text: HomeStringModel.STR_HOME_WEATHER_CELCIUS_DEGREE
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

            Text {
                id: idWeatherRepresent
                text: "Cloudy"
                font.pixelSize: 20
                anchors.top: idImgWeather.bottom
                anchors.topMargin: 3
                anchors.horizontalCenter: parent.horizontalCenter
                color: "gray"
            }

            Image {
                id: idImgWindVelocity
                width: 80; height: 80
                anchors.top: idImgWeather.bottom
                anchors.topMargin: 25
                anchors.horizontalCenter: idImgWeather.horizontalCenter
                anchors.horizontalCenterOffset: 50
                source: Resource_General.weather_wind_velocity
            }
            Text {
                id: idWind_direction
                anchors.top: idImgWindVelocity.top
                anchors.topMargin: 30
                anchors.right: idImgWindVelocity.left
                anchors.rightMargin: 100
                text: HomeStringModel.STR_HOME_WEATHER_DIRECTION
                font.pixelSize: 16
                color: "gray"
            }
            Text {
                id: idWind_direction_val
                anchors.verticalCenter: idWind_direction.verticalCenter
                anchors.left: idWind_direction.right
                anchors.leftMargin: 5
                text: HomeStringModel.STR_HOME_WEATHER_EAST + "-" + HomeStringModel.STR_HOME_WEATHER_NORTH
                font.pixelSize: 16
                color: "black"
            }
            Text {
                id: idWind_speed
                anchors.top: idWind_direction.bottom
                anchors.topMargin: 5
                anchors.right: idWind_direction.right
                text: HomeStringModel.STR_HOME_WEATHER_SPEED
                font.pixelSize: 16
                color: "gray"
            }
            Text {
                id: idWind_speed_val
                anchors.verticalCenter: idWind_speed.verticalCenter
                anchors.left: idWind_speed.right
                anchors.leftMargin: 5
                text: 12 + " " + HomeStringModel.STR_HOME_WEATHER_KM_H
                font.pixelSize: 16
                color: "black"
            }

            Text {
                id: timeUpdate
                anchors.left: parent.left
                anchors.leftMargin: 50
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                text: HomeStringModel.STR_HOME_WEATHER_DATA_WAS_UPDATE
                font.pixelSize: 14
                color: "gray"
            }
            Text {
                id: timeUpdate_val
                anchors.left: timeUpdate.right
                anchors.leftMargin: 10
                anchors.verticalCenter: timeUpdate.verticalCenter
                text: idRoot.lastTime.substring(0,10) + ", " + idRoot.lastTime.substring(11,19)
                font.pixelSize: 14
                font.italic: true
                color: "gray"
            }
        }

        /* -------------------------------------RIGHT SIDE----------------------------------*/
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
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 50
            text: HomeStringModel.STR_HOME_DEVICE_CONNECTION
            font.italic: false
            font.pixelSize: 20
            color: "black"
            font.underline: true
        }
        Text {
            id: txt_device_name
            anchors.top: idTitleTips.bottom
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 100
            text: "Device name"
            color: "gray"
        }
        Text {
            id: txt_device_state
            anchors.verticalCenter: txt_device_name.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 350
            text: "State"
            color: "gray"
        }
        Text {
            id: txt_device_last_conn
            anchors.verticalCenter: txt_device_name.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 500
            text: "Last connection"
            color: "gray"
        }

        ListView {
            id: lsv
            anchors.top: idTitleTips.bottom
            anchors.topMargin: 40
            spacing: 5
            interactive: true
            width: parent.width ; height: 50*6
            model: 6
            delegate: Rectangle {
                id: idDelegate
                width: parent.width
                height: 50
                color: index%2 === 0 ? "#C8C8C8" : "#A4A4A4"
                opacity: 0.8
                Image {
                    id: idImgState
//                    anchors.right: parent.right
//                    anchors.rightMargin: 300
                    x: txt_device_state.x
                    anchors.verticalCenter: parent.verticalCenter
                    source: HomeDailyModel.listDevice[index].proState ? Resource_General.btn_state_on : Resource_General.btn_state_off
                    width: 50 ; height: parent.height
                }
            }
        }

        Text {
            id: idTitleAdvanced
            anchors.horizontalCenter: idUnderFrame.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 80
            text: HomeStringModel.STR_HOME_GO_TO_DEVICE_SETTING
            font.italic: true
            font.pixelSize: 16
            color: idMouDetailAdv.pressed ? "#B3B712" : "gray"
            opacity: 0.5
            MouseArea {
                id: idMouDetailAdv
                anchors.fill: parent
                onClicked: {
                    AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_TECHNICAL_OVERVIEW)
                }
            }
        }
    }

    Component.onCompleted: {
        idMainAnimation.start()
        console.log('HomeDailyModel.listDevice[1].proState: ' + HomeDailyModel.listDevice[0].proName)
//        HomeDailyModel.leftWeather.proWeatherProperty = 0
//        idMainTimer.start()
    }
}
