import QtQuick 2.0


Rectangle {
    id: idRectPopup

    property string popupTitle: "unknow Title"

    width: 560 ; height: 400
    color: "red"
    radius: 10
    opacity: 0.8
    gradient:
        Gradient {
        GradientStop { position: 1.0; color: "lightsteelblue" }
        GradientStop { position: 0.0; color: "blue" }
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
        font.pixelSize: 32
        text: idRoot.popupTitle
    }

    NumberAnimation {
        id: idShowAni
        target: idRectPopup; property: "opacity"; from: 0.0; to: 1.0; duration: 300 }
    NumberAnimation {
        id: idHideAni
        target: idRectPopup; property: "opacity"; from: 1.0; to: 0.0; duration: 300 }

    Component.onCompleted: {
        idShowAni.start()
    }
    Component.onDestruction: {
        idHideAni.start()
    }
}
