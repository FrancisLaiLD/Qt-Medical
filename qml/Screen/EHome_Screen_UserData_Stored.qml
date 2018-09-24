import QtQuick 2.0

import Ehome 1.0
import "../Component/ScreenComponent"
import "../Component/ListViewComponent"
import "../Component/DelegateComponent"
import "../Component/OtherComponent"

EHome_Main_Frame {
    id:_root
    property bool _isSendingData: false
    ParallelAnimation {
        id: idMainAnimation
        running: false
        NumberAnimation { target: _root; property: "x"; from: -720; to: 0; duration: AppValueConst.time_screen_trans }
        NumberAnimation { target: _root; property: "opacity"; from: 0.0 ;to: 1.0; duration: AppValueConst.time_screen_trans }
    }
    screenTitle: AppStringConst.STR_USER_DATA
    //    backgroundImage:

    EChart_UserData {
        id: _DataChart
        yAxisName: AppStringConst.STR_HOME_WEATHER_CELCIUS_DEGREE
        xAxisName: "Time"
        chartWidth: parent.width - 100 ;  chartHeight: parent.height/2 - 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top ; anchors.topMargin: 50
    }


    EButton_StandAlone {
        id: _btnSwitchRealTime
        anchors.right: parent.right ; anchors.rightMargin: 10
        anchors.top: parent.top ; anchors.topMargin: 20
        btnLabel: "Take a new record" ; btnWidth: 200
        onBtnClicked: {
            switch(_chooseData.curIndex) {
            case 0:
                console.log('qml> Go to take new record')
                AppManager.handleTransScreen(HomeEnum.EVENT_GOTO_COMMAND_TEMPMEASURE)
                return
            case 1:
                console.log('qml> Go to take new record')
                AppManager.handleTransScreen(HomeEnum.EVENT_GOTO_COMMAND_WEIGHTDIAMETTER)
                return
            case 2:
                console.log('qml> Go to take new record')
                AppManager.handleTransScreen(HomeEnum.EVENT_GOTO_COMMAND_BLOODPRESSMEASURE)
                return
            }

        }
    }

    E_HorizentalLine {
        id: _endlineChart
        anchors.top:_DataChart.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        lineHeight: 1
        lineRange: parent.width - 60
    }

    //    EChart_Weather {
    //        id: idDryChart
    //        anchors.top: idFirstLine.bottom
    //        anchors.topMargin: 30
    //        anchors.horizontalCenter: parent.horizontalCenter
    //        chartWidth: parent.width - 60
    //        chartHeight: parent.height/2 - 60
    //    }
    Rectangle {
        id: _bgSendData
        anchors.fill: parent
        color: "gray" ; opacity: 0.72
        visible: _isSendingData
        MouseArea {
            id: _preventMou
            anchors.fill: parent
            onClicked: {
                if (_root._isSendingData)
                    _root._isSendingData = false
            }
        }
    }
    Rectangle {
        id: _userData
        width: parent.width ; height: 600 ; radius: 16
//        color: _root._isSendingData ? "#060606" : "transparent"
//        opacity: _root._isSendingData ? 0.72 : 1.0
//        gradient:
//            Gradient {
//            GradientStop { position: 0.0; color: _isSendingData ? "#808080" : "transparent" }
//            GradientStop { position: 1.0; color: _isSendingData ? "white"   : "transparent"}
//        }
        color: "transparent"
        y: _endlineChart.y + 20
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id: _title
            text: AppStringConst.STR_USER_DATA_YOUR_DATA
            font.pixelSize: 20 ; font.underline: true
            anchors.left: _userData.left ; anchors.leftMargin: 20
            anchors.top: _userData.top ; anchors.topMargin: 10
        }

        ListModel {
            id: _modTypeData
            ListElement {name : "Temperature"}
            ListElement {name : "Weight"}
            ListElement {name : "Height"}
            ListElement {name : "Blood pressure"}
        }

        EButton_Combobox {
            id: _chooseData
            cbbHeight: 30 ; cbbWidth: 150
            z: 100
            anchors.left: _title.right ; anchors.leftMargin: _isSendingData ? 350 : 120
            anchors.top: parent.top ; anchors.topMargin: 0
            __listModel: _modTypeData
    //        Component.onCompleted: {
    //            curIndex = 2
    //            curVal = _modTypeData.get(curIndex).name
    //        }
        }

        EButton_StandAlone {
            id: _btnShowSendData
            anchors.top: _title.top
            anchors.right: _userData.right ; anchors.rightMargin: 10
            btnLabel: AppStringConst.STR_USER_DATA_SEND_TO_DOCTOR
            btnWidth: 150
            visible: !_root._isSendingData
            onBtnClicked: {
                if (StatusbarModel.networkState === 0)
                    AppManager.handleShowPopup(HomeEnum.EVENT_SHOW_POPUP_NO_CONNECTION)
                else {
//                    AppManager.handleShowPopup(HomeEnum.EVENT_SHOW_POPUP_NO_CONNECTION)
                    _root._isSendingData = !_root._isSendingData
                }
            }
        }

        Text {
            id: _noRecord
            text: "You do not have any record"
            font.pixelSize: 18 ;
            color: "gray"
            visible: ListUserData.isEmpty
            anchors.verticalCenter: parent.top ; anchors.verticalCenterOffset: 200
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Item {
            id: _headerData
            width: _listUserData.width
            visible: !ListUserData.isEmpty
            anchors.top: _title.bottom ; anchors.topMargin: 20
            Text {
                id: _tempTitle
                text: "Temperature" + " (oC)"
                font.pixelSize: 15
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left ; anchors.leftMargin: 50
            }
//            Text {
//                id: _weightTitle
//                text: "Weight" + " (kg)"
//                font.pixelSize: 15
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.left: parent.left ; anchors.leftMargin: 210
//            }
            Text {
                id: _timeGetRecordTitle
                text: "Time get record"
                font.pixelSize: 15
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: _isSendingData ? 290 : 390
            }
        }

        ListView {
            id: _listUserData
            width: parent.width ; height: contentHeight
            anchors.top: _headerData.bottom ; anchors.topMargin: 15
            spacing: 5 ; clip: true
            model: ListUserData
            delegate: Item {
                width: parent.width ; height: 45
                Rectangle {
                    id: _delRect
                    color: index%2 === 0 ? "#E76D00" : "#F1A500" ; opacity: 0.3
                    anchors.fill: parent
                }
                Text {
                    id: _tempVal
                    text: dataTemp.toFixed(1)
                    font.pixelSize: 15
                    anchors.verticalCenter: parent.verticalCenter
                    x: _tempTitle.x
                }
//                Text {
//                    id: _weightVal
//                    text: dataWeight
//                    font.pixelSize: 15
//                    anchors.verticalCenter: parent.verticalCenter
//                    x: _weightTitle.x
//                }
                Text {
                    id: _timeGetRecordVal
                    text: Qt.formatDateTime(dataTimeCreate, "ddd, MMMM dd - hh:mm AP")
                    font.pixelSize: 15
                    anchors.verticalCenter: parent.verticalCenter
                    x: _timeGetRecordTitle.x
                }
            }
        }
        EButton_StandAlone {
            id: _btnSendData
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            btnLabel: "Send" ; btnLabelFont: 16 ; btnWidth: 180 ; btnHeight: 50
            visible: _root._isSendingData
            onBtnClicked: {
                if (StatusbarModel.networkState === 0)
                    AppManager.handleShowPopup(HomeEnum.EVENT_SHOW_POPUP_NO_CONNECTION)
                else {
//                    AppManager.handleShowPopup(HomeEnum.EVENT_SHOW_POPUP_NO_CONNECTION)
                    _root._isSendingData = !_root._isSendingData
                }
            }
        }
    }
    ParallelAnimation {
        id: _aniShow
        NumberAnimation { target: _userData; property: "y";             from: _endlineChart.y + 20 ;to: 350;        duration: AppValueConst.time_screen_show_popup}
        ColorAnimation  { target: _userData; property: "color";         from: "transparent" ;       to: "#5695D5";  duration: AppValueConst.time_screen_show_popup}
//        NumberAnimation { target: _userData; property: "opacity";       from: 1.0;                  to: 0.72;       duration: AppValueConst.time_screen_trans }
    }
    ParallelAnimation {
        id: _aniHide
        NumberAnimation { target: _userData; property: "y";             from: 350 ;         to: _endlineChart.y + 20;        duration: AppValueConst.time_screen_show_popup}
        ColorAnimation  { target: _userData; property: "color";         from: "#5695D5" ;   to: "transparent";      duration: AppValueConst.time_screen_show_popup}
//        NumberAnimation { target: _userData; property: "opacity";       from: 0.72;          to: 1.0;               duration: AppValueConst.time_screen_trans }
    }
    on_IsSendingDataChanged: {
        _chooseData.__isShowDropDown = false
        if (_isSendingData) {
            _aniShow.start()
        }
        else {
            _aniHide.start()
        }
    }

    Component.onCompleted: {
        idMainAnimation.start()
        _chooseData.curIndex = 0
    }
}


