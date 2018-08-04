import QtQuick 2.0
import "../Component/OtherComponent"
import com.embeddeduse.models 1.0
EHome_Popup_Frame {
    id: idRoot
    popupTitle: ""
    popupHeight: 120
    popupWidth: 350
    anchors.top: parent.top
    anchors.topMargin: 200

    Text {
        id: textCurrentConnect
        anchors.centerIn: parent
        text: "No connection...
Please try again later"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
    }

}
