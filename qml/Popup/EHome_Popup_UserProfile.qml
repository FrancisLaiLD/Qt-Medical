import QtQuick 2.0
import "../Component/OtherComponent"
import Ehome 1.0

Medium_Popup {
    id: idRoot
    popupTitle: currentMode === 1 ? "Current user profile" : "Choose other user"
    property int currentMode: -1
    ParallelAnimation {
        id: animationCurUsr
        running: false
        //        NumberAnimation { target: idCurrentUser; property: "x"; from: -560; to: 0; duration: HomeScreenConst.time_screen_trans }
        NumberAnimation { target: idCurrentUser; property: "opacity"; from: 0.0 ;to: 1.0; duration: HomeScreenConst.time_screen_trans }
    }
    ParallelAnimation {
        id: animationOtherUsr
        running: false
        //        NumberAnimation { target: idCurrentUser; property: "x"; from: -560; to: 0; duration: HomeScreenConst.time_screen_trans }
        NumberAnimation { target: idOtherUser; property: "opacity"; from: 0.0 ;to: 1.0; duration: HomeScreenConst.time_screen_trans }
    }
    onCurrentModeChanged: {
        if (currentMode === 1)
            animationCurUsr.start()
        else
            animationOtherUsr.start()
    }

    Item {
        id: idCurrentUser
        width: parent.width ; height: parent.height - 68
        visible: currentMode === 1
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

        Image {
            id: idUserAvatar
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 80
            width: 150 ; height: 150
            source: UserProfileModel.curUserIcon
        }
    }

    Item {
        id: idOtherUser
        width: parent.width ; height: parent.height - 68
        visible: currentMode === 2
        Text {
            id: idAutoLogin
            anchors.bottom: idCameraAva.top
            anchors.bottomMargin: 10
            anchors.horizontalCenter: idCameraAva.horizontalCenter
            text: "Auto login"
            font.pixelSize: 14
            color: HomeScreenConst.value_popup_color
        }
        Rectangle {
            id: idCameraAva
            width: 160 ; height: 200
            anchors.top: parent.top
            anchors.topMargin: 100
            anchors.left: parent.left
            anchors.leftMargin: 30
            color: "red"
            opacity: 0.3
        }
        Text {
            id: idDetectFaceStatus
            anchors.top: idCameraAva.bottom
            anchors.topMargin: 5
            anchors.horizontalCenter: idCameraAva.horizontalCenter
            text: "Detecting your face..."
            font.pixelSize: 14
            color: "#404040"
            font.italic: true
        }

        E_VerticalLine {
            id: idMainLine
            anchors.left: parent.left
            anchors.leftMargin: 220
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            lineRange: parent.height - 100
            lineWidth: 1
        }

        Text {
            id: idManualLogin
            anchors.verticalCenter: idAutoLogin.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 150
            text: "Manual login"
            font.pixelSize: 14
            color: HomeScreenConst.value_popup_color
        }
        Text {
            id: idUsrAccount
            anchors.top: parent.top
            anchors.topMargin: 120
            anchors.right: parent.right
            anchors.rightMargin: 200
            text: "Choose your Acc :"
            color: "#404040"
            font.pixelSize: 16
        }
        Text {
            id: idUsrName
            anchors.verticalCenter: idUsrAccount.verticalCenter
            anchors.verticalCenterOffset: 40
            anchors.right: idUsrAccount.right
            text: " Or fill your name :"
            color: "#404040"
            font.pixelSize: 16
        }
        Text {
            id: idUsrPass
            anchors.right: idUsrName.right
            anchors.verticalCenter: idUsrName.verticalCenter
            anchors.verticalCenterOffset: 40
            text: "Password :"
            color: "#404040"
            font.pixelSize: 16
        }
    }

    EButton_StandAlone {
        id: idBtnChooseOther
        anchors.left: parent.left
        anchors.leftMargin: 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        //        btnColorTop: "blue"
        //        btnColorBottom: "blue"
        btnLabel: currentMode === 1 ? "Choose Other" : "Back"
        btnWidth: 150
        onBtnClicked: {
            if (currentMode === 1)
                currentMode++
            else
                currentMode--
        }
    }
    EButton_StandAlone {
        id: idBtnGoToUser
        anchors.left: idBtnChooseOther.right
        anchors.leftMargin: 30
        anchors.verticalCenter: idBtnChooseOther.verticalCenter
        //        btnColorTop: "blue"
        //        btnColorBottom: "blue"
        btnLabel: "Go to user management"
        onBtnClicked: {
            SettingModel.curInx = 3
            AppManager.handleHidePopupClick(HomeEnum.EVENT_GO_TO_SETTING)
//            AppManager.handleHidePopupClick(HomeEnum.EVENT_HIDE_POPUP)
        }
    }
    Component.onCompleted: {
        currentMode = 1
    }
}
