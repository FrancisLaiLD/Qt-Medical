import QtQuick 2.0
import "../Component/OtherComponent"
import com.embeddeduse.models 1.0
EHome_Popup_Frame {
    id: idRoot
    popupTitle: "Current user profile"

    Text {
        id: txt_cur_user
        text: "Current user :"
        font.pixelSize: 20
        x: 60 ; y: 120
    }

    Text {
        id: txt_cur_user_val
        anchors.left: txt_cur_user.right
        anchors.leftMargin: 20
        anchors.verticalCenter: txt_cur_user.verticalCenter
        text: UserProfileModel.curUser.name
        font.pixelSize: 20
        color: HomeScreenConst.value_popup_color
        font.italic: true
    }

    Text {
        id: txt_cur_userID
        text: "User ID :"
        font.pixelSize: 20
        anchors.right: txt_cur_user.right
        anchors.verticalCenter: txt_cur_user.verticalCenter
        anchors.verticalCenterOffset: 30
    }

    Text {
        id: txt_cur_userID_val
        text: UserProfileModel.curUser.id
        font.pixelSize: 20
        color: HomeScreenConst.value_popup_color
        x: txt_cur_user_val.x
        anchors.verticalCenter: txt_cur_userID.verticalCenter
        font.italic: true
    }

    Text {
        id: txt_cur_userDateEstablist
        text: "Date Establish :"
        font.pixelSize: 20
        anchors.right: txt_cur_user.right
        anchors.verticalCenter: txt_cur_userID.verticalCenter
        anchors.verticalCenterOffset: 30
    }

    Text {
        id: txt_cur_userDateEstablist_val
        text: UserProfileModel.curUser.dateEstablish
        font.pixelSize: 20
        color: HomeScreenConst.value_popup_color
        x: txt_cur_user_val.x
        anchors.verticalCenter: txt_cur_userDateEstablist.verticalCenter
        font.italic: true
    }

    Text {
        id: txt_cur_userDateExprt
        text: "Date Expert :"
        font.pixelSize: 20
        anchors.right: txt_cur_user.right
        anchors.verticalCenter: txt_cur_userDateEstablist.verticalCenter
        anchors.verticalCenterOffset: 30
    }

    Text {
        id: txt_cur_userDateExprt_val
        text: UserProfileModel.curUser.dateExpert
        font.pixelSize: 20
        color: HomeScreenConst.value_popup_color
        x: txt_cur_user_val.x
        anchors.verticalCenter: txt_cur_userDateExprt.verticalCenter
        font.italic: true
    }

    Text {
        id: txt_cur_userTimeLogin
        text: "Time login :"
        font.pixelSize: 20
        anchors.right: txt_cur_user.right
        anchors.verticalCenter: txt_cur_userDateExprt.verticalCenter
        anchors.verticalCenterOffset: 30
    }

    Text {
        id: txt_cur_userTimeLogin_val
        text: UserProfileModel.curUser.timeLogin
        font.pixelSize: 20
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
            font.pixelSize: 18
        }
        Text {
            id: time_use_val
            anchors.verticalCenter: time_use.verticalCenter
            anchors.left: time_use.right
            anchors.leftMargin: 10
            text: "11 giờ 40 phút"
            font.pixelSize: 18
            color: HomeScreenConst.value_popup_color
            font.italic: true
        }

    }
    EButton_StandAlone {
        id: idBtnGoToUser
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
//        btnColorTop: "blue"
//        btnColorBottom: "blue"
        btnLabel: "Go to user management"
        onBtnClicked: {
            AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_USER_PROFILE)
            AppManager.handleHomeScreenClick(HomeEnum.EVENT_HIDE_POPUP)
            AppManager.isShowingPopup = false;
        }
    }
}
