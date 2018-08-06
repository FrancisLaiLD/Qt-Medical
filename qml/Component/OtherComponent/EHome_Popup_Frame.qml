import QtQuick 2.0
import "../OtherComponent"

Rectangle {
    id: idRectPopup
    property int popupWidth: 560
    property int popupHeight: 400
    property string popupTitle: "unknow Title"

    width: popupWidth ; height: popupHeight
    radius: 15
    opacity: 1.0
    gradient:
        Gradient {
        GradientStop { position: 0.0; color: "#808080" }
        GradientStop { position: 1.0; color: "white" }
    }
    MouseArea {
        id: idMouInsideRect
        anchors.fill: parent
    }

    Text {
        id: popupTitle
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        font.pixelSize: 24
        color: HomeScreenConst.value_popup_color
        text: idRoot.popupTitle
    }

    E_HorizentalLine {
        id: ifFirstLine
        anchors.top: popupTitle.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        lineColor: "black"
        lineHeight: 5
        lineRange: parent - 30
    }

    NumberAnimation {
        id: idShowAni
        target: idRectPopup; property: "opacity"; from: 0.0; to: 1.0; duration: HomeScreenConst.time_screen_show_popup }
    NumberAnimation {
        id: idHideAni
        target: idRectPopup; property: "opacity"; from: 1.0; to: 0.0; duration: HomeScreenConst.time_screen_show_popup }

    Component.onCompleted: {
        idShowAni.start()
    }
    Component.onDestruction: {
        idHideAni.start()
    }
}
