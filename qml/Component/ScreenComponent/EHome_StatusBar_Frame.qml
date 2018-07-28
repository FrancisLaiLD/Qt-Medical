import QtQuick 2.0
import com.embeddeduse.models 1.0

Rectangle {
    id:idRoot
    property string prefixImg: "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/icons/Statusbar/"
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
        width: 55; height: parent.height
        //            color: "#83FF8C"
        color: "transparent"
        anchors.left: parent.left
        anchors.leftMargin: 0
        Image {
            id:idUserImg
            anchors.fill: parent
            source: idRoot.prefixImg + "doctor-2_n.png"
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
        text: qsTr("Current User")
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
        source: idRoot.prefixImg + (idMouBackBtn.pressed ? "ico_back_p.png" : "ico_back_n.png")
        MouseArea {
            id: idMouBackBtn
            anchors.fill: parent
            onClicked: {
                idRoot.releaseBackBtn()
                AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_BACK)
            }
        }
    }

    Image {
        id: idHomeBtn
        anchors.verticalCenter: idBackBtn.verticalCenter
        width: 60 ;height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        source: idRoot.prefixImg + (idMouHomeBtn.pressed ? "ico_home_p.png" : "ico_home_n.png")
        MouseArea {
            id: idMouHomeBtn
            anchors.fill: parent
            onClicked: {
                idRoot.releaseHomeBtn()
//                AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_HOME_SCREEN)
            }
        }
    }

    Image {
        id: idCloudBtn
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 85
        width: 60 ;height: parent.height
        anchors.verticalCenter: idBackBtn.verticalCenter
        source: idRoot.prefixImg + (idMouCloudBtn.pressed ? "ico_cloud_p.png" : "ico_cloud_n.png")
        MouseArea {
            id: idMouCloudBtn
            anchors.fill: parent
            onClicked: {
                idRoot.releaseCloudBtn()
//                AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_USER_DATA)
            }
        }
    }

    Image {
        id: idBluetoothIcon
        source: idRoot.prefixImg + "bluetooth_" + (StatusbarModel.bluetoothState ? "on" : "off") + ".png"
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        height: 35; width: 25
    }

    Image {
        id: idNetworkIcon
        source: idRoot.prefixImg + "ico_network_" +StatusbarModel.networkState + ".png"
        anchors.right: idBluetoothIcon.left
        anchors.rightMargin: 5
        anchors.bottom: parent.bottom
        height: 35 ; width: 70
    }

    Image {
        id: idDayTimeIcon
        source: idRoot.prefixImg + (StatusbarModel.isDayTime ? "ico_day" : "ico_night") + ".png"
        anchors.right: idNetworkIcon.left
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        height: 35 ; width: 35
    }

}
