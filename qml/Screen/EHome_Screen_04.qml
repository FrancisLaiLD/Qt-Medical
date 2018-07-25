import QtQuick 2.0
import "../Component/ScreenComponent"
import "../Component/ListViewComponent"
import "../Component/DelegateComponent"
import "../Component/OtherComponent"

EHome_Main_Frame {
    id:root

    Text {
        id: name
        anchors.centerIn: parent
        font.pixelSize: 60
        text: qsTr("Screen number 04")
    }
    MouseArea {
        id: idMainMouse
        anchors.fill: parent
        onClicked: {
            AppManager.handleHomeScreenClick(05)
        }
    }
}
