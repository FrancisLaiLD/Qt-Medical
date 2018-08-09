import QtQuick 2.0

Text {
    id: _root
    // external properties

    // internal properties
    property bool isPressed: false
    color: _root.isPressed ? HomeScreenConst.text_click_color : HomeScreenConst.line_normal_color
    //signals
    signal textRelease()
    MouseArea {
        id: _mou
        anchors.fill: parent
        onPressed: {
            _root.isPressed = true
        }
        onReleased: {
            if (_root.isPressed)
                _root.textRelease()
        }
        onExited: {
            _root.isPressed = false
        }
    }
}
