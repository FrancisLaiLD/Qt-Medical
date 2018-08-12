import QtQuick 2.0
import "../Component/OtherComponent"
import Ehome 1.0

Small_Popup {
    id: _root
    __popupTitle: "Error"
    __popupType: 0
    Text {
        id: textCurrentConnect
        text: "No connection...
Please try again later"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top ; anchors.topMargin: 80
    }

    EButton_StandAlone {
        id: _btnGotoNetSetup
        btnLabel: "Go to network setting"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom ; anchors.bottomMargin: 8
        onBtnClicked: {
            SettingModel.curInx = HomeEnum.SETTING_NETWORK
            AppManager.handleHidePopupClick(HomeEnum.EVENT_GO_TO_SETTING)
        }
    }
}
