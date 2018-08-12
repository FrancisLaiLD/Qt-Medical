import QtQuick 2.0

Rectangle {
    id: _root

    property int     __cbbWidth: 100
    property int     __cbbHeight: 100
    property int     __delWidth: 60
    property int     __delHeight: 60
    property bool    __showItems: false
    property bool    __isShowDropDown: false
    property int     __curIndex: 0
    property string  __curImgLink: ""
    property var     __listModel
    width: __cbbWidth ; height: __cbbHeight
    border.width: 1 ; radius: 6
    color: "#D6DDD7"
    Image {
        id: _rootImg
        width: __cbbWidth - 5 ; height: __cbbHeight - 5
        anchors.centerIn: parent
        source: _root.__curImgLink
    }
    Image {
        id: _subEditImg
        //                width: 100 ; height: 100
        source: Resource_General.ico_edit_16_gray
        anchors.top: parent.top ; anchors.topMargin: 2
        anchors.right: parent.right ; anchors.rightMargin: 2
    }
    MouseArea {
        id: _cbbMou
        anchors.fill: parent
        onClicked: __isShowDropDown = !__isShowDropDown
    }

    Rectangle {
        id: _rectGrid
        anchors.top: parent.bottom ; anchors.topMargin: 0
        anchors.right: parent.right
        width: _root.__delWidth* 5 ; height: _root.__delWidth*2
        color: "#E0E0E0" ; opacity: 0.8
        visible: __isShowDropDown
    }
        GridView {
            id: lsvCbb
            anchors.fill: _rectGrid
            visible: __isShowDropDown
            cellHeight: _root.__delHeight ; cellWidth: _root.__delWidth
            model: __listModel
            snapMode: GridView.SnapOneRow
            clip: true
            delegate: Rectangle {
                id: idRectDel
                width: _root.__delWidth - 5 ; height: _root.__delHeight - 5
                radius: 6
                color: index%2 === 0 ? "#CDCDCD" : "#E0E0E0"
                opacity: 1.0
                Image {
                    id: _delImage
                    width: _root.__delWidth -10 ; height: _root.__delHeight -10
                    anchors.centerIn: parent
                    source: linkImg
                }
                MouseArea {
                    id: _itemMou
                    anchors.fill: parent
                    onClicked: {
                        __curImgLink = linkImg
                    }
                }
            }
        }
    Component.onCompleted: {

    }
}
