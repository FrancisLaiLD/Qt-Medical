import QtQuick 2.0

Image {
    id: _root
    property bool isPressed: false
    property string __imgSource: ""
    source: __imgSource
    // signal
    signal btnRelease()
    opacity: _root.isPressed ? 1.0 : 0.5
    MouseArea {
        id: idMouBackBtn
        anchors.fill: parent

        onPressed: {
            _root.isPressed = true
        }
        onExited: {
            _root.isPressed = false
        }
        onReleased: {
            if (_root.isPressed)
                _root.btnRelease()
        }
    }

}
