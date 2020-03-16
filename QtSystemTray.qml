import QtQuick 2.14
import Qt.labs.platform 1.1
import QtQuick.Window 2.0

Item {
    property Window window;

    SystemTrayIcon {
        id: systemTray;
        visible: true;
        icon.source: "qrc:/graphics/su_icon.ico";
        tooltip: "SmartUser 1.0";
//        icon.mask: true;

        onActivated: {
            if(reason === SystemTrayIcon.Context) {
//                trayMenu.popup();
            }
            else {
                trayMenu.close();
                if(window.visibility === Window.Hidden ||
                   window.visibility === Window.Minimized) {
                    window.show();
                }
                else {
                    window.hide();
                }
            }
        }

        menu: Menu {
            id: trayMenu;

            onEnabledChanged: {
                console.log("ENABLED CHANGED");
            }

            onVisibleChanged: {
                console.log("VISIBLE CHANGED");
            }

            MenuItem {
                id: showGridMenuItem;
                text: qsTr("Show grid")
                checkable: true;
                onTriggered: {

                }
            }

            MenuItem {
                id: openWindowMenuItem;
                text: qsTr("Open window")
                onTriggered: {
                    appWindow.show()
                }
            }

            MenuSeparator { }

            MenuItem {
                id: exitMenuItem;
                text: qsTr("Exit")
                onTriggered: {
                    systemTray.hide();
                    Qt.quit();
                }
            }

            onAboutToHide: {
                console.log("About to hide");
            }

            onAboutToShow: {
                console.log("About to show");
            }

        }
    }

    Connections {
        target: window;
        onClosing: {
            console.log("send to system tray...")
//            console.log(parent, parent.parent, parent.parent.parent)
//            if(useTray === true) {
//                close.accepted = false;
//                window.hide();
//            } else {
//                Qt.quit();
//            }

            close.accepted = false;
            window.hide();
        }
    }
}
