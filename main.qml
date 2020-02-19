import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Universal 2.14
import QtQuick.Window 2.14

ApplicationWindow {
    id: applicationWindow;
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
    font.family: fontsLoader.notoName;

    Universal.background: applicationWindow.Universal.theme === Universal.Light ? "#E4E4E4" : "#1F1F1F";
    background: Rectangle {
        color: Universal.theme === Universal.Light ? "#FFFFFF" : "#000000"
    }

    signal aboutToQuit;
    signal stateChanged;

    MainWindow {
        id: mainWindow;
        anchors.fill: parent;
    } //MainWindow

//    ApplicationSystemTray {
//        id: applicationSystemTray;
////        isUsed: false;
//        mainAppWindowRef: applicationWindow;
//    }
    QtSystemTray {
        id: applicationSystemTray;
        mainAppWindowRef: applicationWindow;
    }

//    onVisibilityChanged: {
//        if ( visibility === Window.Minimized ) {
//            // When minimizied
//            hide()
//        }
//    }

    Fonts {
        id: fontsLoader;
    }

    onStateChanged: {
        console.log("STATE CHANGED", Qt.application.state);
    }

    onClosing: {
        console.log(Qt.application.state);
    }

    onAboutToQuit: {
        console.log("ABOUT TO QUIT");
//        nativeEventFilterQML.unregisterAllGlobalHotKeys();
    }
}
