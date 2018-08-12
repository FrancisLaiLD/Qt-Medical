import QtQuick 2.0

import Ehome 1.0
import "../Component/ScreenComponent"
import "../Component/ListViewComponent"
import "../Component/DelegateComponent"
import "../Component/OtherComponent"

EHome_Main_Frame {
    id:root
    ParallelAnimation {
        id: idMainAnimation
        running: false
        NumberAnimation { target: root; property: "x"; from: -720; to: 0; duration: AppValueConst.time_screen_trans }
        NumberAnimation { target: root; property: "opacity"; from: 0.0 ;to: 1.0; duration: AppValueConst.time_screen_trans }
    }
    screenTitle: AppStringConst.STR_USER_DATA
    //    backgroundImage:

    EChart_Weather {
        id: _dataChart
        anchors.top: parent.top
        anchors.topMargin: 48
        anchors.horizontalCenter: parent.horizontalCenter
        chartWidth: parent.width - 60
        chartHeight: parent.height/2 - 60
        xAxisName: AppStringConst.STR_GENERAL_TIME
        yAxisName: AppStringConst.STR_USER_DATA_BLOOD_PRESSUER
    }
    EButton_StandAlone {
        id: _btnSwitchRealTime
        anchors.right: parent.right ; anchors.rightMargin: 10
        anchors.top: parent.top ; anchors.topMargin: 10
        btnLabel: "Switch to real time"
        onBtnClicked: {
            console.log('qml> Go to Real time data')
            AppManager.handleTransScreen(HomeEnum.EVENT_GO_TO_USER_DATA_REAL_TIME)
        }
    }
    E_HorizentalLine {
        id: _firstLine
        anchors.top:_dataChart.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        lineHeight: 1
        lineRange: parent.width - 60
    }

    //    EChart_Weather {
    //        id: idDryChart
    //        anchors.top: idFirstLine.bottom
    //        anchors.topMargin: 30
    //        anchors.horizontalCenter: parent.horizontalCenter
    //        chartWidth: parent.width - 60
    //        chartHeight: parent.height/2 - 60
    //    }

    Rectangle {
        id: _userData
        width: parent.width ; height: 400
        color: "transparent"
        anchors.top: _firstLine.bottom ; anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id: _title
            text: AppStringConst.STR_USER_DATA_YOUR_DATA
            font.pixelSize: 20 ; font.underline: true
            anchors.left: _userData.left ; anchors.leftMargin: 0
            anchors.top: _userData.top ; anchors.topMargin: 10
        }
        EButton_StandAlone {
            id: _btnSendData
            anchors.verticalCenter: _title.verticalCenter
            anchors.right: parent.right ; anchors.rightMargin: 10
            btnLabel: AppStringConst.STR_USER_DATA_SEND_TO_DOCTOR
            onBtnClicked: {
                AppManager.handleShowPopupClick(HomeEnum.EVENT_SHOW_POPUP_NO_CONNECTION)
            }
        }
    }

    Component.onCompleted: {
        idMainAnimation.start()
    }
}


