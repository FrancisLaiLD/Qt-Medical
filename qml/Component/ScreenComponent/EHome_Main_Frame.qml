import QtQuick 2.0

Rectangle {
    id:idRoot
    property string scrrenBgImg: ""
    property string screenTitle: ""
    width: 720
    height: 1080 - 60
    color: "transparent"

    Image {
        id: idMainImg
        source: idRoot.scrrenBgImg
        anchors.fill: parent
    }

    Text {
        id: idTitleScreen
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 5
        font.pixelSize: HomeScreenConst.title_screen_size
        text: idRoot.screenTitle
    }

}
