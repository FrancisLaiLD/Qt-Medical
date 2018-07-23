import QtQuick 2.0

Item {
    id: root
    property int elementWidth: 260
    property int elementHeight: 260
    //    property string elementImgLink: ""
    //    property string elementLabel: ""
    property int elementTextFont: 40

    // define Signals
    signal
    release()
    // properties
    visible: elementVisible
    Rectangle {
        id: idRectBtn
        width: elementWidth
        height: elementHeight
        color: "yellow"
        opacity: 0.5
        visible: idMouse.pressed ? true : false
        border.color: "black"
        border.width: 2
    }
    MouseArea {
        id: idMouse
        anchors.fill: idRectBtn
        onClicked: {
            root.release()
            console.log('Grv Delegate clicked !' + index)
        }
    }
    Image {
        id: idIcon
        source: elementImgLink
        anchors.fill: idRectBtn
    }

    Text {
        id: idLabel
        text: elementLabel
        anchors.horizontalCenter: idRectBtn.horizontalCenter
        anchors.top : idRectBtn.bottom
        font.pixelSize: elementTextFont
    }

}
