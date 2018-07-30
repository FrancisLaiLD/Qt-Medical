import QtQuick 2.0
import com.embeddeduse.models 1.0

Rectangle {
    id:idRoot
    width: 720
    height: 55
    color: "transparent"
    opacity: 1.0
    // define signals
    signal releaseUserProfile()
    signal releaseBackBtn()
    signal releaseHomeBtn()
    signal releaseCloudBtn()
    Rectangle {
        id: idUserRect
        width: 50; height: 50
        anchors.bottom: parent.bottom
        //            color: "#83FF8C"
        color: "transparent"
        anchors.left: parent.left
        anchors.leftMargin: 0
        Image {
            id:idUserImg
            anchors.fill: parent
            source: StatusbarModel.userIcon
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
        text: /*qsTr("Not login")*/ StatusbarModel.userName
        anchors.left: idUserRect.right
        anchors.leftMargin: 3
        anchors.verticalCenter: idUserRect.verticalCenter
        anchors.verticalCenterOffset: 12
        font.pixelSize: 22
    }

    Image {
        id: idBackBtn
        anchors.verticalCenter: parent.top
        anchors.verticalCenterOffset: 30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -85
        width: 60 ;height: parent.height
        source: idMouBackBtn.pressed ? ResStatusBar.ico_back_p : ResStatusBar.ico_back_n
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
        source: idMouHomeBtn.pressed ? ResStatusBar.ico_home_p : ResStatusBar.ico_home_n
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
        anchors.horizontalCenterOffset: 85
        width: 60 ;height: parent.height
        anchors.verticalCenter: idBackBtn.verticalCenter
        source: idMouCloudBtn.pressed ? ResStatusBar.ico_cloud_p : ResStatusBar.ico_cloud_n
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
        height: 35 ; width: 70
        source: getNetworkIcon()
    }

    Image {
        id: idDayTimeIcon
        source: StatusbarModel.isDayTime ? ResStatusBar.ico_day : ResStatusBar.ico_night
        anchors.right: idNetworkIcon.left
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        height: 35 ; width: 35
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
