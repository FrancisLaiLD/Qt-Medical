import QtQuick 2.0

Text {
    id: _root
    // external properties
    property string __colorNormal: HomeScreenConst.line_normal_color
    property string __colorPressed: HomeScreenConst.text_click_color
    // internal properties
    property bool isPressed: false

    color: _root.isPressed ? __colorPressed : __colorNormal
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
