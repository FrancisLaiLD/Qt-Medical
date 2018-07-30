import QtQuick 2.0
import "../Component/ScreenComponent"
import com.embeddeduse.models 1.0

EHome_StatusBar_Frame {
    id: idRoot
    onReleaseUserProfile: {
        console.log('user click -> go to User Profile')
        AppManager.handlePopupClick(HomeEnum.EVENT_SHOW_POPUP_USER_PROFILE)
    }

    onReleaseBackBtn: {
        console.log('user click -> go to Back')
        AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_BACK)
    }

    onReleaseHomeBtn: {
        console.log('user click -> go to Home screen')
        AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_HOME_SCREEN)
    }

    onReleaseCloudBtn: {
        console.log('user click -> go to User data cloud')
        AppManager.handleHomeScreenClick(HomeEnum.EVENT_GO_TO_USER_DATA)
    }

}
