import QtQuick 2.0

Item {
    id: root
    property string iconPrefix: "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/icons/"
    property int elementWidth
    property int elementHeight
    //    property string elementImgLink: ""
    //    property string elementLabel: ""
    property int elementTextFont: 40

    width: elementWidth
    height: elementHeight + idLabel.height

    // define Signals
    signal
    release()
    // properties
    visible: elementVisible
    Rectangle {
        id: idRectBtn
        width: elementWidth
        height: elementWidth
        color: "transparent"
        opacity: 0.5
        visible: true
    }
    Image {
        id: idIcon
        source: elementEnable ? (idMouse.pressed ? (iconPrefix + elementImgLink.replace("@", "p")) : (iconPrefix + elementImgLink.replace("@", "n"))) : (iconPrefix + elementImgLink.replace("@", "d"))
        anchors.fill: idRectBtn
    }
    MouseArea {
        id: idMouse
        anchors.fill: idRectBtn
        enabled: elementEnable
        onClicked: {
            root.release()
            console.log('Grv Delegate clicked !' + index)
        }
    }

    Text {
        id: idLabel
        text: elementLabel
        anchors.horizontalCenter: idRectBtn.horizontalCenter
        anchors.top : idRectBtn.bottom
        font.pixelSize: elementTextFont
        color: elementEnable ? "green" : "#808080"
    }

}
