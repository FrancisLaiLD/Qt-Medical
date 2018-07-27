import QtQuick 2.0
import "../Component/ScreenComponent"
import "../Component/ListViewComponent"
import "../Component/DelegateComponent"
import "../Component/OtherComponent"
import com.embeddeduse.models 1.0

EHome_Main_Frame {
    id:root

    ParallelAnimation {
        id: idMainAnimation
        running: false
        NumberAnimation { target: root; property: "x"; from: -720; to: 0; duration: 500 }
        NumberAnimation { target: root; property: "opacity"; from: 0.0 ;to: 1.0; duration: 500 }
    }

    EHome_Half_Frame {
        id: idAboveFrame
        x: 0; y: 0
//        mainColor: "#6A8CDA"
        Text {
            id: idTitleWeather
            anchors.centerIn: idAboveFrame
            text: qsTr("Weather")
            font.pixelSize: 36
        }
        onRelease: {
            AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_HOME_WEATHER)
        }
    }
    EHome_Half_Frame {
        id: idUnderFrame
        x: 0; y:510
//        mainColor: "#EDDC8F"
        Text {
            id: idTitleAdvanced
            anchors.centerIn: idUnderFrame
            text: qsTr("Advanced")
            font.pixelSize: 36
        }
        onRelease: {
            AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_HOME_WEATHER)
        }
    }


    Component.onCompleted: {
        idMainAnimation.start()
    }
}
