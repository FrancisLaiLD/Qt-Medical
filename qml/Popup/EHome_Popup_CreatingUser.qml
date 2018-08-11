import QtQuick 2.0
import "../Component/OtherComponent"
import Ehome 1.0

Small_Popup {
    id: _root
    Text {
        id: textCurrentConnect
        text: "Setting up your user
Please wat..."
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top ; anchors.topMargin: 20
    }

    EButton_StandAlone {
        id: _btnGotoNetSetup
        btnLabel: "Switch to new user"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom ; anchors.bottomMargin: 8
        onBtnClicked: {
            SettingModel.curInx = HomeEnum.SETTING_NETWORK
            AppManager.handleHidePopupClick(HomeEnum.EVENT_GO_TO_SETTING)
        }
    }
}
