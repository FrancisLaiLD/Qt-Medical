import QtQuick 2.0

E_VerticalLine {
    id: idRoot
    property int resolution: 5
    property int maxValue: 100
    property int axisRange: 100
    property int virtualLineRange: 400
    property int startValue: 0
    lineColor: "black"
    lineWidth: 2
    lineRange: axisRange

    Component.onCompleted: {

    }
}
