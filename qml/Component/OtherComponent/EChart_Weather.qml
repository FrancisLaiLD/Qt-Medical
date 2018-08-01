import QtQuick 2.0

Rectangle {
    id: idRoot
    width: 500 ; height: (1080-60)/3 - 40
    color: "transparent"
    property string xAxisNameVal: "xAxisName"
    property string yAxisNameVal: "yAxisName"
    property int xAxisMaxValue: 24
    property int xAxisRes: 8
    property int yAxisMaxValue: 100
    property int yAxisRes: 10

    EXAxisLine {
        id: xAxis
        maxValue: xAxisMaxValue
        resolution: xAxisRes
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

    }
    Text {
        id: xAxisName
        anchors.verticalCenter: xAxis.verticalCenter
        anchors.left: xAxis.right
        anchors.leftMargin: 5
        text: xAxisNameVal
        font.italic: true
    }

    EYAxisLine {
        id: yAxis
        maxValue: yAxisMaxValue
        resolution: yAxisRes
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
    }

    Text {
        id: yAxisName
        anchors.horizontalCenter: yAxis.horizontalCenter
        anchors.bottom: yAxis.top
        anchors.bottomMargin: 5
        text: yAxisNameVal
        font.italic: true
    }


}
