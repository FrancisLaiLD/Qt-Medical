import QtQuick 2.9
import QtQuick.Window 2.2
import "Component"

Window {
    visible: true
    width: 1920
    height: 720
    title: qsTr("Medical Management")
    ListModel {
        id: mod
    }

    function getModelGrv() {
        mod.clear()
//        for (var i= 0; i< /*HomeModel.listHomeModel.count()*/2; i++)
//        {
//            mod.append(
//                        {"elementLabel": HomeModel.listHomeModel[i].label,"elementImgLink": HomeModel.listHomeModel[i].imageLink}
//                           )
//        }
        mod.append( {"elementLabel": "Home 1","nCount": 1, "elementImgLink": "image"})
        mod.append( {"elementLabel": "Home 2", "elementImgLink": "image"})
        mod.append( {"elementLabel": "Home 3", "elementImgLink": "image"})
        mod.append( {"elementLabel": "Home 4", "elementImgLink": "image"})
        mod.append( {"elementLabel": "Home 5", "elementImgLink": "image"})
    }

    GridView {
        id: idMainGrv
        width: 1920; height: 640
        x: 0 ; y: 80
        model: mod
        cellHeight: 320; cellWidth: 320
        delegate: Q_HomeGridviewDelegate {
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
