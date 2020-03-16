import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Universal 2.14
import QtQuick.Window 2.14

import "../"
import "../components/drawer"

ApplicationWindow {
    id: mainWindow;
    visible: true;
    width: 600;
    minimumWidth: 600;
    height: 380;
    minimumHeight: 380;
    title: qsTr("Smart User 1.0");
    flags: Qt.Window |
           //Qt.MSWindowsFixedSizeDialogHint |
           Qt.WindowSystemMenuHint |
           Qt.WindowTitleHint |
           Qt.WindowMinimizeButtonHint |
           Qt.WindowCloseButtonHint |
           Qt.WindowStaysOnTopHint;
//    color: Qt.rgba(52/255, 52/255, 52/255, 1);
    opacity: 0.98;
    font.family: fonts.notoName;

    Universal.background: mainWindow.Universal.theme === Universal.Light ? "#E4E4E4" : "#1F1F1F";
    background: Rectangle {
        color: Universal.theme === Universal.Light ? "#FFFFFF" : "#000000"
    }

    signal aboutToQuit;
    signal stateChanged;

    ApplicationDrawer {
        id: applicationDrawer;
        height: parent.height;
        width: 180;
    } //ApplicationDrawer

    StackView {
        id: mainStackView;
        x: applicationDrawer.width * applicationDrawer.position;
        width: parent.width - applicationDrawer.width * applicationDrawer.position;
        height: parent.height;

        background: Rectangle {
            color: Universal.theme === Universal.Light ? "#FFFFFF" : "#000000"
        }

        initialItem: "qrc:/pages/HomePage.qml";
    } //StackView

//    ApplicationSystemTray {
//        id: applicationSystemTray;
////        isUsed: false;
//        mainAppWindowRef: mainWindow;
//    }
    QtSystemTray {
        id: appSystemTray;
        window: mainWindow;
//        useTray: useTrayCheckBox.checked;
    }

//    onVisibilityChanged: {
//        if ( visibility === Window.Minimized ) {
//            // When minimizied
//            hide()
//        }
//    }

//    onStateChanged: {
//        console.log("STATE CHANGED", Qt.application.state);
//    }

//    onVisibilityChanged: {
//        console.log("VISIBILITY", visibility)
//    }

    onClosing: {
        console.log(Qt.application.state);
    }

    onAboutToQuit: {
        console.log("ABOUT TO QUIT");
//        nativeEventFilterQML.unregisterAllGlobalHotKeys();
    }

//    Component.onCompleted: {
//        show();
//    }
}
