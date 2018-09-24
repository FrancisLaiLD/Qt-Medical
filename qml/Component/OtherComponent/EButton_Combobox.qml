import QtQuick 2.0

Rectangle {
    id: _root

    property int cbbWidth: 100
    property int cbbHeight: 25
    property string btnLabel: "Unknow button"
    property string btnLabelColor: "#310552"
    property string btnColorTop: "#808080"
    property string btnColorBottom: "white"
    property string btnColorPress: "#B79612"
    property string btnBorderColor: "#053E42"
    property bool showItems: false
    property int centerBtnX: -1
    property int centerBtnY: -1
    property bool __isShowDropDown: false
    property int curIndex: 1
    property string curVal: ""
    property var __listModel
    width: cbbWidth ; height: cbbHeight
    radius: 6
    color: AppValueConst.item_select_color
    Text {
        id: _txtCurItem
        text: curVal
        font.pixelSize: 15
        anchors.centerIn: parent
    }
    Image {
        id: _imgDropDown
        source: Resource_General.ico_drop_down_16
        anchors.right: parent.right ; anchors.rightMargin: 4
        anchors.verticalCenter: parent.verticalCenter
    }
    MouseArea {
        id: _cbbMou
        anchors.fill: parent
        onClicked: __isShowDropDown = !__isShowDropDown
    }

    ListView {
        id: lsvCbb
        anchors.top: parent.bottom ; anchors.topMargin: 2
        spacing: 1
        clip: true
        width: parent.width ; height: contentHeight
        visible: __isShowDropDown
        model: __listModel
        delegate: Rectangle {
            id: idRectDel
            width: parent.width ; height: _root.height
            radius: 6
            color: _itemMou.pressed ? "#00C5FF" : (index === _root.curIndex ? AppValueConst.item_select_color : (index%2 === 0 ? "#CDCDCD" : "#E0E0E0"))
            opacity: 1.0
            Text {
                id: _txtItemName
                text: name
                font.pixelSize: 15
                anchors.centerIn: parent
            }
            MouseArea {
                id: _itemMou
                anchors.fill: parent
                onClicked: {
                    _root.__isShowDropDown = false
                    lsvCbb.currentIndex = index
                    _root.curIndex = index
                    _root.curVal = name
                }
            }
        }
    }
    Component.onCompleted: {
        _root.curIndex = 0
        lsvCbb.currentIndex = _root.curIndex
        _root.curVal = __listModel.get(0).name

    }
}
