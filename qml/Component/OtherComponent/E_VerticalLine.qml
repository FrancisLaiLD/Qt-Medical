import QtQuick 2.0

Rectangle {
    id: idRoot
    property int lineRange: 540
    property int lineWidth: 1
    property string lineColor: "gray"
    color: lineColor
    width: lineWidth
    height: lineRange
    opacity: 0.5
}
