import QtQuick 2.0


Rectangle {
    id: _root
    width: 660 ; height: 800
//    color: "yellow"
//    opacity: 0.3

    Text {
        id: txt_device_name
        anchors.top: parent.top ; anchors.topMargin: 60
        anchors.left: parent.left ; anchors.leftMargin: 40
        text: "Device name"
        font.pixelSize: 14
        color: HomeScreenConst.line_normal_color
    }
    Text {
        id: txt_device_state
        anchors.verticalCenter: txt_device_name.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 350
        text: "State"
        font.pixelSize: 14
        color: HomeScreenConst.line_normal_color
    }
    Text {
        id: txt_device_last_conn
        anchors.verticalCenter: txt_device_name.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 500
        text: "Last connection"
        font.pixelSize: 14
        color: HomeScreenConst.line_normal_color
    }

    ListView {
        id: lsv
        anchors.top: _root.top
        anchors.topMargin: 100
        spacing: 5
        interactive: true
        width: parent.width ; height: contentHeight
        model: listDevice
        delegate: Rectangle {
            id: idDelegate
            width: parent.width
            height: 50
            color: index%2 === 0 ? "#C8C8C8" : "#A4A4A4"
            opacity: 0.8
            Text {
                id: idTxt_device_name
                text: proName
                font.pixelSize: 16 ; font.italic: true
                color: HomeScreenConst.text_screen_color
                x: txt_device_name.x
                anchors.verticalCenter: parent.verticalCenter
            }
            Image {
                id: idImgState
                x: txt_device_state.x
                anchors.verticalCenter: parent.verticalCenter
                source: proState ? Resource_General.btn_state_on : Resource_General.btn_state_off
                width: 50 ; height: parent.height
            }
            Text {
                id: idTxt_device_lastConn
                text: proState ? "online" : Qt.formatDateTime(proLastConn, "yyyy.MM.dd") + " - "+ Qt.formatDateTime(proLastConn, "hh:mm AP")
                font.pixelSize: 16
                color: proState ? "green" : HomeScreenConst.text_screen_color
                x: txt_device_last_conn.x
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}
