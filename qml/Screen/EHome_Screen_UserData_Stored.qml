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
        NumberAnimation { target: root; property: "x"; from: -720; to: 0; duration: HomeScreenConst.time_screen_trans }
        NumberAnimation { target: root; property: "opacity"; from: 0.0 ;to: 1.0; duration: HomeScreenConst.time_screen_trans }
    }
    screenTitle: HomeStringModel.STR_USER_DATA
//    backgroundImage:

    EChart_Weather {
        id: idTempChart
        anchors.top: parent.top
        anchors.topMargin: 48
        anchors.horizontalCenter: parent.horizontalCenter
        chartWidth: parent.width - 60
        chartHeight: parent.height/2 - 60
        xAxisName: HomeStringModel.STR_GENERAL_TIME
        yAxisName: HomeStringModel.STR_USER_DATA_BLOOD_PRESSUER
    }

    E_HorizentalLine {
        id: _firstLine
        y: parent.height/2
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

    EButton_StandAlone {
        id: idBtnGoToRealTime
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: idTempChart.top
        btnLabel: "Switch to real time"
        onBtnClicked: {
            console.log('qml> Go to Real time data')
            AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_USER_DATA_REAL_TIME)
        }
    }

    Rectangle {
        id: _lastRec
        width: parent.width - 60 ; height: 400
        anchors.top: _firstLine.bottom ; anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        color: "red"
        opacity: 0.3
        }
    Text {
        id: _title
        text: "Your last record"
        font.pixelSize: 20 ; font.underline: true
        anchors.left: _lastRec.left ; anchors.leftMargin: 0
        anchors.top: _lastRec.top ; anchors.topMargin: 10
    }
    EButton_StandAlone {
        id: _btnSendData
        anchors.bottom: _lastRec.bottom ; anchors.bottomMargin: 0
        anchors.horizontalCenter: _lastRec.horizontalCenter
        btnLabel: "Send data to Doctor"
        onBtnClicked: {
            AppManager.handlePopupClick(HomeEnum.EVENT_SHOW_POPUP_NO_CONNECTION)
        }
    }

    Component.onCompleted: {
        idMainAnimation.start()
    }
}


