import QtQuick 2.0


Rectangle {
    id: root
    property string mainColor: "transparent"

    // define signal
    signal release()
    signal pressAndHold()

    width: 720
    height: 510
    color: mainColor
    opacity: 0.5
    MouseArea {
        id: idMou
        anchors.fill: parent
        onPressed: {

        }
        onClicked: {
            root.release()
        }
        onPressAndHold: {
            root.pressAndHold()
        }
        onDoubleClicked: {

        }
    }

}
