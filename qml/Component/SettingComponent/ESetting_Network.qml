import QtQuick 2.0
import "../OtherComponent"

Rectangle {
    id: _root
    width: 660 ; height: 800
    color: "transparent"
    Item {
        id: _wifiNet
        width: parent.width
        height: 300
        Text {
            id: _wifiNetTit
            text: "Wifi setting"
            font.pixelSize: 18 ; color: AppValueConst.value_popup_color
            anchors.top: parent.top ; anchors.topMargin: 0
            anchors.left: parent.left ; anchors.leftMargin: 10
        }
        E_HorizentalLine {
            id: _endLineWifi
            lineRange: parent.width - 160
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }
    }
    Item {
        id: _serverNet
        width: parent.width
        height: 250
        anchors.top: _wifiNet.bottom ; anchors.leftMargin: 10
        Text {
            id: _serverNetTit
            text: "Server configure"
            font.pixelSize: 18 ; color: AppValueConst.value_popup_color
            anchors.top: parent.top ; anchors.topMargin: 10
            anchors.left: parent.left ; anchors.leftMargin: 10
        }
        E_HorizentalLine {
            id: _endLineServer
            lineRange: parent.width - 160
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }
    }
}
