import QtQuick 2.0
import "../Component"

Item {
    id:root
    property string imgPrefix: "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/images/"
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
        width: 1920; height: 640
        x: 0 ; y: 80
        model: mod
        cellHeight: 320; cellWidth: 400
        delegate: EHome_HomeGridviewDelegate {
            id: idDelegateGrv
            onRelease: {
                AppManager.handleHomeClick(index)
            }
        }
    }
    Component.onCompleted: {
        getModelGrv()
        console.log('main.qml Complete')
    }

}
