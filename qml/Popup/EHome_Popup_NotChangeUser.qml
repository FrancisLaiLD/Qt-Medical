import QtQuick 2.0
import "../Component/OtherComponent"
import Ehome 1.0

Small_Popup {
    id: _root
    __popupTitle: "Warning"
    __popupType: 1
    property bool __resultConf: false
    Text {
        id: textCurrentConnect
        text: "Can not edit user this time"
        lineHeight: 1
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top ; anchors.topMargin: 80
    }

    EButton_StandAlone {
        id: _ok
        btnLabel: "OK"
        btnWidth: 100 ; btnHeight: 40
        anchors.bottom: parent.bottom ; anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        onBtnClicked: {
            AppManager.handleHidePopup(HomeEnum.EVENT_HIDE_POPUP)
        }
    }
}
