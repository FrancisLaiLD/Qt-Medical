import QtQuick 2.0
import "../OtherComponent"

Rectangle {
    id: _root
    gradient:
        Gradient {
        GradientStop { position: 0.0; color: "#808080" }
        GradientStop { position: 1.0; color: "white" }
    }
    property int __popupType: -1
    property int __popupWidth: 560
    property int __popupHeight: 400
    property string __popupTitle: AppStringConst.STR_GENERAL_UNDEFINE
    property real __startContent: _title.height + 20
    property int __lineTitleWidth: -1
    width: __popupWidth ; height: __popupHeight
    radius: 15
    opacity: 1.0

    MouseArea {
        id: idMouInsideRect
        anchors.fill: parent
    }
    function getPopupIcon() {
        switch (__popupType) {
        case 0: // error popupTitle
            return Resource_General.ico_error_64
        case 1: // warning popupTitle
            return Resource_General.ico_caution_64
        case 2: // info popupType
            return Resource_General.ico_info_64
        default:
            return ""
        }
    }

    Item {
        id: _title
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top ; anchors.topMargin: 20
        height: popupTitle.height + 10 ; width: parent.width
        Text {
            id: popupTitle
            font.pixelSize: 24
            color: AppValueConst.value_popup_color
            text: idRoot.__popupTitle
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Image {
            id: _popupStyle
            source: getPopupIcon()
            width: 36 ; height: 36
            anchors.verticalCenter: popupTitle.verticalCenter
            anchors.right: popupTitle.left ; anchors.rightMargin: 10
        }
        E_HorizentalLine {
            id: _endLineTit
            anchors.bottom: _title.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            lineColor: "black"
            lineHeight: 1
            lineRange: __lineTitleWidth
        }
    }
    //    Item {
    //        id: _content
    //        anchors.horizontalCenter: parent.horizontalCenter
    //        anchors.top: parent.top ;anchors.topMargin: 20
    //        Text {
    //            id: _content
    //            font.pixelSize: 24
    //            color: AppValueConst.value_popup_color
    //            text: idRoot.popupTitle
    //        }

    //        E_HorizentalLine {
    //            id: _endLineontent
    //            anchors.bottom: parent.bottom
    //            anchors.horizontalCenter: parent.horizontalCenter
    //            lineColor: "black"
    //            lineHeight: 5
    //            lineRange: parent - 30
    //        }
    //    }
    NumberAnimation {
        id: idShowAni
        target: _root; property: "opacity"; from: 0.0; to: 1.0; duration: AppValueConst.time_screen_show_popup }
    NumberAnimation {
        id: idHideAni
        target: _root; property: "opacity"; from: 1.0; to: 0.0; duration: AppValueConst.time_screen_show_popup }

    Component.onCompleted: {
//        idShowAni.start()
    }
    Component.onDestruction: {
//        idHideAni.start()
    }

}
