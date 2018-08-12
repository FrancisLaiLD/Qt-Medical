import QtQuick 2.0
import "../OtherComponent"

Rectangle {
    id: _root
    width: parent.width - 100 ; height: parent.height
//    gradient:
//        Gradient {
//        GradientStop { position: 1.0; color: "white" }
//        GradientStop { position: 0.0; color: "#AAAAAA"}
//    }
    color: "transparent"
    Rectangle {
        id: _curDevs
        width: parent.width ;
        height: lsv.height + _txt_title_curDev.height +
                txt_device_name .height+ 10 + 15 + 15 + 10
        color: "transparent"
        anchors.top: parent.top
        Text {
            id: _txt_title_curDev
            text: "Device connected" ; font.underline: false
            font.pixelSize: 18
            color: AppValueConst.value_popup_color
            anchors.top: parent.top ; anchors.topMargin: 0
            anchors.left: parent.left ; anchors.leftMargin: 5
        }
        Text {
            id: txt_device_name
            anchors.top: _txt_title_curDev.bottom ; anchors.topMargin: 10
            anchors.left: parent.left ; anchors.leftMargin: 40
            text: "Device name"
            font.pixelSize: 14
            color: AppValueConst.line_normal_color
        }
        Text {
            id: txt_device_state
            anchors.verticalCenter: txt_device_name.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 300
            text: "State"
            font.pixelSize: 14
            color: AppValueConst.line_normal_color
        }
        Text {
            id: txt_device_last_conn
            anchors.verticalCenter: txt_device_name.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 365
            text: "Last connection"
            font.pixelSize: 14
            color: AppValueConst.line_normal_color
        }
        Text {
            id: txt_device_detail
            anchors.verticalCenter: txt_device_name.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 500
            text: "Manufacturer"
            font.pixelSize: 14
            color: AppValueConst.line_normal_color
        }

        ListView {
            id: lsv
            anchors.top: txt_device_last_conn.bottom
            anchors.topMargin: 5
            clip: true
            spacing: 3
            interactive: true
            width: parent.width; height: contentHeight
            model: listDevice
            delegate: Rectangle {
                id: idDelegate
                visible: proState
                width: parent.width
                height: proState ? 45 : 0
                color: "#CDCDCD"
                opacity: 0.8
                Text {
                    id: idTxt_device_name
                    text: proName
                    font.pixelSize: 15 ; font.italic: false
                    color: AppValueConst.text_screen_color
                    x: txt_device_name.x
                    anchors.verticalCenter: parent.verticalCenter
                }
                Image {
                    id: idImgState
                    x: txt_device_state.x
                    anchors.verticalCenter: parent.verticalCenter
                    source: proState ? Resource_General.btn_state_on : Resource_General.btn_state_off
                    width: parent.height ; height: parent.height
                }
                Text {
                    id: idTxt_device_lastConn
                    text: proState ? "online" : Qt.formatDateTime(proLastConn, "yyyy.MM.dd") + " - "+ Qt.formatDateTime(proLastConn, "hh:mm AP")
                    font.pixelSize: 15
                    color: proState ? "green" : AppValueConst.text_screen_color
                    x: txt_device_last_conn.x
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    id: _manu_val
                    text: proManufact
                    font.pixelSize: 15
                    x: txt_device_detail.x
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
        E_HorizentalLine {
            id: _firstLine
            lineRange: parent.width - 160
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    Rectangle {
        id: _disDevs
        width: parent.width ;
        height: _txt_title_disDev.height + txt_device_name_d.height + _lsvDisDev.height
                + 10 + 15 + 15 + 10
        color: "transparent"
        anchors.top: _curDevs.bottom ; anchors.topMargin: 10
        Text {
            id: _txt_title_disDev
            text: "Device not connected"
            font.pixelSize: 18 ; font.underline: false
            color: AppValueConst.value_popup_color
            anchors.top: parent.top ; anchors.topMargin: 10
            anchors.left: parent.left ; anchors.leftMargin: 5
        }
        Text {
            id: txt_device_name_d
            anchors.top: _txt_title_disDev.bottom ; anchors.topMargin: 10
            anchors.left: parent.left ; anchors.leftMargin: 40
            text: "Device name"
            font.pixelSize: 14
            color: AppValueConst.line_normal_color
        }
        Text {
            id: txt_device_state_d
            anchors.verticalCenter: txt_device_name_d.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 300
            text: "State"
            font.pixelSize: 14
            color: AppValueConst.line_normal_color
        }
        Text {
            id: txt_device_last_conn_d
            anchors.verticalCenter: txt_device_name_d.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 365
            text: "Last connection"
            font.pixelSize: 14
            color: AppValueConst.line_normal_color
        }
        Text {
            id: txt_device_detail_d
            anchors.verticalCenter: txt_device_name_d.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 550
            text: "Manufacturer"
            font.pixelSize: 14
            color: AppValueConst.line_normal_color
        }
        ListView {
            id: _lsvDisDev
            anchors.top: txt_device_last_conn_d.bottom
            anchors.topMargin: 5
            spacing: 3 ; clip: true
            interactive: true
            width: parent.width ; height: contentHeight
            model: listDevice
            delegate: Rectangle {
                id: idDelegate_d
                visible: !proState
                width: parent.width
                height: !proState ? 45 : 0
                color: "#E0E0E0"
                opacity: 0.8
                Text {
                    id: idTxt_device_name_d
                    text: proName
                    font.pixelSize: 15 ; font.italic: false
                    color: AppValueConst.text_screen_color
                    x: txt_device_name_d.x
                    anchors.verticalCenter: parent.verticalCenter
                }
                Image {
                    id: idImgState_d
                    x: txt_device_state_d.x
                    anchors.verticalCenter: parent.verticalCenter
                    source: proState ? Resource_General.btn_state_on : Resource_General.btn_state_off
                    width: parent.height ; height: parent.height
                }
                Text {
                    id: idTxt_device_lastConn_d
                    text: proState ? "online" : Qt.formatDateTime(proLastConn, "yyyy.MM.dd") + " - "+ Qt.formatDateTime(proLastConn, "hh:mm AP")
                    font.pixelSize: 15
                    color: proState ? "green" : AppValueConst.text_screen_color
                    x: txt_device_last_conn_d.x
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
        E_HorizentalLine {
            id: _firstLine_d
            lineRange: parent.width - 160
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    Rectangle {
        id: _allDev
        width: parent.width ;
        height: parent.height - _curDevs.height - _disDevs.height
        color: "transparent"
        anchors.top: _disDevs.bottom ; anchors.topMargin: 10
        Text {
            id: _txt_title_allDev
            text: "Choose devices in main screen"
            font.pixelSize: 18 ; font.underline: false
            color: AppValueConst.value_popup_color
            anchors.top: parent.top ; anchors.topMargin: 10
            anchors.left: parent.left ; anchors.leftMargin: 5
        }
        ListView {
            id: _lsvAllDev1
            anchors.top: _txt_title_allDev.bottom
            anchors.topMargin: 15
            anchors.left: parent.left ; anchors.leftMargin: 15
            spacing: 3
            clip: true
            interactive: true
            width: parent.width/2 - 30; height: contentHeight
            model: listDevice
            delegate: Rectangle {
                id: idDelegate_a
                property bool isPressed: false
                visible: index%2 === 0
                width: parent.width ; height: visible ? 45 : 0 ; radius: 6
                color: isPressed ? "#A0A0A0" : "#E0E0E0" ; opacity: 0.8
                Image {
                    id: _checkBoxA1
                    source: proShowInMain ? Resource_General.ico_checkbox_check : Resource_General.ico_checkbox_uncheck
                    width: parent.height - 15 ; height: parent.height - 15
                    anchors.left: parent.left ; anchors.leftMargin: 5
                    anchors.verticalCenter: idTxt_device_name_a.verticalCenter
                }
                Text {
                    id: idTxt_device_name_a
                    text: proName
                    font.pixelSize: 15 ; font.italic: false
                    color: AppValueConst.text_screen_color
                    anchors.left: parent.left ; anchors.leftMargin: 45
                    anchors.verticalCenter: parent.verticalCenter
                }
                Image {
                    id: idImgState_a
                    anchors.right: parent.right ; anchors.rightMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    source: proState ? Resource_General.btn_state_on : Resource_General.btn_state_off
                    width: parent.height ; height: parent.height
                }
                MouseArea {
                    id: _mouSetMain
                    anchors.fill: parent
                    onPressed: {
                        idDelegate_a.isPressed = true
                    }
                    onExited: {
                        idDelegate_a.isPressed = false
                    }
                    onCanceled: {
                        idDelegate_a.isPressed = false
                    }
                    onReleased: {
                        if (idDelegate_a.isPressed === true) {
                            idDelegate_a.isPressed = false
                            proShowInMain = !proShowInMain
                            console.log('pro Show in main:' + proShowInMain)
                        }
                    }
                }
            }
        }
        ListView {
            id: _lsvAllDev2
            anchors.top: _lsvAllDev1.top
            anchors.left: _lsvAllDev1.right ; anchors.leftMargin: 15
            spacing: 3
            clip: true
            interactive: true
            width: parent.width/2 - 30; height: contentHeight
            model: listDevice
            delegate: Rectangle {
                id: idDelegate_a2
                property bool isPressed: false
                visible: index%2 === 1
                width: parent.width ; height: visible ? 45 : 0 ; radius: 6
                color: isPressed ? "#A0A0A0" : "#E0E0E0" ; opacity: 0.8
                Image {
                    id: _checkBoxA2
                    source: proShowInMain ? Resource_General.ico_checkbox_check : Resource_General.ico_checkbox_uncheck
                    width: parent.height - 15 ; height: parent.height - 15
                    anchors.left: parent.left ; anchors.leftMargin: 5
                    anchors.verticalCenter: idTxt_device_name_a2.verticalCenter
                }
                Text {
                    id: idTxt_device_name_a2
                    text: proName
                    font.pixelSize: 15 ; font.italic: false
                    color: AppValueConst.text_screen_color
                    anchors.left: parent.left ; anchors.leftMargin: 45
                    anchors.verticalCenter: parent.verticalCenter
                }
                Image {
                    id: idImgState_a2
                    anchors.right: parent.right ; anchors.rightMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    source: proState ? Resource_General.btn_state_on : Resource_General.btn_state_off
                    width: parent.height ; height: parent.height
                }
                MouseArea {
                    id: _mouSetMain2
                    anchors.fill: parent
                    onPressed: {
                        idDelegate_a2.isPressed = true
                    }
                    onExited: {
                        idDelegate_a2.isPressed = false
                    }
                    onCanceled: {
                        idDelegate_a2.isPressed = false
                    }
                    onReleased: {
                        if (idDelegate_a2.isPressed === true) {
                            idDelegate_a2.isPressed = false
                            proShowInMain = !proShowInMain
                            console.log('pro Show in main:' + proShowInMain)
                        }
                    }
                }
            }
        }
        //        E_HorizentalLine {
        //            id: _end
        //            lineRange: parent.width - 100
        //            anchors.bottom: parent.bottom
        //            anchors.horizontalCenter: parent.horizontalCenter
        //        }
    }
}
