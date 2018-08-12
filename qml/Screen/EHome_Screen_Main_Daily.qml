import QtQuick 2.0

import "../Component/ScreenComponent"
import "../Component/ListViewComponent"
import "../Component/DelegateComponent"
import "../Component/OtherComponent"
import Ehome 1.0

EHome_Main_Frame {
    id:_root
    property string lastTime: HomeDailyModel.timeUpdate
//    scrrenBgImg: "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/images/main_bg_25.jpg"
    ParallelAnimation {
        id: idMainAnimation
        running: false
        NumberAnimation { target: _root; property: "x"; from: -720; to: 0; duration: AppValueConst.time_screen_trans }
        NumberAnimation { target: _root; property: "opacity"; from: 0.0 ;to: 1.0; duration: AppValueConst.time_screen_trans }
    }

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
                return Resource_General.weather_shine_cloudy
            }
        }

        Flickable {
            id: leftSide
            x: 0
            width: idAboveFrame.width/2
            height: idAboveFrame.height
            MouseArea {
                id: idMouDetailWea
                anchors.fill: parent
                onClicked: {
                    AppManager.handleTransScreen(HomeEnum.EVENT_GO_TO_HOME_WEATHER)
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
                text: AppStringConst.STR_HOME_WEATHER_CELCIUS_DEGREE
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
                color: AppValueConst.line_normal_color
            }

            Text {
                id: idWeatherRepresent
                text: "Cloudy"
                font.pixelSize: 20
                anchors.top: idImgWeather.bottom
                anchors.topMargin: 3
                anchors.horizontalCenter: parent.horizontalCenter
                color: AppValueConst.line_normal_color
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
                text: AppStringConst.STR_HOME_WEATHER_DIRECTION
                font.pixelSize: 16
                color: AppValueConst.line_normal_color
            }
            Text {
                id: idWind_direction_val
                anchors.verticalCenter: idWind_direction.verticalCenter
                anchors.left: idWind_direction.right
                anchors.leftMargin: 5
                text: AppStringConst.STR_HOME_WEATHER_EAST + "-" + AppStringConst.STR_HOME_WEATHER_NORTH
                font.pixelSize: 16
                color: "black"
            }
            Text {
                id: idWind_speed
                anchors.top: idWind_direction.bottom
                anchors.topMargin: 5
                anchors.right: idWind_direction.right
                text: AppStringConst.STR_HOME_WEATHER_SPEED
                font.pixelSize: 16
                color: AppValueConst.line_normal_color
            }
            Text {
                id: idWind_speed_val
                anchors.verticalCenter: idWind_speed.verticalCenter
                anchors.left: idWind_speed.right
                anchors.leftMargin: 5
                text: 12 + " " + AppStringConst.STR_HOME_WEATHER_KM_H
                font.pixelSize: 16
                color: "black"
            }
        }
        //        }

        Text {
            id: timeUpdate
            anchors.left: leftSide.left
            anchors.leftMargin: 30
            anchors.bottom: leftSide.bottom
            anchors.bottomMargin: 5
            text: AppStringConst.STR_HOME_WEATHER_DATA_WAS_UPDATE
            font.pixelSize: 14
            color: AppValueConst.line_normal_color
        }
        Text {
            id: timeUpdate_val
            anchors.left: timeUpdate.right
            anchors.leftMargin: 10
            anchors.verticalCenter: timeUpdate.verticalCenter
            text: Qt.formatDateTime(_root.lastTime, "yyyy.MM.dd") +
                  " , "+ Qt.formatDateTime(_root.lastTime, "hh:mm:ss AP")
            font.pixelSize: 14
            font.italic: true
            color: AppValueConst.line_normal_color
        }
        /* -------------------------------------RIGHT SIDE----------------------------------*/
        Item {
            id: righSide
            x: 360
            width: parent.width/2
            height: parent.height
            Item {
                id: idQuickAccess
                width: parent.width ; height: parent.height/2

                Text {
                    id: _titQuickAccess
                    text: "Quick Access"
                    font.pixelSize: 16
                    anchors.left: parent.left ; anchors.leftMargin: 10
                    anchors.top: parent.top
                    anchors.topMargin: 10
                }
                ListView {
                    id: _lsvCommand
                    anchors.top: _titQuickAccess.bottom
                    anchors.topMargin: 30
                    spacing: 8
                    clip: true
                    interactive: true
                    width: parent.width ; height: contentHeight
                    model: AppListCommand
                    delegate: Rectangle {
                        id: _delCommand
                        width: _commandName.width + _imgArrow.width + 20 ; height: visible ? 35 : 0 ; radius: 6
                        anchors.left: parent.left ; anchors.leftMargin: 20
                        visible: commandShowInMain
                        color: index%2 === 0 ? "#CCFF45" : "#96CF00"
                        opacity: 0.8
                        Text {
                            id: _commandName
                            text: commandName
                            font.pixelSize: 16 ; font.italic: false
                            x: 10
                            opacity: 1.0
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Image {
                            id: _imgArrow
                            source: _mouGoToFunc.isPressed ? Resource_General.ico_right_arrow_p : Resource_General.ico_right_arrow_d
                            width: _commandName.height ; height: _commandName.height
                            anchors.verticalCenter: _commandName.verticalCenter ;
                            anchors.left: _commandName.right ; anchors.leftMargin: 5
                        }
                        MouseArea {
                            id: _mouGoToFunc
                            anchors.fill: parent
                            onClicked: {
                                AppManager.handleTransScreen(HomeEnum.EVENT_GO_TO_SETTING)
                            }
                        }
                    }
                }
            }
            E_HorizentalLine {
                id: lineQaAndLr
                anchors.centerIn: parent
                lineColor: AppValueConst.line_normal_color ; lineRange: parent.width - 30
            }
            Item {
                id: idLastRecord
                width: parent.width ; height: parent.height/2
                y: parent.height/2
                Text {
                    id: titLasRec
                    text: "Your schedule"
                    font.pixelSize: 16
                    anchors.left: parent.left ; anchors.leftMargin: 10
                    anchors.top: parent.top
                    anchors.topMargin: 10
                }
            }
            EButton_Text {
                id: _txtGotoUsrData
                anchors.horizontalCenter: idLastRecord.horizontalCenter
                anchors.bottom: idLastRecord.bottom
                anchors.bottomMargin: 5
                text: AppStringConst.STR_HOME_GO_TO_USER_SCHEDULE
                font.italic: true
                font.pixelSize: 15
                onTextRelease: {
                    AppManager.handleTransScreen(HomeEnum.EVENT_GO_TO_USER_DATA)
                }
            }
        }

        E_VerticalLine {
            id:idVerLine
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            lineColor: AppValueConst.line_normal_color
            lineRange: parent.height - 30
        }
    }

    E_HorizentalLine {
        id: idLineCenter
        lineRange: parent.width - 60
        lineColor: AppValueConst.line_normal_color
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
            text: AppStringConst.STR_HOME_DEVICE_CONNECTION
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
            font.pixelSize: 14
            color: AppValueConst.line_normal_color
        }
        Text {
            id: txt_device_state
            anchors.verticalCenter: txt_device_name.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 350
            text: "State"
            font.pixelSize: 14
            color: AppValueConst.line_normal_color
        }
        Text {
            id: txt_device_last_conn
            anchors.verticalCenter: txt_device_name.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 500
            text: "Last connection"
            font.pixelSize: 14
            color: AppValueConst.line_normal_color
        }

        ListView {
            id: _lsvDevice
            anchors.top: idTitleTips.bottom
            anchors.topMargin: 40
            spacing: 5
            clip: true
            interactive: true
            width: parent.width ; height: contentHeight
            model: listDevice
            delegate: Rectangle {
                id: idDelegate
                width: parent.width ;
                height: visible ? 50 : 0
                visible: proShowInMain
                color: proState ? "#CDCDCD" : "#E0E0E0"
                opacity: 0.7
                Text {
                    id: idTxt_device_name
                    text: proName
                    font.pixelSize: 16 ; font.italic: false
                    x: txt_device_name.x
                    anchors.verticalCenter: parent.verticalCenter
                }
                Image {
                    id: idImgState
                    x: txt_device_state.x
                    anchors.verticalCenter: parent.verticalCenter
                    source: proState ? Resource_General.btn_state_on : Resource_General.btn_state_off
                    width: 50 ; height: parent.height
                }
                Text {
                    id: idTxt_device_lastConn
                    text: proState ? "online" : Qt.formatDateTime(proLastConn, "yyyy.MM.dd") + " - "+ Qt.formatDateTime(proLastConn, "hh:mm AP")
                    font.pixelSize: 15
                    color: proState ? "green" : "#808080"
                    x: txt_device_last_conn.x
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }

        EButton_Text {
            id: _gotoDeviceSet
            anchors.horizontalCenter: idUnderFrame.horizontalCenter
//            anchors.bottom: parent.bottom
//            anchors.bottomMargin: 80
            anchors.top: _lsvDevice.bottom ; anchors.topMargin: 20
            text: AppStringConst.STR_HOME_GO_TO_DEVICE_SETTING
            font.italic: true
            font.pixelSize: 15
            onTextRelease: {
                SettingModel.curInx = HomeEnum.SETTING_DEVICE
                AppManager.handleTransScreen(HomeEnum.EVENT_GO_TO_SETTING)
            }
        }
    }

    Component.onCompleted: {
        idMainAnimation.start()
        //        HomeDailyModel.leftWeather.proWeatherProperty = 0
        //        idMainTimer.start()
    }
}
