import QtQuick 2.0


Rectangle {
    id: idRectPopup

    property string popupTitle: "unknow Title"

    width: 560 ; height: 400
    color: "red"
    radius: 10
    opacity: 1.0
    gradient:
        Gradient {
        GradientStop { position: 1.0; color: "#C2CF83" }
        GradientStop { position: 0.0; color: "#85A000" }
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
        font.pixelSize: 28
        text: idRoot.popupTitle
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
