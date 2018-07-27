import QtQuick 2.0
import com.embeddeduse.models 1.0

Item {
    Rectangle {
        id:root
        property string prefixImg: "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/icons/"
        width: 720
        height: 55

        color: "transparent"
        opacity: 1.0

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
                source: root.prefixImg + "doctor-2_n.png"
                MouseArea {
                    id: idMouUserBtn
                }
            }
        }

        Text {
            id: idUserName
            text: qsTr("Current User")
            anchors.left: idUserRect.right
            anchors.leftMargin: 5
            anchors.verticalCenter: idUserRect.verticalCenter
            anchors.verticalCenterOffset: 10
            font.pixelSize: 24
        }

        Image {
            id: idBackBtn

            anchors.verticalCenter: parent.top
            anchors.verticalCenterOffset: 30
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -85
            width: 60 ;height: parent.height
            source: root.prefixImg + (idMouBackBtn.pressed ? "ico_back_p.png" : "ico_back_n.png")
            MouseArea {
                id: idMouBackBtn
                anchors.fill: parent
                onClicked: {
                    AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_BACK)
                }
            }
        }

        Image {
            id: idHomeBtn
            anchors.verticalCenter: idBackBtn.verticalCenter
            width: 60 ;height: parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            source: root.prefixImg + (idMouHomeBtn.pressed ? "ico_home_p.png" : "ico_home_n.png")
            MouseArea {
                id: idMouHomeBtn
                anchors.fill: parent
                onClicked: {
                    AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_HOME_SCREEN)
                }
            }
        }

        Image {
            id: idCloudBtn
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 85
            width: 60 ;height: parent.height
            anchors.verticalCenter: idBackBtn.verticalCenter
            source: root.prefixImg + (idMouCloudBtn.pressed ? "ico_cloud_p.png" : "ico_cloud_n.png")
            MouseArea {
                id: idMouCloudBtn
                anchors.fill: parent
                onClicked: {
                    AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_USER_DATA)
                }
            }
        }

    }

}
