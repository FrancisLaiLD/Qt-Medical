import QtQuick 2.0
import Ehome 1.0
import "../OtherComponent"
Rectangle {
    id:idRoot
    width: 720
    height: 60
    //    color: "transparent"
    opacity: 1.0
    // define signals
    signal releaseUserProfile()
    signal releaseBackBtn()
    signal releaseHomeBtn()
    signal releaseCloudBtn()
    Image {
        id: _sttbar_bg
        source: "../../../resource/images/statusbar_bg_1.png"
    }
//    gradient:
//        Gradient {
//        GradientStop { position: 1.0; color: "white" }
//        GradientStop { position: 0.0; color: "#808080" }
//    }
    E_HorizentalLine {
        id: _line
        lineRange: parent.width ; lineHeight: 1
        anchors.bottom: parent.bottom
    }

    Rectangle {
        id: _userRect
        width: 50; height: 50
        anchors.bottom: parent.bottom
        //            color: "#83FF8C"
        color: "transparent"
        anchors.left: parent.left
        anchors.leftMargin: 0
        EButton_Image {
            id:_userIcon
            width: 40 ; height: 40
            anchors.centerIn: parent
            __imgSource: UserProfileModel.curUserIcon
            opacity: 1.0
        }
        MouseArea {
            id: idMouUserBtn
            anchors.fill: parent
            onClicked: {
                idRoot.releaseUserProfile()
            }
        }
    }

    Text {
        id: idUserName
        text: UserProfileModel.curUserName
        anchors.left: _userRect.right ; anchors.leftMargin: 0
        anchors.verticalCenter: _userRect.verticalCenter
        anchors.verticalCenterOffset: 12
        font.pixelSize: 16
    }

    EButton_Image {
        id: idBackBtn
//        anchors.verticalCenter: parent.verticalCenter
        anchors.bottom: parent.bottom ; anchors.bottomMargin: 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -70
        width: 45 ; height: 45
        __imgSource: ResStatusBar.ico_back
        onBtnRelease: {
            idRoot.releaseBackBtn();
        }
    }

    EButton_Image {
        id: idHomeBtn
        anchors.verticalCenter: idBackBtn.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        width: 45 ; height: 45
        __imgSource: ResStatusBar.ico_home
        onBtnRelease: {
            idRoot.releaseHomeBtn();
        }
    }

    EButton_Image {
        id: idCloudBtn
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 70
        anchors.verticalCenter: idBackBtn.verticalCenter
        width: 45 ; height: 45
        __imgSource: ResStatusBar.ico_data
        onBtnRelease: {
            idRoot.releaseCloudBtn()
        }
    }

    Text {
        id: _curTime
        text: Qt.formatDateTime(StatusbarModel.currentDT, "hh:mm AP")
        font.pixelSize: 24
        anchors.bottom: idBackBtn.bottom ; anchors.bottomMargin: 0
        anchors.right: parent.right ; anchors.rightMargin: 10
    }

    Image {
        id: _networkState
        anchors.right: parent.right ; anchors.rightMargin: 120
        anchors.bottom: parent.bottom ;anchors.bottomMargin: 0
        height: 40 ; width: 40
        fillMode: Image.PreserveAspectFit
        smooth: true
        source: getNetworkIcon()
    }

    Image {
        id: _vrState
        anchors.right: parent.right ; anchors.rightMargin: 165
        anchors.bottom: parent.bottom ;anchors.bottomMargin: 5
        height: 30 ; width: 30
        fillMode: Image.PreserveAspectFit
        smooth: true
        source: StatusbarModel.vrState ? ResStatusBar.ico_vr_on : ResStatusBar.ico_vr_off
    }

    function getNetworkIcon() {
        switch(StatusbarModel.networkState) {
        case 0 :
            return ResStatusBar.ico_wifi_0
        case 1 :
            return ResStatusBar.ico_wifi_1
        case 2 :
            return ResStatusBar.ico_wifi_2
        case 3 :
            return ResStatusBar.ico_wifi_3
        case 4 :
            return ResStatusBar.ico_wifi_4
        case 5 :
            return ResStatusBar.ico_wifi_strength_5
        default :
            console.log('out of range')
            break
        }
    }
    Component.onCompleted: {
        console.log('Statusbar completed')
    }
}
