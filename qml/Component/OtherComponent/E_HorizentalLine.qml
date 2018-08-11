import QtQuick 2.0

Rectangle {
    id: idRoot
    property int lineRange: 720
    property int lineHeight:1
    property string lineColor: "gray"
    color: lineColor
    width: lineRange
    height: lineHeight
    opacity: 0.5
}
