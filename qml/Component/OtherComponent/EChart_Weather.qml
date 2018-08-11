import QtQuick 2.0

Rectangle {
    id: idRoot
    color: "transparent"
    property string xAxisName: "xAxisName"
    property string yAxisName: "yAxisName"
    property int xAxisMaxValue: 24
    property int xAxisRes: 8
    property int yAxisMaxValue: 100
    property int yAxisRes: 10
    property int chartWidth: 500
    property int chartHeight: (1080-60)/3
    width: chartWidth ; height: chartHeight
//    Rectangle {
//        id: iddd
//        anchors.fill: parent
//        color: "red"
//        opacity: 0.5
//    }
    function paintChart(_inputData) {

    }

    EXAxisLine {
        id: xAxis
        maxValue: xAxisMaxValue
        resolution: xAxisRes
        axisRange: chartWidth - xAxisName_val.width - 5 - anchors.leftMargin
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20

    }
    Text {
        id: xAxisName_val
        anchors.verticalCenter: xAxis.verticalCenter
        anchors.left: xAxis.right
        anchors.leftMargin: 5
        text: xAxisName
        font.italic: true
    }

    EYAxisLine {
        id: yAxis
        maxValue: yAxisMaxValue
        resolution: yAxisRes
        axisRange: chartHeight - yAxisName_val.height - 5 - anchors.bottomMargin
        virtualLineRange: xAxis.axisRange
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
    }

    Text {
        id: yAxisName_val
        anchors.horizontalCenter: yAxis.horizontalCenter
        anchors.bottom: yAxis.top
        anchors.bottomMargin: 3
        text: yAxisName
        font.italic: true
    }

}
