import QtQuick 2.0
import "../Component/OtherComponent"
import Ehome 1.0

Medium_Popup {
    id: idRoot
    __popupTitle: "Save your data"
    __popupType: 2
    Rectangle {
        id: _createNewRec
        x: 0 ; y: __startContent
        color: "transparent"
        width: parent.width/2 ; height: parent.height - __startContent- 10 - _btnClose.height - 10
        Text {
            id: _newRecTit
            text: "Create new record"
            font.pixelSize: 16 ;
            anchors.horizontalCenter: parent.horizontalCenter ;
            anchors.top: parent.top ; anchors.topMargin: 10
        }
        E_VerticalLine {
            id:_verLine
            lineRange: parent.height - 30
            anchors.right: parent.right
        }
        EButton_StandAlone {
            id: _btnCreate
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom ; anchors.bottomMargin: 5
            btnLabel: "Create" ; btnWidth: 150
            onBtnClicked: {
                AppManager.handleCreateNewRec(MEASURE_CONTROL.finalMeasureVal)
                MEASURE_CONTROL.isSavedData = true
            }
        }
    }

    Rectangle {
        id: _writeExitRec
        x: parent.width/2 ; y: __startContent
        color: "transparent"
        width: parent.width/2 ; height: parent.height - __startContent- 10 - _btnClose.height - 10
        Text {
            id: _writeExitRecTit
            text: "Write to exist record"
            font.pixelSize: 16 ;
            anchors.horizontalCenter: parent.horizontalCenter ;
            anchors.top: parent.top ; anchors.topMargin: 10
        }
        EButton_StandAlone {
            id: _btnWrite
            __btnEnable : false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom ; anchors.bottomMargin: 5
            btnLabel: "Write" ; btnWidth: 150
            onBtnClicked: {
//                AppManager.handleHidePopup(HomeEnum.EVENT_HIDE_POPUP)
            }
        }
    }

    EButton_StandAlone {
        id: _btnClose
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom ; anchors.bottomMargin: 10
        btnLabel: "Close" ; btnWidth: 100
        onBtnClicked: {
            AppManager.handleHidePopup(HomeEnum.EVENT_HIDE_POPUP)
        }
    }

    Component.onCompleted: {
        // init load...
    }
}
