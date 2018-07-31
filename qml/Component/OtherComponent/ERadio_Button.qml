import QtQuick 2.0

Rectangle {
    id: idRoot
    property bool isCheck: false
    property string radBtnLabel: "unknow"
    Image {
        id: idImg
        width: 30 ; height: 30
        source: idRoot.isCheck ? Resource_General.rad_btn_check : Resource_General.rad_btn_uncheck
    }
    Text {
        id: idText
        text: radBtnLabel
        anchors.verticalCenter: idImg.verticalCenter
        anchors.left: idImg.right
        anchors.leftMargin: 5
    }

}
