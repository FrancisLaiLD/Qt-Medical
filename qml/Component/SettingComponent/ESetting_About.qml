import QtQuick 2.0
import "../OtherComponent"

Rectangle {
    id: _root
    width: 660 ; height: 800
    color: "transparent"
//    opacity: 0.3
    Item {
        id: _version
        width: parent.width
        height: _versionTit.height + _verContent.height + 30 + 30
        Text {
            id: _versionTit
            text: "Version info"
            font.pixelSize: 18 ; color: AppValueConst.value_popup_color
            anchors.top: parent.top ; anchors.topMargin: 10
            anchors.left: parent.left ; anchors.leftMargin: 10
        }
        // content
        Text {
            id: _verContent
            text: "Thank you for using our production" +  "\n" +
                  "EHome Care version " + /*SettingModel.version*/ "v1.0" + "
An production of Lida Company, Ltd.Co"
            lineHeight: 2
            font.pixelSize: 15 ; color: "#404040"
            anchors.top: _versionTit.bottom ; anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        E_HorizentalLine {
            id: _endLineVer
            lineRange: parent.width - 160
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }
    }
    Item {
        id: _trademark
        width: parent.width
        height: 300
        anchors.top: _version.bottom ; anchors.topMargin: 10
        Text {
            id: _trademarkTit
            text: "Trademark"
            font.pixelSize: 18 ; color: AppValueConst.value_popup_color
            anchors.top: parent.top ; anchors.topMargin: 0
            anchors.left: parent.left ; anchors.leftMargin: 10
        }
        E_HorizentalLine {
            id: _endLineTra
            lineRange: parent.width - 160
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }
    }
}
