import QtQuick 2.0

import "../Component/ScreenComponent"
import "../Component/ListViewComponent"
import "../Component/DelegateComponent"
import "../Component/OtherComponent"
import Ehome 1.0

EHome_Main_Frame {
    id:_root
    screenTitle: AppStringConst.STR_COMMAND_MEASURE_TEMP
    __titleMarginTop: 15
    property bool __isCalculating: false
    property bool isSavingData: false
    // internal
    property string __colorTop: ""
    property bool _isSavingData: false
    property real __curTemp: 30
    property real __finalValue: -1
    property string __curTempString: __curTemp
    property int resolution: 24
    property int maxValue: 42
    property int axisRange: 300
    property int startValue: 30
    ParallelAnimation {
        id: idMainAnimation
        running: false
        NumberAnimation { target: _root; property: "x"; from: -720; to: 0; duration: AppValueConst.time_screen_trans }
        NumberAnimation { target: _root; property: "opacity"; from: 0.0 ;to: 1.0; duration: AppValueConst.time_screen_trans }
    }

    function getColorTop() {
        var topColor = ""
        if (__curTemp > 30 && __curTemp < 35)
            topColor = "#00D7DE"
        else if (__curTemp > 35 && __curTemp < 36)
            topColor = "#18DE00"
        else if (__curTemp > 36 && __curTemp < 37)
            topColor = "#ACDE00"
        else if (__curTemp > 37 && __curTemp < 38)
            topColor = "#DEC600"
        else if (__curTemp > 38 && __curTemp < 39)
            topColor = "#DE8000"
        else if (__curTemp > 39 && __curTemp < 40)
            topColor = "#DE3D00"
        else if (__curTemp > 39)
            topColor = "#DE0000"
        return topColor
    }
    function getHeightTemp() {
        return (__curTemp - 30 ) * axisRange/(maxValue - startValue )
    }

    Image {
        id: _therometter
        source: Resource_General.thermometer_512
        width: 512 ; height: 512
        anchors.top: parent.top ; anchors.topMargin: 60
        //        anchors.left: parent.left ; anchors.leftMargin: 60
        anchors.horizontalCenter: parent.horizontalCenter
        MouseArea {
            id: _mouStatus
            anchors.fill: parent
            onClicked: {
                if (!_root.__isCalculating) {
                    __isCalculating = true
                    _getFinalValue.start()
                    _testIncrease.start()
                }
                else {
                    __isCalculating = false
                    _testIncrease.stop()
                    _testDecrease.stop()
                }
            }
        }
    }
    Column {
        //        spacing: parent.width/resolution
        anchors.right: _therometter.left ; anchors.rightMargin: -205
        anchors.verticalCenter: _therometter.top ; anchors.verticalCenterOffset: 40
        Repeater {
            model: resolution + 1
            Item {
                E_HorizentalLine {
                    id: resLine
                    anchors.right: parent.right
                    y: index* axisRange/resolution
                    lineColor: "green" ; lineRange: index%2 === 0 ? 90 : 30 ; lineHeight: 2
                }
                Text {
                    id: resText
                    text: (maxValue - startValue)/resolution* (resolution - index) + startValue
                    font.pixelSize: index%2 === 0 ? 20 : 18
                    anchors.right: resLine.left
                    anchors.rightMargin: 3
                    anchors.verticalCenter: resLine.verticalCenter
                }
            }
        }
    }

    Rectangle {
        id: _columnTemp
        width: 65 ; height: 40 + getHeightTemp(); radius: 3
        gradient:
            Gradient {
            GradientStop { id: _gradTop ; position: 0.0; color: _root.getColorTop() }
            GradientStop { id: _gradBot ; position: 1.0; color: _circle.color }
        }
        anchors.horizontalCenter: _circle.horizontalCenter
        anchors.bottom: _circle.top ; anchors.bottomMargin: -20
    }
    Image {
        id: _valArrow
        source: Resource_General.left_arrow_64
        anchors.verticalCenter: _columnTemp.top
        anchors.left: _columnTemp.right ; anchors.leftMargin: 10
    }
    Text {
        id: _curValue
        text: _root.__curTemp.toFixed(1)
        font.pixelSize: 40 ; font.bold: true
        color: getColorTop()
        anchors.verticalCenter: _valArrow.verticalCenter
        anchors.left: _valArrow.right ; anchors.leftMargin: 5
    }

    Rectangle {
        id: _circle
        width: 130 ; height: 130 ; radius: 65
        color: "green"
        anchors.horizontalCenter: _therometter.horizontalCenter
        anchors.bottom: _therometter.bottom ; anchors.bottomMargin: 21
    }

    Text {
        id: _status
        text: _root.__isCalculating ? "Measuring...Tap to stop measuring" : "Tap therometter to start measuring"
        color: "gray" ; font.pixelSize: 18 ; font.italic: true
        anchors.top: _therometter.bottom ; anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
    }

    E_HorizentalLine {
        id: _endLineTheroMetter
        lineRange: parent.width - 160
        anchors.top: _status.bottom ; anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Rectangle {
        id: _bgSendData
        anchors.fill: parent
        color: "gray" ; opacity: 0.72
        visible: _isSavingData
        MouseArea {
            id: _preventMou
            anchors.fill: parent
            onClicked: {
                if (_root._isSavingData)
                    _root._isSavingData = false
            }
        }
    }
    Rectangle {
        id: _resultHandle
        width: parent.width ; height: 600 ; radius: 16
        anchors.horizontalCenter: parent.horizontalCenter
        y: _endLineTheroMetter.y + 30
//        gradient:
//            Gradient {
//            GradientStop { position: 0.0; color: _isSavingData ? "#808080" : "transparent" }
//            GradientStop { position: 1.0; color: _isSavingData ? "white"   : "transparent"}
//        }
        color: "transparent"
        Text {
            id: _result
            text: "Result :"
            font.pixelSize: 32
            anchors.right: parent.horizontalCenter
            anchors.top: parent.top ; anchors.topMargin: 30
        }

        Text {
            id: _result_val
            text: MEASURE_CONTROL.isHasMeasureResult ? __curTemp.toFixed(1) : "---"
            font.pixelSize: 32
            anchors.verticalCenter: _result.verticalCenter
            anchors.left: _result.right ; anchors.leftMargin: 20
        }

        EButton_StandAlone {
            id: _saveTemp
            btnLabel: "Save your data"
            btnWidth: 160
            visible: MEASURE_CONTROL.isHasMeasureResult && !_root._isSavingData
            __btnEnable: !MEASURE_CONTROL.isSavedData
            anchors.verticalCenter: _result.verticalCenter
            anchors.right: parent.right ; anchors.rightMargin: 20
            onBtnClicked: {
                console.log('Saving data')
//                AppManager.handleShowPopup(HomeEnum.EVENT_SHOW_POPUP_SAVEDATA)
                _root.isSavingData = true
                _root._isSavingData = !_root._isSavingData
            }
        }
        EButton_StandAlone {
            id: _closeSaving
            btnLabel: "Save"
            btnWidth: 180 ; btnHeight: 50 ; btnLabelFont: 18
            visible: MEASURE_CONTROL.isHasMeasureResult
            __btnEnable: !MEASURE_CONTROL.isSavedData
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom ; anchors.bottomMargin: 10
            onBtnClicked: {
                console.log('Saving data')
//                AppManager.handleShowPopup(HomeEnum.EVENT_SHOW_POPUP_SAVEDATA)
                AppManager.handleCreateNewRec(MEASURE_CONTROL.finalMeasureVal)
                _root.isSavingData = true
                MEASURE_CONTROL.isHasMeasureResult = false
                _root._isSavingData = !_root._isSavingData
            }
        }
    }

    ParallelAnimation {
        id: _aniShow
        NumberAnimation { target: _resultHandle; property: "y";             from: _endLineTheroMetter.y + 30 ;to: 350;        duration: AppValueConst.time_screen_show_popup}
        ColorAnimation  { target: _resultHandle; property: "color";         from: "transparent" ;       to: "#5695D5";  duration: AppValueConst.time_screen_show_popup}
//        NumberAnimation { target: _userData; property: "opacity";       from: 1.0;                  to: 0.72;       duration: AppValueConst.time_screen_trans }
    }
    ParallelAnimation {
        id: _aniHide
        NumberAnimation { target: _resultHandle; property: "y";             from: 350 ;         to: _endLineTheroMetter.y + 30;        duration: AppValueConst.time_screen_show_popup}
        ColorAnimation  { target: _resultHandle; property: "color";         from: "#5695D5" ;   to: "transparent";      duration: AppValueConst.time_screen_show_popup}
//        NumberAnimation { target: _userData; property: "opacity";       from: 0.72;          to: 1.0;               duration: AppValueConst.time_screen_trans }
    }
    on_IsSavingDataChanged: {
        if (_isSavingData)
            _aniShow.start()
        else
            _aniHide.start()
    }

    Timer {
        id: _testIncrease
        interval: 10
        onTriggered: {
            if (__curTemp > maxValue)
            {
                stop()
                _testDecrease.start()
            }
            __curTemp +=0.02
        }
        repeat: __curTemp <= maxValue ? true : false
    }

    Timer {
        id: _testDecrease
        interval: 10
        onTriggered: {
            if (__curTemp < startValue)
            {
                _testDecrease.stop()
                _testIncrease.start()
            }
            __curTemp -=0.02
        }
        repeat: true
    }
    // property for timer _getFinalValue
    property int _resultStack: 0
    property real _preValue: 0
    Timer {
        id: _getFinalValue
        interval: 100
        repeat: true
        onTriggered: {
            _preValue = __finalValue.toFixed(1)
            __finalValue  = __curTemp.toFixed(1)
            console.log('current value: ' + _preValue + ' : ' + __finalValue )
            if (__finalValue  === _preValue)
            {
                _resultStack++
                console.log('current stack value: ' + _resultStack )
                if (_resultStack === 10)
                {
                    console.log('has final result')
                    MEASURE_CONTROL.isHasMeasureResult = true
                    MEASURE_CONTROL.finalMeasureVal = __finalValue
                    stop()
                }
            }
            else {
                _resultStack = 0
            }
        }
    }

    on__IsCalculatingChanged: {
        if (__isCalculating === false)
        {
            MEASURE_CONTROL.isMeasuring = false
        }
        else
        {
            MEASURE_CONTROL.isMeasuring = true
            MEASURE_CONTROL.isHasMeasureResult = false
        }
    }

    Component.onCompleted: {
        // C++
        idMainAnimation.start()
        MEASURE_CONTROL.isHasMeasureResult = false
        MEASURE_CONTROL.isMeasuring = false
        _root.__curTemp = 30
    }
    Component.onDestruction: {
        // remove Measure states
        MEASURE_CONTROL.isHasMeasureResult = false
        MEASURE_CONTROL.isMeasuring = false
        // stop all timer
        _testDecrease.stop()
        _testIncrease.stop()
        _getFinalValue.stop()
    }
}


