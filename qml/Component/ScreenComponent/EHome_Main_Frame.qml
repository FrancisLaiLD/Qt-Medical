import QtQuick 2.0

Rectangle {
    id:idRoot
    property string backgroundImage: ""
    width: 720
    height: 1015
    color: "transparent"

    Image {
        id: idMainImg
        source: idRoot.backgroundImage
    }


}
