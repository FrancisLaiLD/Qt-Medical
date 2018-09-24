import QtQuick 2.0
import Ehome 1.0
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
        height: 250
        Text {
            id: _titleCurUsr
            text: "Current user"
            font.pixelSize: 18 ; color: AppValueConst.value_popup_color
            anchors.top: parent.top ; anchors.topMargin: 0
            anchors.left: parent.left ; anchors.leftMargin: 10
        }
        Text {
            id: txt_cur_user
            text: "User name :"
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
            id: _txt_cur_user_dob
            text: "Date of birth :"
            color: "#404040"
            font.pixelSize: 16
            anchors.right: txt_cur_user.right
            anchors.verticalCenter: txt_cur_userID.verticalCenter
            anchors.verticalCenterOffset: 25
        }

        Text {
            id: _txt_cur_user_dob_val
            text: Qt.formatDateTime(UserProfileModel.curUserDob, " MMMM dd yyyy")
            font.pixelSize: 16
            color: AppValueConst.value_popup_color
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
            anchors.verticalCenterOffset: 25
        }

        Text {
            id: txt_cur_userDateEstablist_val
            text: Qt.formatDateTime(UserProfileModel.curUserDateEsta, " MMMM dd yyyy")
            font.pixelSize: 16
            color: AppValueConst.value_popup_color
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
            anchors.verticalCenterOffset: 25
        }

        Text {
            id: txt_cur_userDateExprt_val
            text: Qt.formatDateTime(UserProfileModel.curUserDateExpe, " MMMM dd yyyy")
            font.pixelSize: 16
            color: AppValueConst.value_popup_color
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
            anchors.verticalCenterOffset: 25
        }

        Text {
            id: _txt_time_login_val
            text: Qt.formatDateTime(UserProfileModel.curUserDob, "ddd, MMMM dd - hh:mm AP")
            font.pixelSize: 16
            color: AppValueConst.value_popup_color
            x: txt_cur_user_val.x
            anchors.verticalCenter: _txt_time_login.verticalCenter
            font.italic: true
        }

        Rectangle {
            id: _rectUsrAva
            anchors.rightMargin: 150
            anchors.top: parent.top ; anchors.topMargin: 40
            anchors.right: parent.right
            width: 130 ; height: 130 ; radius: 6
            color: "#D6DDD7"
            border.width: 1 ; border.color: "gray"
            Image {
                id: _usrAva
                width: 120 ; height: 120
                source: UserProfileModel.curUserIcon
                anchors.centerIn: parent
            }
        }

        Text {
            id: _timeUse
            text: "Time used :"
            color: "#404040"
            font.pixelSize: 16
            anchors.right: parent.right ; anchors.rightMargin: 420
            anchors.verticalCenter: _txt_time_login.verticalCenter ; anchors.verticalCenterOffset: 35
        }
        Text {
            id: _timeUse_val
            anchors.verticalCenter: _timeUse.verticalCenter
            anchors.left: _timeUse.right
            anchors.leftMargin: 10
            text: Math.floor((StatusbarModel.currentDT - UserProfileModel.dtUserLogin)/(1000 * 60)) + " min"
            font.pixelSize: 16
            color: AppValueConst.value_popup_color
            font.italic: true
        }
        E_HorizentalLine {
            id: _mainLine
            lineColor: AppValueConst.line_normal_color
            lineRange: parent.width - 160
            anchors.bottom: parent.bottom ; anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    Item {
        id: _addUser
        // define functions
        function createNewUsr() {

        }
        function creModelUsrAva() {
            _modelAvaGrid.append({linkImg : Resource_General.ico_kidboy_1})
            _modelAvaGrid.append({linkImg : Resource_General.ico_kidgirl_1})
            _modelAvaGrid.append({linkImg : Resource_General.ico_girl_1})
            _modelAvaGrid.append({linkImg : Resource_General.ico_boy_1})
            _modelAvaGrid.append({linkImg : Resource_General.ico_boy_2})
            _modelAvaGrid.append({linkImg : Resource_General.ico_father_1})
            _modelAvaGrid.append({linkImg : Resource_General.ico_father_2})
            _modelAvaGrid.append({linkImg : Resource_General.ico_grandfather_1})
            _modelAvaGrid.append({linkImg : Resource_General.ico_grandmother_1})
        }

        width: parent.width ; height: 300
        anchors.top: _currentUser.bottom ; anchors.topMargin: 10
        MouseArea {
            id: _mainMouse
            anchors.fill: parent
//            z: 100
            visible: _cbbGender.__isShowDropDown || _cbbPreStatus.__isShowDropDown || _cbbTime.__isShowDropDown || _gridBoxAvas.__isShowDropDown
            onClicked: {
                _cbbGender.__isShowDropDown = false
                _cbbPreStatus.__isShowDropDown = false
                _cbbTime.__isShowDropDown = false
                _gridBoxAvas.__isShowDropDown = false
            }
        }

        Text {
            id: _titleAddUsr
            text: "Add new user"
            font.pixelSize: 18 ; color: AppValueConst.value_popup_color
            anchors.top: parent.top ; anchors.topMargin: 10
            anchors.left: parent.left ; anchors.leftMargin: 10
        }
        Text {
            id: _txtNewUsrName
            text: "User name :"
            color: "#404040"
            font.pixelSize: 15
            anchors.top: parent.top ; anchors.topMargin: 40
            anchors.left: parent.left ; anchors.leftMargin: 100
        }

        EText_Input {
            id: _txtNewUsrNameVal
            __textHint: "Input your name"
            __textWidth: 200 ; __textHeight: 20
            anchors.left: _txtNewUsrName.right
            anchors.leftMargin: 20
            anchors.bottom: _txtNewUsrName.bottom
        }
        Text {
            id: _txtNewUsrPass
            text: "Password :"
            color: "#404040"
            font.pixelSize: 15
            anchors.verticalCenter: _txtNewUsrName.verticalCenter ; anchors.verticalCenterOffset: 30
            anchors.right: _txtNewUsrName.right
        }

        EText_Input {
            id: _txtNewUsrPassVal
            __textHint: "Input your password"
            __textWidth: 200 ; __textHeight: 20
            anchors.left: _txtNewUsrPass.right
            anchors.leftMargin: 20
            anchors.bottom: _txtNewUsrPass.bottom
        }
        Text {
            id: _txtNewUsrPassRep
            text: "Repeat your password :"
            color: "#404040"
            font.pixelSize: 15
            anchors.verticalCenter: _txtNewUsrPass.verticalCenter ; anchors.verticalCenterOffset: 30
            anchors.right: _txtNewUsrPass.right
        }
        EText_Input {
            id: _txtNewUsrPassRepVal
            __textHint: "Repeate your password"
            __textWidth: 200 ; __textHeight: 20
            anchors.left: _txtNewUsrPassRep.right
            anchors.leftMargin: 20
            anchors.bottom: _txtNewUsrPassRep.bottom
        }
        ListModel {
            id: _modelAvaGrid
        }
        EButton_GridBox {
            id: _gridBoxAvas
            z:999
            __listModel: _modelAvaGrid
            anchors.rightMargin: 100 ; anchors.right: parent.right
            anchors.bottom: _txtNewUsrPassRepVal.bottom
        }

        Text {
            id: _txtNewUsrGender
            text: "Gender :"
            color: "#404040"
            font.pixelSize: 15
            anchors.verticalCenter: _txtNewUsrPassRep.verticalCenter ; anchors.verticalCenterOffset: 40
            anchors.right: _txtNewUsrPassRep.right
        }
        EButton_Combobox {
            id: _cbbGender
            __listModel: _modGender
            z:998
            anchors.verticalCenter: _txtNewUsrGender.verticalCenter
            anchors.left: _txtNewUsrGender.right ; anchors.leftMargin: 20
            onCurIndexChanged: {
                if (curIndex === 1)
                    _aniPregnancyOn.restart()
                else
                    _aniPregnancyOff.restart()
            }
        }
        ListModel {
            id: _modGender
            ListElement {
                name: "Male"
            }
            ListElement {
                name: "Female"
            }
        }
        // Pregnancy status define
        Text {
            id: _txtNewUsrPregnancyStatus
            text: "Pregnancy status :"
            visible: _cbbGender.curIndex === 1
            color: "#404040"
            font.pixelSize: 15
            anchors.verticalCenter: _txtNewUsrGender.verticalCenter ; anchors.verticalCenterOffset: 30
            anchors.right: _txtNewUsrGender.right
        }
        EButton_Combobox {
            id: _cbbPreStatus
            z:997
            visible: _cbbGender.curIndex === 1
            __listModel: _modPreStatus
            anchors.verticalCenter: _txtNewUsrPregnancyStatus.verticalCenter
            anchors.left: _txtNewUsrPregnancyStatus.right ; anchors.leftMargin: 20
        }
        ListModel {
            id: _modPreStatus
            ListElement {
                name: "No"
            }
            ListElement {
                name: "Yes"
            }
        }
        ParallelAnimation {
            id: _aniPregnancyOn
            NumberAnimation { target: _txtNewUsrPregnancyStatus; property: "opacity"; from: 0.0 ;to: 1.0; duration: AppValueConst.time_screen_trans }
            NumberAnimation { target: _cbbPreStatus;             property: "opacity"; from: 0.0 ;to: 1.0; duration: AppValueConst.time_screen_trans }
        }
        ParallelAnimation {
            id: _aniPregnancyOff
            NumberAnimation { target: _txtNewUsrPregnancyStatus; property: "opacity"; from: 1.0 ;to: 0.0; duration: AppValueConst.time_screen_trans }
            NumberAnimation { target: _cbbPreStatus;             property: "opacity"; from: 1.0 ;to: 0.0; duration: AppValueConst.time_screen_trans }
        }
        // End of Pregnancy status define
        Text {
            id: _txtNewUsrDob
            text: "Date of birth :"
            color: "#404040"
            font.pixelSize: 15
            anchors.verticalCenter: _txtNewUsrGender.verticalCenter ; anchors.verticalCenterOffset: 0
            anchors.right: parent.right ; anchors.rightMargin: 280
        }
        EButton_Combobox_Time {
            id: _cbbTime
            visible: true
            z:996
//            __listModel: _modPreStatus
            anchors.verticalCenter: _txtNewUsrDob.verticalCenter
            anchors.left: _txtNewUsrDob.right ; anchors.leftMargin: 20
        }
        EButton_StandAlone {
            id: _creNewUser
            btnLabel: "Create new user"
            onBtnClicked: {
                console.log('Click create new user');
                AppManager.handleShowPopup(HomeEnum.EVENT_SHOW_POPUP_CREATINGUSER)
            }
            anchors.bottom: parent.bottom ; anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
        E_HorizentalLine {
            id: _secLine
            lineColor: AppValueConst.line_normal_color
            lineRange: parent.width - 160
            anchors.bottom: parent.bottom ; anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    Item {
        id: _customQuiAcc
        anchors.top: _addUser.bottom ; anchors.topMargin: 10
        width: parent.width ; height: 300
        Text {
            id: _titleCustom
            text: "Customize your quick access"
            font.pixelSize: 18 ; color: AppValueConst.value_popup_color
            anchors.top: parent.top ; anchors.topMargin: 10
            anchors.left: parent.left ; anchors.leftMargin: 10
        }
    }

    Component.onCompleted: {
        _addUser.creModelUsrAva()
    }
}
