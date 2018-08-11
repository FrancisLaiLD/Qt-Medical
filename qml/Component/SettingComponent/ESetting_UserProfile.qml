import QtQuick 2.0
import "../OtherComponent"
Rectangle {
    id: _root
    width: parent.width ; height: 800

//    gradient:
//        Gradient {
//        GradientStop { position: 0.0; color: "white" }
//        GradientStop { position: 1.0; color: "#AAAAAA"}
//    }
    color: "transparent"

    Item {
        id: _currentUser
        width: parent.width
        height: parent.height/3
        Text {
            id: txt_cur_user
            text: "Current user :"
            color: "#404040"
            font.pixelSize: 16
            anchors.top: parent.top ; anchors.topMargin: 40
            anchors.left: parent.left ; anchors.leftMargin: 100
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

        Rectangle {
            id: _rectUsrAva
            anchors.rightMargin: 150
            anchors.top: parent.top ; anchors.topMargin: 40
            anchors.right: parent.right
            width: 130 ; height: 130
            border.width: 1 ; border.color: "gray"
            Image {
                id: _usrAva
                width: 120 ; height: 120
                source: UserProfileModel.curUserIcon
                anchors.centerIn: parent
            }
        }
        EButton_Text{
            id: _btnChangeAva
            text: "Change your avatar >>"
            font.pixelSize: 14 ; font.italic: true
            anchors.top: _rectUsrAva.bottom ; anchors.topMargin: 10
            anchors.horizontalCenter: _rectUsrAva.horizontalCenter
        }
        EButton_Text {
            id: _btnChangePass
            text: "Change your password >>"
            font.pixelSize: 14 ; font.italic: true
            anchors.verticalCenter: _txt_time_login_val.verticalCenter ; anchors.verticalCenterOffset: 30
            anchors.right: _txt_time_login_val.right
        }

        Text {
            id: _timeUse
            text: "Thời gian đã đăng nhập :"
            color: "#404040"
            font.pixelSize: 16
            anchors.right: parent.right ; anchors.rightMargin: 300
            anchors.verticalCenter: _txt_time_login.verticalCenter ; anchors.verticalCenterOffset: 35
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
        E_HorizentalLine {
            id: _mainLine
            lineColor: HomeScreenConst.line_normal_color
            lineRange: parent.width - 160
            anchors.bottom: parent.bottom ; anchors.bottomMargin: -10
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

}
