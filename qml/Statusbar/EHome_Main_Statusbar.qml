import QtQuick 2.0
import "../Component/ScreenComponent"
import Ehome 1.0

EHome_StatusBar_Frame {
    id: idRoot
    onReleaseUserProfile: {
        console.log('user click -> go to User Profile')
        if (MEASURE_CONTROL.isMeasuring)
            AppManager.handleShowPopup(HomeEnum.EVENT_SHOW_POPUP_NOTCHANGEUSER)
        else
            AppManager.handleShowPopup(HomeEnum.EVENT_SHOW_POPUP_USER_PROFILE)
    }

    onReleaseBackBtn: {
        AppManager.handleBackScreen()
    }

    onReleaseHomeBtn: {
        console.log('user click -> go to Home screen')
        AppManager.handleHomeScreen()
    }

    onReleaseCloudBtn: {
        console.log('user click -> go to User data cloud')
        AppManager.handleDataScreen()
    }

}
