import QtQuick 2.0
import Ehome 1.0

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

    gradient:
        Gradient {
        GradientStop { position: 1.0; color: "white" }
        GradientStop { position: 0.0; color: "#808080" }
    }
    Rectangle {
        id: _userRect
        width: 50; height: 50
        anchors.bottom: parent.bottom
        //            color: "#83FF8C"
        color: "transparent"
        anchors.left: parent.left
        anchors.leftMargin: 0
        Image {
            id:_userIcon
            width: 40 ; height: 40
            anchors.centerIn: parent
            source: UserProfileModel.curUserIcon
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

    Image {
        id: idBackBtn
        anchors.verticalCenter: parent.top
        anchors.verticalCenterOffset: 30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -70
        width: 60 ;height: parent.height
        source: ResStatusBar.ico_back_n
        opacity: idMouBackBtn.pressed ? 0.5 : 1.0
        MouseArea {
            id: idMouBackBtn
            anchors.fill: parent
            onClicked: {
                idRoot.releaseBackBtn()
            }
        }
    }

    Image {
        id: idHomeBtn
        anchors.verticalCenter: idBackBtn.verticalCenter
        width: 60 ;height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        source: ResStatusBar.ico_home_n
        opacity: idMouHomeBtn.pressed ? 0.5 : 1.0
        MouseArea {
            id: idMouHomeBtn
            anchors.fill: parent
            onClicked: {
                idRoot.releaseHomeBtn()
            }
        }
    }

    Image {
        id: idCloudBtn
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 70
        width: 60 ;height: parent.height
        anchors.verticalCenter: idBackBtn.verticalCenter
        source: ResStatusBar.ico_cloud_n
        opacity: idMouCloudBtn.pressed ? 0.5 : 1.0
        MouseArea {
            id: idMouCloudBtn
            anchors.fill: parent
            onClicked: {
                idRoot.releaseCloudBtn()
            }
        }
    }

    Image {
        id: idBluetoothIcon
        source: StatusbarModel.bluetoothState ? ResStatusBar.ico_bluetooth_on : ResStatusBar.ico_bluetooth_off
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom

        height: 35; width: 25
    }

    Image {
        id: idNetworkIcon
        anchors.right: idBluetoothIcon.left
        anchors.rightMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -8
        height: 55 ; width: 55
        source: getNetworkIcon()
    }

    Image {
        id: idDayTimeIcon
        source: StatusbarModel.isDayTime ? ResStatusBar.ico_day : ResStatusBar.ico_night
        anchors.right: idNetworkIcon.left
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        height: 40 ; width: 40
    }

    function getNetworkIcon() {
        switch(StatusbarModel.networkState) {
        case 0 :
            return ResStatusBar.ico_wifi_strength_0
        case 1 :
            return ResStatusBar.ico_wifi_strength_1
        case 2 :
            return ResStatusBar.ico_wifi_strength_2
        case 3 :
            return ResStatusBar.ico_wifi_strength_3
        case 4 :
            return ResStatusBar.ico_wifi_strength_4
        case 5 :
            return ResStatusBar.ico_wifi_strength_5
        default :
            console.log('out of range')
            break
        }
    }
}
