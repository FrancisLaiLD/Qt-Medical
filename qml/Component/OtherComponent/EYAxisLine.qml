import QtQuick 2.0

E_VerticalLine {
    id: idRoot
    property int resolution: 5
    property int maxValue: 100
    property int axisRange: 100
    property int virtualLineRange: 400
    property int startValue: 0
    lineColor: "black"
    lineWidth: 2
    lineRange: axisRange
    Column {
//        spacing: parent.width/resolution
        Repeater {
            model: resolution
            Item {
                E_HorizentalLine {
                    id: resLine
                    anchors.left: parent.right
                    y: index* idRoot.lineRange/idRoot.resolution
                    lineColor: "black"
                    lineRange: 5
                }
                Text {
                    id: resText
                    text: maxValue/resolution* (resolution - index) + startValue
                    anchors.right: parent.left
                    anchors.rightMargin: 3
                    anchors.verticalCenter: resLine.verticalCenter
                }
                E_HorizentalLine {
                    id: resVirtualLine
                    anchors.left: parent.right
                    anchors.leftMargin: 0
                    y: index* idRoot.lineRange/idRoot.resolution
                    lineColor: HomeScreenConst.line_normal_color
                    lineRange: virtualLineRange
                }
            }
        }
    }
    Component.onCompleted: {
        console.log('width: ' + idRoot.width)
    }
}
