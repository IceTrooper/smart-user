import QtQuick 2.14
import Qt.labs.platform 1.1
import QtQuick.Window 2.0

Item {
    property var mainAppWindowRef;

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
                if(applicationWindow.visibility === Window.Hidden ||
                   applicationWindow.visibility === Window.Minimized) {
                    applicationWindow.show();
                }
                else {
                    applicationWindow.hide();
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
                    applicationWindow.show()
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
        target: mainAppWindowRef;
        onClosing: {
            console.log("send to system tray...")
            close.accepted = false;
            applicationWindow.hide();
        }
    }
}
