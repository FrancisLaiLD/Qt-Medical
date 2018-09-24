import QtQuick 2.0

E_HorizentalLine {
    id: idRoot
    property int resolution: 5
    property int maxValue: 100
    property int axisRange: 100
//    property int bottomSize: resText.height
    lineColor: "black"
    lineHeight: 2
    lineRange: axisRange
    Component.onCompleted: {

    }

}
