import QtQuick 2.0
import "../Component/OtherComponent"
import Ehome 1.0

Medium_Popup {
    id: idRoot
    __popupTitle: currentMode === 1 ? "Current user profile" : "Choose other user"
    property int currentMode: -1
    ParallelAnimation {
        id: animationCurUsr
        running: false
        //        NumberAnimation { target: idCurrentUser; property: "x"; from: -560; to: 0; duration: AppValueConst.time_screen_trans }
        NumberAnimation { target: idCurrentUser; property: "opacity"; from: 0.0 ;to: 1.0; duration: AppValueConst.time_screen_trans }
    }
    ParallelAnimation {
        id: animationOtherUsr
        running: false
        //        NumberAnimation { target: idCurrentUser; property: "x"; from: -560; to: 0; duration: AppValueConst.time_screen_trans }
        NumberAnimation { target: idOtherUser; property: "opacity"; from: 0.0 ;to: 1.0; duration: AppValueConst.time_screen_trans }
    }
    onCurrentModeChanged: {
        if (currentMode === 1)
            animationCurUsr.start()
        else
            animationOtherUsr.start()
    }

    // define function
    function getTimeLogin() {
        var timeLogin =  ""
        switch(SettingModel.curLang) {
        case HomeEnum.LANGUAGE_EN:
            timeLogin = Qt.formatDateTime(UserProfileModel.curUserDob, "ddd, MMMM dd - hh:mm AP")
            break
        case HomeEnum.LANGUAGE_VI:
            timeLogin = Qt.formatDateTime(UserProfileModel.curUserDob, "MMMM dd - hh:mm AP")
            break
        default:
            timeLogin = Qt.formatDateTime(UserProfileModel.curUserDob, "ddd, MMMM dd - hh:mm AP")
        }
        return timeLogin
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
            x: 60 ; y: __startContent + 40
        }

        Text {
            id: txt_cur_user_val
            anchors.left: txt_cur_user.right
            anchors.leftMargin: 20
            anchors.verticalCenter: txt_cur_user.verticalCenter
            text: UserProfileModel.curUserName
            font.pixelSize: 16
            color: AppValueConst.value_popup_color
            font.italic: true
        }

        Text {
            id: txt_cur_userID
            text: "User ID :"
            color: "#404040"
            font.pixelSize: 16
            anchors.right: txt_cur_user.right
            anchors.verticalCenter: txt_cur_user.verticalCenter
            anchors.verticalCenterOffset: 25
        }

        Text {
            id: txt_cur_userID_val
            text: UserProfileModel.curUserId
            font.pixelSize: 16
            color: AppValueConst.value_popup_color
            x: txt_cur_user_val.x
            anchors.verticalCenter: txt_cur_userID.verticalCenter
            font.italic: true
        }

        Text {
            id: txt_cur_userTimeLogin
            text: "Time login :"
            color: "#404040"
            font.pixelSize: 16
            anchors.right: txt_cur_user.right
            anchors.verticalCenter: txt_cur_userID.verticalCenter
            anchors.verticalCenterOffset: 25
        }

        Text {
            id: txt_cur_userTimeLogin_val
            text: getTimeLogin()
            font.pixelSize: 16
            color: AppValueConst.value_popup_color
            x: txt_cur_user_val.x
            anchors.verticalCenter: txt_cur_userTimeLogin.verticalCenter
            font.italic: true
        }

        Text {
            id: time_use
            text: "Thời gian đã đăng nhập :"
            color: "#404040"
            font.pixelSize: 16
            anchors.right: parent.horizontalCenter ; anchors.rightMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 25
        }
        Text {
            id: time_use_val
            property int timeLog: Math.floor((StatusbarModel.currentDT - UserProfileModel.dtUserLogin)/1000)
            anchors.verticalCenter: time_use.verticalCenter
            anchors.left: time_use.right
            anchors.leftMargin: 10
            text: Math.floor(timeLog/60) + " min"
            font.pixelSize: 16
            color: AppValueConst.value_popup_color
            font.italic: true
        }

        Image {
            id: idUserAvatar
            anchors.right: parent.right
            anchors.rightMargin: 30
            anchors.verticalCenter: idCurrentUser.verticalCenter ; anchors.verticalCenterOffset: 20
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
            color: AppValueConst.value_popup_color
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
            color: AppValueConst.value_popup_color
        }
        Text {
            id: _otherUserName
            anchors.top: parent.top
            anchors.topMargin: 120
            anchors.right: parent.right
            anchors.rightMargin: 200
            text: "Choose your Acc :"
            color: "#404040"
            font.pixelSize: 16
        }
            EText_Input {
                id: _txtUserName
                __textHint: "user name"
                __textWidth: 150
                anchors.bottom: _otherUserName.bottom
                anchors.left: _otherUserName.right ; anchors.leftMargin: 10
            }

            Text {
                id: _txtUsrID
                anchors.verticalCenter: _otherUserName.verticalCenter
                anchors.verticalCenterOffset: 40
                anchors.right: _otherUserName.right
                text: " Or fill your ID :"
                color: "#404040"
                font.pixelSize: 16
            }
            EText_Input {
                id: _inputUsrID
                __textHint: "user ID"
                __textWidth: 150
                anchors.bottom: _txtUsrID.bottom
                anchors.left: _txtUsrID.right ; anchors.leftMargin: 10
            }
            Text {
                id: _usrPass
                anchors.right: _txtUsrID.right
                anchors.verticalCenter: _txtUsrID.verticalCenter
                anchors.verticalCenterOffset: 40
                text: "Password :"
                color: "#404040"
                font.pixelSize: 16
            }
            EText_Input {
                id: _inputUsrPass
                __textHint: "password"
                __textWidth: 150
                anchors.bottom: _usrPass.bottom
                anchors.left: _usrPass.right ; anchors.leftMargin: 10
            }

            EButton_StandAlone {
                id: _btnLogin
                btnLabel: "Log in"
                btnWidth: 100
                anchors.verticalCenter: _usrPass.verticalCenter ; anchors.verticalCenterOffset: 40
                anchors.horizontalCenter: _usrPass.right
            }
        }

    EButton_StandAlone {
        id: idBtnChooseOther
        anchors.left: parent.left
        anchors.leftMargin: 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 16
        btnLabel: currentMode === 1 ? AppStringConst.STR_USER_PROFILE_CHANGE_USER : AppStringConst.STR_GENERAL_BACK
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
        btnLabel: "Go to user management"
        onBtnClicked: {
            SettingModel.curInx = HomeEnum.SETTING_USERPROFILE
            if (MEASURE_CONTROL.isHasMeasureResult)
            {
                AppManager.nextScreen = HomeEnum.EVENT_GO_TO_SETTING
                AppManager.handleShowPopup(HomeEnum.EVENT_SHOW_POPUP_CONFIRMEXIT)
            }
            else
            {
                AppManager.handleTransScreen(HomeEnum.EVENT_GO_TO_SETTING)
            }
        }
    }
    Component.onCompleted: {
        currentMode = 1
    }
}
