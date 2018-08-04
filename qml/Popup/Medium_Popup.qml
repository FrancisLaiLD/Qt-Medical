import QtQuick 2.0
import "../Component/OtherComponent"
import com.embeddeduse.models 1.0
EHome_Popup_Frame {
    id: idRoot
    popupTitle: "Current user profile"

    Text {
        id: txt_cur_user
        text: "Current user :"
        font.pixelSize: 16
        x: 60 ; y: 120
    }

    Text {
        id: txt_cur_user_val
        anchors.left: txt_cur_user.right
        anchors.leftMargin: 20
        anchors.verticalCenter: txt_cur_user.verticalCenter
        text: UserProfileModel.curUser.name
        font.pixelSize: 16
        color: HomeScreenConst.value_popup_color
        font.italic: true
    }

    Text {
        id: txt_cur_userID
        text: "User ID :"
        font.pixelSize: 16
        anchors.right: txt_cur_user.right
        anchors.verticalCenter: txt_cur_user.verticalCenter
        anchors.verticalCenterOffset: 30
    }

    Text {
        id: txt_cur_userID_val
        text: UserProfileModel.curUser.id
        font.pixelSize: 16
        color: HomeScreenConst.value_popup_color
        x: txt_cur_user_val.x
        anchors.verticalCenter: txt_cur_userID.verticalCenter
        font.italic: true
    }

    Text {
        id: txt_cur_userDateEstablist
        text: "Date Establish :"
        font.pixelSize: 16
        anchors.right: txt_cur_user.right
        anchors.verticalCenter: txt_cur_userID.verticalCenter
        anchors.verticalCenterOffset: 30
    }

    Text {
        id: txt_cur_userDateEstablist_val
        text: UserProfileModel.curUser.dateEstablish
        font.pixelSize: 16
        color: HomeScreenConst.value_popup_color
        x: txt_cur_user_val.x
        anchors.verticalCenter: txt_cur_userDateEstablist.verticalCenter
        font.italic: true
    }

    Text {
        id: txt_cur_userDateExprt
        text: "Date Expert :"
        font.pixelSize: 16
        anchors.right: txt_cur_user.right
        anchors.verticalCenter: txt_cur_userDateEstablist.verticalCenter
        anchors.verticalCenterOffset: 30
    }

    Text {
        id: txt_cur_userDateExprt_val
        text: UserProfileModel.curUser.dateExpert
        font.pixelSize: 16
        color: HomeScreenConst.value_popup_color
        x: txt_cur_user_val.x
        anchors.verticalCenter: txt_cur_userDateExprt.verticalCenter
        font.italic: true
    }

    Text {
        id: txt_cur_userTimeLogin
        text: "Time login :"
        font.pixelSize: 16
        anchors.right: txt_cur_user.right
        anchors.verticalCenter: txt_cur_userDateExprt.verticalCenter
        anchors.verticalCenterOffset: 30
    }

    Text {
        id: txt_cur_userTimeLogin_val
        text: UserProfileModel.curUser.timeLogin
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
        anchors.bottomMargin: 100
        Text {
            id: time_use
            text: "Thời gian đã đăng nhập :"
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
        width: 150 ; height: 150
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -30
        source: UserProfileModel.curUser.userIcon

    }

    EButton_StandAlone {
        id: idBtnChooseOther
        anchors.left: parent.left
        anchors.leftMargin: 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
//        btnColorTop: "blue"
//        btnColorBottom: "blue"
        btnLabel: "Choose Other"
        onBtnClicked: {
            AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_USER_PROFILE)
            AppManager.handleHidePopupClick(HomeEnum.EVENT_HIDE_POPUP)
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
            AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_USER_PROFILE)
            AppManager.handleHidePopupClick(HomeEnum.EVENT_HIDE_POPUP)
        }
    }
}
