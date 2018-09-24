import QtQuick 2.0

Rectangle {
    id:idRoot
    property string scrrenBgImg: ""
    property string screenTitle: ""
    property int __titleMarginTop: 5
    width: 720
    height: 1280 - 60
    color: "transparent"

//    Image {
//        id: idMainImg
//        source: idRoot.scrrenBgImg
//        anchors.fill: parent
//        opacity: 0.8
//        fillMode: Image.PreserveAspectCrop
//    }

    Text {
        id: idTitleScreen
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: __titleMarginTop
        font.pixelSize: AppValueConst.title_screen_size
        text: idRoot.screenTitle
    }

}
