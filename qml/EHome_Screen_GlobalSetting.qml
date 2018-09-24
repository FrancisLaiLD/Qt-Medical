import QtQuick 2.0

import "Component/ScreenComponent"
import "Component/ListViewComponent"
import "Component/DelegateComponent"
import "Component/OtherComponent"
import Ehome 1.0

Item {
    id:_root
    property string lastTime: HomeDailyModel.timeUpdate
    //    scrrenBgImg: "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/images/main_bg_25.jpg"
    ParallelAnimation {
        id: idMainAnimation
        running: false
        NumberAnimation { target: _root; property: "opacity"; from: 0.0 ;to: 1.0; duration: 1000 }
    }

    Image {
        id: _globalLoading
        visible: MEASURE_CONTROL.isMeasuring
        anchors.fill: parent
        source: "../resource/images/main_bg_12.jpg"
    }
    Rectangle {
        id:_rectGlobal
        visible: MEASURE_CONTROL.isMeasuring
        anchors.fill: parent
        opacity: 0.5
        MouseArea {
            id: _preventMou
            anchors.fill: parent
        }
    }
    EButton_StandAlone {
        id: _finSetting
        anchors.centerIn: _rectGlobal
        visible: MEASURE_CONTROL.isMeasuring
        onBtnClicked: {
            MEASURE_CONTROL.isMeasuring = false
            AppManager.handleTransScreen(HomeEnum.EVENT_GO_TO_HOME_SCREEN)
        }
    }

    Component.onCompleted: {
        idMainAnimation.start()
        //        HomeDailyModel.leftWeather.proWeatherProperty = 0
        //        idMainTimer.start()
    }
}
