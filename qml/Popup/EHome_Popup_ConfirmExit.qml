import QtQuick 2.0
import "../Component/OtherComponent"
import Ehome 1.0

Small_Popup {
    id: _root
    __popupTitle: "Warning"
    __popupType: 1
    property string __popupText: MEASURE_CONTROL.isMeasuring ? "Function is not finish. \nDo you want to exit ?" :
                         (MEASURE_CONTROL.isHasMeasureResult ?"The result is not saved.\nDo you want to exit ?" : "Do you want to stop function")
    property bool __resultConf: false
    Text {
        id: textCurrentConnect
        text:  _root.__popupText
        lineHeight: 1.2
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top ; anchors.topMargin: 80
    }

    EButton_StandAlone {
        id: _ok
        btnLabel: "OK"
        btnWidth: 100
        anchors.bottom: parent.bottom ; anchors.bottomMargin: 10
        anchors.left: parent.left ; anchors.leftMargin: 80
        onBtnClicked: {
            AppManager.handlePopupOkCancel(true)
        }
    }
    EButton_StandAlone {
        id: _cancle
        btnLabel: "Cancel"
        btnWidth: 100
        anchors.bottom: parent.bottom ; anchors.bottomMargin: 10
        anchors.right: parent.right ; anchors.rightMargin: 80
        onBtnClicked: {
            AppManager.handlePopupOkCancel(false)
        }
    }
}
