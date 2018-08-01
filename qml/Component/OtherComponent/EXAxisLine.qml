import QtQuick 2.0

E_HorizentalLine {
    id: idRoot
    property int resolution: 5
    property int maxValue: 100
    property int axisRange: 100
//    property int bottomSize: resText.height
    lineColor: "gray"
    lineHeight: 2
    lineRange: axisRange
    Row {
        //        spacing: parent.width/resolution
        Repeater {
            model: resolution + 1
            Item {
                property int val: index*20
                E_VerticalLine {
                    id: resLine
                    anchors.bottom: parent.bottom
                    x: index* (idRoot.width - 30)/idRoot.resolution
                    lineColor: "black"
                    lineRange: 5
                }
                Text {
                    id: resText
                    text: maxValue/resolution* index
                    anchors.top: parent.bottom
                    anchors.topMargin: 5
                    anchors.horizontalCenter: resLine.horizontalCenter
                }
            }
        }
    }
    Component.onCompleted: {
        console.log('width: ' + idRoot.width)
    }

}
