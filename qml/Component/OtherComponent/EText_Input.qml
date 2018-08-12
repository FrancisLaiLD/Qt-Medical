import QtQuick 2.0
import "../OtherComponent"
Item {
    id: _root
    // external properties
    property string __textHint          : ""
    property int    __textWidth         : /*_txt_hint.width*/ 100
    property int    __textHeight        : /*_txt_hint.height*/ 25
    property string __textValue         : ""
    property int    __textFontSize      : 15
    // internal properties
    property bool isInputting: false
    width: __textWidth ; height: __textHeight
    Text {
        id: _txt_val
        text: __textValue
        color: "#404040"
        font.pixelSize: _root.__textFontSize
        visible: _root.isInputting
        anchors.left: parent.left ; anchors.leftMargin: 5
        anchors.bottom: _root.bottom ;  anchors.bottomMargin: 0
    }
    Text {
        id: _txt_hint
        text: _root.__textHint
        font.pixelSize: _root.__textFontSize
        color: "#A0A0A0"
        visible: !_root.isInputting
        anchors.left: parent.left ; anchors.leftMargin: 5
        anchors.bottom: _root.bottom ;  anchors.bottomMargin: 0
    }
    E_HorizentalLine {
        id: _botLine
        lineRange: _root.__textWidth + 20
        anchors.bottom: _root.bottom
    }
    MouseArea {
        id: _mouMain
        anchors.fill: parent
        onClicked: {
            console.log('TextInput is clicked')
            _root.isInputting = true
            __textValue += "a";
        }
    }
    Rectangle {
        id: _aniInput
        color: "gray"
        height: _txt_val.height ; width: 1
        visible: _root.isInputting
        anchors.left: _txt_val.right ; anchors.leftMargin: 1
        anchors.verticalCenter: _txt_val.verticalCenter
    }
    NumberAnimation { id: _ani ; loops: Animation.Infinite ; target: _aniInput; property: "visible"; from: 0.0; to: 1.0; duration: 1000 }
    onIsInputtingChanged: {
        if (_root.isInputting)
            _ani.restart()
    }
    onFocusChanged: {
        if (focus === false)
            isInputting = false
    }
}
