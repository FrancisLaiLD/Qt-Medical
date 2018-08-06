import QtQuick 2.0

Rectangle {
    id: idRoot
    property int cbbWidth: 100
    property int cbbHeight: 300
    property string btnLabel: "Unknow button"
    property string btnLabelColor: "#310552"
    property string btnColorTop: "#808080"
    property string btnColorBottom: "white"
    property string btnColorPress: "#B79612"
    property string btnBorderColor: "#053E42"
    property bool showItems: false
    property int centerBtnX: -1
    property int centerBtnY: -1
    width: cbbWidth ; height: cbbHeight

    ListView {
        id: lsvCbb
        anchors.fill: parent
        visible: true
        model: 5
        delegate: Rectangle {
            id: idRectDel
            width: parent.width
            height: parent.height/model
            color: "red"
            opacity: 0.8
        }
    }

}
