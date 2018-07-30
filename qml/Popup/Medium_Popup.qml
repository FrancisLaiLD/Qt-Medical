import QtQuick 2.0
import "../Component/OtherComponent"
import com.embeddeduse.models 1.0
EHome_Popup_Frame {
    id: idRoot
    popupTitle: "User profile management"

    Text {
        id: txt_cur_user
        text: "Current user"
        font.pixelSize: 22
        x: 20 ; y: 60
    }

    Text {
        id: txt_cur_user_val
        anchors.left: txt_cur_user.right
        anchors.leftMargin: 20
        anchors.verticalCenter: txt_cur_user.verticalCenter
        text: "Dang Hung"
        font.pixelSize: 22
        font.italic: true
    }
}
