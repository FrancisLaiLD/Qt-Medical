import QtQuick 2.0
import "../Component/ScreenComponent"
import "../Component/ListViewComponent"
import "../Component/DelegateComponent"
import "../Component/OtherComponent"

EHome_Main_Frame {
    ListModel {
        id: mod
    }

    function getModelGrv() {
        mod.clear()
        for (var i= 0; i< HomeModel.homeModelSize; i++)
        {
            mod.append({"elementVisible": HomeModel.listHomeModel[i].proVisible, "elementEnable": HomeModel.listHomeModel[i].proEnable, "elementLabel": HomeModel.listHomeModel[i].proLabel, "elementImgLink": HomeModel.listHomeModel[i].proImgLink})
        }
    }

    GridView {
        id: idMainGrv
        anchors.fill: parent
        model: mod
        clip: true
        interactive: false
        cellHeight: 360; cellWidth: 360
        delegate: EHome_GridviewDelegate {
            id: idDelegateGrv
            elementWidth: 300
            elementHeight: 300
            onRelease: {
                AppManager.handleHomeClick(index)
            }
        }
    }
    Component.onCompleted: {
        getModelGrv()
        console.log('[qml] EHome_Screen_Home_Menu Complete')
    }

}
