import QtQuick 2.0

Rectangle {
    id: _root

    property int cbbWidth: 180
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
    property string curVal: ""
    property int __year     : 1990
    property int __month    : 01
    property int __day      : 01
    width: cbbWidth ; height: cbbHeight
    radius: 6
    color: "#D6DDD7"
    Text {
        id: _txtCurYear
        text: (__year !== -1 ? __year : "----") + "  /  " + (__month > 9 ? __month : '0' + __month) + "  /  " + (__day > 9 ? __day : '0' + __day)
        font.pixelSize: 15
        anchors.centerIn: parent
    }
    MouseArea {
        id: _cbbMou
        anchors.fill: parent
        onClicked: __isShowDropDown = !__isShowDropDown
    }
    ListModel {
        id: _modelYear
    }
    ListModel {
        id: _modelMonth
    }
    ListModel {
        id: _modelDay
    }
    function createModels() {
        for (var i= 0; i<= 88; i++)
            _modelYear.append({"name" : 1930 + i})
        for (var j= 1; j< 13; j++ )
            _modelMonth.append({"name" : j})
        for (var k= 1; k<= 31; k++ )
            _modelDay.append({"name" : k})
    }

    ListView {
        id: lsvCbbYear
        anchors.top: parent.bottom ; anchors.topMargin: 2
        spacing: 2
        width: parent.width/3 ; height: cbbHeight* 5
        visible: __isShowDropDown
        model: _modelYear
        clip: true ; snapMode: ListView.SnapToItem
        delegate: Rectangle {
            id: idRectDel
            width: parent.width ; height: _root.height
            radius: 6
            color:  index === lsvCbbYear.currentIndex ? AppValueConst.item_select_color : (index%2 === 0 ? "#CDCDCD" : "#E0E0E0")
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
                    _root.__year = index + 1930
                    lsvCbbYear.currentIndex = index
                }
            }
        }
        Component.onCompleted: {
            lsvCbbYear.currentIndex = 60
        }
    }
    ListView {
        id: lsvCbbMonth
        anchors.top: parent.bottom ; anchors.topMargin: 2
        spacing: 2
        width: parent.width/3 ; height: cbbHeight* 5
        anchors.left: lsvCbbYear.right
        visible: __isShowDropDown
        model: _modelMonth
        clip: true ; snapMode: ListView.SnapToItem
        delegate: Rectangle {
            id: idRectDelMonth
            width: parent.width ; height: _root.height
            radius: 6
            color: index === lsvCbbMonth.currentIndex ? AppValueConst.item_select_color : (index%2 === 0 ? "#CDCDCD" : "#E0E0E0")
            opacity: 1.0
            Text {
                id: _txtItemNameMonth
                text: name < 10 ? '0' + name : name
                font.pixelSize: 15
                anchors.centerIn: parent
            }
            MouseArea {
                id: _itemMouMonth
                anchors.fill: parent
                onClicked: {
                    lsvCbbMonth.currentIndex = index
                    _root.__month = index + 1
                }
            }
        }
    }
    ListView {
        id: lsvCbbDay
        anchors.top: parent.bottom ; anchors.topMargin: 2
        spacing: 2
        width: parent.width/3 ; height: cbbHeight* 5
        anchors.left: lsvCbbMonth.right
        visible: __isShowDropDown
        model: _modelDay
        clip: true ; snapMode: ListView.SnapToItem
        delegate: Rectangle {
            id: idRectDelDay
            width: parent.width ; height: _root.height
            radius: 6
            color: index === lsvCbbDay.currentIndex ? AppValueConst.item_select_color : (index%2 === 0 ? "#CDCDCD" : "#E0E0E0")
            opacity: 1.0
            Text {
                id: _txtItemNameDay
                text: name < 10 ? '0' + name : name
                font.pixelSize: 15
                anchors.centerIn: parent
            }
            MouseArea {
                id: _itemMouDay
                anchors.fill: parent
                onClicked: {
                    lsvCbbDay.currentIndex = index
                    _root.__day = index + 1
                }
            }
        }
    }

    Component.onCompleted: {
        createModels()
//        _root.curIndex = 0
//        _root.curVal = __listModel[0].name
//        _root.__year    = _modelYear[0]
//        _root.__month   = _modelMonth[0].name
//        _root.__day     = _modelDay[0].name
         lsvCbbMonth.currentIndex = 0 ; lsvCbbDay.currentIndex = 0;
    }
}
