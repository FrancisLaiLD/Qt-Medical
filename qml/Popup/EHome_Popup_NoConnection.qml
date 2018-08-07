import QtQuick 2.0
import "../Component/OtherComponent"
import Ehome 1.0

Small_Popup {
    id: _root
    Text {
        id: textCurrentConnect
        anchors.centerIn: parent
        text: "No connection...
Please try again later"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
    }
}
