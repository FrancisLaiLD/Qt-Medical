import QtQuick 2.0
import "../OtherComponent"

Rectangle {
    id: _root
    width: 660 ; height: 800
    color: "transparent"
    Item {
        id: _display
        width: parent.width
        height: 250
        Text {
            id: _displayTitle
            text: "Display setting"
            font.pixelSize: 18 ; color: AppValueConst.value_popup_color
            anchors.top: parent.top ; anchors.topMargin: 0
            anchors.left: parent.left ; anchors.leftMargin: 10
        }
        E_HorizentalLine {
            id: _endLineDis
            lineRange: parent.width - 160
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }
    }
    Item {
        id: _sound
        width: parent.width
        height: 250
        anchors.top : _display.bottom ; anchors.topMargin: 10
        Text {
            id: _soundTitlte
            text: "Sound setting"
            font.pixelSize: 18 ; color: AppValueConst.value_popup_color
            anchors.top: parent.top ; anchors.topMargin: 10
            anchors.left: parent.left ; anchors.leftMargin: 10
        }
        E_HorizentalLine {
            id: _endLineSou
            lineRange: parent.width - 160
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }
    }
}
