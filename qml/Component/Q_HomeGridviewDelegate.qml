import QtQuick 2.0

Item {
    id: root
    property int elementWidth: 300
    property int elementHeight: 300
//    property string elementImgLink: ""
//    property string elementLabel: ""
    property int elementTextFont: 40

    // define Signals
    signal
    release()

    Rectangle {
        id: idRectBtn
        width: elementWidth
        height: elementHeight
        color: "red"
        Image {
            id: idIcon
            source: elementImgLink
            anchors.centerIn: parent
        }
        MouseArea {
            id: idMouse
            anchors.fill: parent
            onClicked: {
                console.log('Grv Delegate clicked !' + index)
            }
        }
    }

    Text {
        id: idLabel
        text: elementLabel
        anchors.horizontalCenter: idRectBtn.horizontalCenter
        anchors.top : idRectBtn.bottom
        font.pixelSize: elementTextFont
    }

}
