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
            x: 40 ; y: 60
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
            id: _txt_cur_user_dob
            text: "Date of birth :"
            color: "#404040"
            font.pixelSize: 16
            anchors.right: txt_cur_user.right
            anchors.verticalCenter: txt_cur_userID.verticalCenter
            anchors.verticalCenterOffset: 30
        }

        Text {
            id: _txt_cur_user_dob_val
            text: Qt.formatDateTime(UserProfileModel.curUserDob, "yyyy.MM.dd")
            font.pixelSize: 16
            color: HomeScreenConst.value_popup_color
            x: txt_cur_user_val.x
            anchors.verticalCenter: _txt_cur_user_dob.verticalCenter
            font.italic: true
        }

        Text {
            id: txt_cur_userDateEstablist
            text: "Date Establish :"
            color: "#404040"
            font.pixelSize: 16
            anchors.right: txt_cur_user.right
            anchors.verticalCenter: _txt_cur_user_dob.verticalCenter
            anchors.verticalCenterOffset: 30
        }

        Text {
            id: txt_cur_userDateEstablist_val
            text: Qt.formatDateTime(UserProfileModel.curUserDateEsta, "yyyy.MM.dd")
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
            font.pixelSize: 16
            color: HomeScreenConst.value_popup_color
            x: txt_cur_user_val.x
            anchors.verticalCenter: txt_cur_userDateExprt.verticalCenter
            font.italic: true
        }

        Text {
            id: _txt_time_login
            text: "Time login :"
            color: "#404040"
            font.pixelSize: 16
            anchors.right: txt_cur_userDateExprt.right
            anchors.verticalCenter: txt_cur_userDateExprt.verticalCenter
            anchors.verticalCenterOffset: 30
        }

        Text {
            id: _txt_time_login_val
            text: Qt.formatDateTime(UserProfileModel.curUserDateExpe, "yyyy.MM.dd")
            font.pixelSize: 16
            color: HomeScreenConst.value_popup_color
            x: txt_cur_user_val.x
            anchors.verticalCenter: _txt_time_login.verticalCenter
            font.italic: true
        }

        Text {
            id: _timeUse
            text: "Thời gian đã đăng nhập :"
            color: "#404040"
            font.pixelSize: 16
            anchors.right: parent.right ; anchors.rightMargin: 300
            anchors.verticalCenter: _txt_time_login.verticalCenter ; anchors.verticalCenterOffset: 40
        }
        Text {
            id: _timeUse_val
            anchors.verticalCenter: _timeUse.verticalCenter
            anchors.left: _timeUse.right
            anchors.leftMargin: 10
            text: Math.floor((StatusbarModel.currentDT - UserProfileModel.dtUserLogin)/1000)
            font.pixelSize: 16
            color: HomeScreenConst.value_popup_color
            font.italic: true
        }
    }
}
