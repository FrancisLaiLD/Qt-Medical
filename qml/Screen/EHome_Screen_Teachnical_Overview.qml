import QtQuick 2.0

import "../Component/ScreenComponent"
import "../Component/ListViewComponent"
import "../Component/DelegateComponent"
import "../Component/OtherComponent"
import com.embeddeduse.models 1.0
import CustomGeometry 1.0

EHome_Main_Frame {
    id: idRoot

    ParallelAnimation {
        id: idMainAnimation
        running: false
        NumberAnimation { target: idRoot; property: "x"; from: -720; to: 0; duration: HomeScreenConst.time_screen_trans }
        NumberAnimation { target: idRoot; property: "opacity"; from: 0.0 ;to: 1.0; duration: HomeScreenConst.time_screen_trans }
    }

//    Image {
//        id: idMainImg
//        source: "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/icons/technical/6501.jpg"
//        anchors.fill: parent
//        fillMode: Image.PreserveAspectCrop
//    }

    EHome_Half_Frame {
        id: idAboveFrm
        //            Image {
        //                id: idImgDel
        //                source: "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/icons/technical/6501.jpg"
        //                anchors.fill: parent
        //            }
        GridView {
            id: idMainGrv
            width: parent.width - 40
            height: parent.height - 20
            anchors.centerIn: parent
            opacity: 1
            interactive: false
            cellWidth: 160 ; cellHeight: 190
            model: 10
            delegate: Rectangle {
                id: idDelegate
                width: 130
                height: 130
                color: "blue"
            }
        }
    }

    Component.onCompleted: {
        idMainAnimation.start()
    }
}
