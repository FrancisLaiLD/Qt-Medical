import QtQuick 2.0
import "../Component/OtherComponent"
import Ehome 1.0

Small_Popup {
    id: _root
    __popupTitle: "Warning"
    __popupType: 1
    Text {
        id: textCurrentConnect
        text: QML_CONTROL.popupContent
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top ; anchors.topMargin: 80
    }

    EButton_StandAlone {
        id: _btnGotoNetSetup
        btnLabel: "Ok"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom ; anchors.bottomMargin: 8
        onBtnClicked: {
            SettingModel.curInx = HomeEnum.SETTING_NETWORK
            AppManager.handleTransScreen(HomeEnum.EVENT_GO_TO_SETTING)
        }
    }
}
