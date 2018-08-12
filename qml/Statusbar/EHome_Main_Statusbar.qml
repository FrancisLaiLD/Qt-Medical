import QtQuick 2.0
import "../Component/ScreenComponent"
import Ehome 1.0

EHome_StatusBar_Frame {
    id: idRoot
    onReleaseUserProfile: {
        console.log('user click -> go to User Profile')
        AppManager.handleShowPopupClick(HomeEnum.EVENT_SHOW_POPUP_USER_PROFILE)
    }

    onReleaseBackBtn: {
        console.log('user click -> go to Back')
        AppManager.handleTransScreen(HomeEnum.EVENT_GO_TO_BACK)
    }

    onReleaseHomeBtn: {
        console.log('user click -> go to Home screen')
        AppManager.handleTransScreen(HomeEnum.EVENT_GO_TO_HOME_SCREEN)
    }

    onReleaseCloudBtn: {
        console.log('user click -> go to User data cloud')
        AppManager.handleTransScreen(HomeEnum.EVENT_GO_TO_USER_DATA)
    }

}
