import QtQuick 2.0
import "../OtherComponent"

Rectangle {
    id: _root
    width: 660 ; height: 800
    color: "transparent"
    E_HorizentalLine {
        id: _firstLine
        lineRange: parent.width - 60
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height/3
    }
    E_HorizentalLine {
        id: _secLine
        lineRange: parent.width - 60
        anchors.horizontalCenter: parent.horizontalCenter
        y: 2* parent.height/3
    }
}
