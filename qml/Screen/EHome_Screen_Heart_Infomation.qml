import QtQuick 2.0
import "../Component"

Item {
    id:root
    width: 1920
    height: 640
    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: "gray"
        opacity: 0.3
        Text {
            id: name
            anchors.centerIn: parent
            text: qsTr("Screen number 01")
        }
    }
}
