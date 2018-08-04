import QtQuick 2.0

Rectangle {
    id: idRoot
    property int btnWidth: 100
    property int btnHeight: 40
    property string btnLabel: "Unknow button"
    property string btnLabelColor: "#310552"
    property string btnColorTop: "#808080"
    property string btnColorBottom: "white"
    property string btnColorPress: "#B79612"
    property string btnBorderColor: "#053E42"

    // signals
    signal btnClicked()

    width: idBtnLabel.width + 30
    height: idBtnLabel.height + 16
    radius: 8
    border.width: 2
    border.color: btnBorderColor
    gradient:
        Gradient {
        GradientStop { position: 0.0; color: (idMainMou.pressed ? btnColorPress : btnColorTop)}
        GradientStop { position: 1.0; color: (idMainMou.pressed ? btnColorPress : btnColorBottom )}
    }

    Text {
        id: idBtnLabel
        text: btnLabel
        font.pixelSize: 16
        color: btnLabelColor
        anchors.centerIn: parent
    }
    MouseArea {
        id: idMainMou
        anchors.fill: parent
        onClicked: {
            idRoot.btnClicked()
        }
        onExited: {
//            idMainMou.pressed = false
        }
    }
}
