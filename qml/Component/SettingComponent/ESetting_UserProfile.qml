import QtQuick 2.0
import "../OtherComponent"
Rectangle {
    id: _root
    width: 660 ; height: 800

    E_HorizentalLine {
        id: _mainLine
        lineColor: HomeScreenConst.line_normal_color
        lineRange: parent.width - 60
        anchors.centerIn: parent
    }
    Item {
        id: _currentUser
        width: parent.width
        height: parent.height/2
        Text {
            id: txt_cur_user
            text: "Current user :"
            color: "#404040"
            font.pixelSize: 16
            x: 60 ; y: 120
        }

        Text {
            id: txt_cur_user_val
            anchors.left: txt_cur_user.right
            anchors.leftMargin: 20
            anchors.verticalCenter: txt_cur_user.verticalCenter
            text: UserProfileModel.curUserName
            font.pixelSize: 16
            color: HomeScreenConst.value_popup_color
            font.italic: true
        }

        Text {
            id: txt_cur_userID
            text: "User ID :"
            color: "#404040"
            font.pixelSize: 16
            anchors.right: txt_cur_user.right
            anchors.verticalCenter: txt_cur_user.verticalCenter
            anchors.verticalCenterOffset: 30
        }

        Text {
            id: txt_cur_userID_val
            text: UserProfileModel.curUserId
            font.pixelSize: 16
            color: HomeScreenConst.value_popup_color
            x: txt_cur_user_val.x
            anchors.verticalCenter: txt_cur_userID.verticalCenter
            font.italic: true
        }

        Text {
            id: txt_cur_userDateEstablist
            text: "Date Establish :"
            color: "#404040"
            font.pixelSize: 16
            anchors.right: txt_cur_user.right
            anchors.verticalCenter: txt_cur_userID.verticalCenter
            anchors.verticalCenterOffset: 30
        }

        Text {
            id: txt_cur_userDateEstablist_val
            text: Qt.formatDateTime(UserProfileModel.curUserDateEsta, "yyyy.MM.dd")
                  + " - "+ Qt.formatDateTime(UserProfileModel.curUserDateEsta, "hh:mm AP")
            font.pixelSize: 16
            color: HomeScreenConst.value_popup_color
            x: txt_cur_user_val.x
            anchors.verticalCenter: txt_cur_userDateEstablist.verticalCenter
            font.italic: true
        }

        Text {
            id: txt_cur_userDateExprt
            text: "Date Expert :"
            color: "#404040"
            font.pixelSize: 16
            anchors.right: txt_cur_user.right
            anchors.verticalCenter: txt_cur_userDateEstablist.verticalCenter
            anchors.verticalCenterOffset: 30
        }

        Text {
            id: txt_cur_userDateExprt_val
            text: Qt.formatDateTime(UserProfileModel.curUserDateExpe, "yyyy.MM.dd")
                  + " - "+ Qt.formatDateTime(UserProfileModel.curUserDateExpe, "hh:mm AP")
            font.pixelSize: 16
            color: HomeScreenConst.value_popup_color
            x: txt_cur_user_val.x
            anchors.verticalCenter: txt_cur_userDateExprt.verticalCenter
            font.italic: true
        }

        Text {
            id: txt_cur_userTimeLogin
            text: "Time login :"
            color: "#404040"
            font.pixelSize: 16
            anchors.right: txt_cur_user.right
            anchors.verticalCenter: txt_cur_userDateExprt.verticalCenter
            anchors.verticalCenterOffset: 30
        }

        Text {
            id: txt_cur_userTimeLogin_val
            text: Qt.formatDateTime(UserProfileModel.curUserDob, "yyyy.MM.dd")
                  + " - "+ Qt.formatDateTime(UserProfileModel.curUserDob, "hh:mm AP")
            font.pixelSize: 16
            color: HomeScreenConst.value_popup_color
            x: txt_cur_user_val.x
            anchors.verticalCenter: txt_cur_userTimeLogin.verticalCenter
            font.italic: true
        }

        Item {
            id: idTimeUse
            anchors.horizontalCenter: parent.horizontalCenter
            width: time_use.width + 10 + time_use_val.width
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            Text {
                id: time_use
                text: "Thời gian đã đăng nhập :"
                color: "#404040"
                font.pixelSize: 16
            }
            Text {
                id: time_use_val
                anchors.verticalCenter: time_use.verticalCenter
                anchors.left: time_use.right
                anchors.leftMargin: 10
                text: "10 gio 30 phut"
                font.pixelSize: 16
                color: HomeScreenConst.value_popup_color
                font.italic: true
            }
        }
    }
}
