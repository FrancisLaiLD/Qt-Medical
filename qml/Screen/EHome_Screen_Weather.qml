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
        NumberAnimation { target: root; property: "x"; from: -720; to: 0; duration: HomeScreenConst.time_screen_trans }
        NumberAnimation { target: root; property: "opacity"; from: 0.0 ;to: 1.0; duration: HomeScreenConst.time_screen_trans }
    }

    screenTitle: "Weather data"

    EChart_Weather {
        id: idTempChart
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        xAxisName: "time"
        yAxisName: HomeStringModel.STR_HOME_WEATHER_CELCIUS_DEGREE
        xAxisMaxValue: 24
        xAxisRes: 8
        yAxisMaxValue: 50
        yAxisRes: 10
    }

    Rectangle {
        id: idShowBy
        width: 125
        height: 200
        anchors.verticalCenter: idTempChart.verticalCenter
        anchors.left: idTempChart.right
        anchors.leftMargin: -20
        Text {
            id: title
            text: "Show by :"
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
        border.color: "#05DAB3"
        border.width: 1
        radius: 12
        color: "transparent"
    }

    E_HorizentalLine {
        id: idFirstLine
        anchors.top: idTempChart.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        lineHeight: 1
        lineRange: parent.width - 60
    }

    EChart_Weather {
        id: idWindVelChart
        anchors.top: idFirstLine.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        xAxisName: "time"
        xAxisMaxValue: 24
        xAxisRes: 6
        yAxisName: "km/h"
        yAxisMaxValue: 30
        yAxisRes: 6
    }

    E_HorizentalLine {
        id: idSecondLine
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: idWindVelChart.bottom
        anchors.topMargin: 10
        lineHeight: 1
        lineRange: parent.width - 60
    }

    EChart_Weather {
        id: idDryChart
        anchors.top: idSecondLine.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        xAxisName: "time"
        xAxisMaxValue: 24
        xAxisRes: 6
        yAxisName: "%"
        yAxisMaxValue: 100
        yAxisRes: 10
    }


    Component.onCompleted: {
        idMainAnimation.start()
    }
}
