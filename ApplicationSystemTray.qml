import QtQuick 2.9
import QtQuick.Controls 1.4
import QSystemTrayIcon 1.0
import QtQuick.Window 2.0

Item {
    id: applicationSystemTray;

//    property bool isUsed: true;
    property var mainAppWindowRef;

//    onIsUsedChanged: {
//        if(isUsed)
//        {
//            systemTray.show();
//        }
//        else
//        {
//            systemTray.hide();
//        }
//    }

    QSystemTrayIcon {
        id: systemTray;

        Component.onCompleted: {
            icon = iconTray;
            toolTip = "SmartUser 1.0";
            show();
        }

        onActivated: {
            if(reason === 1 /*QSystemTrayIcon.Context*/)
            {
                trayMenu.popup();
            }
            else
            {
                if(appWindow.visibility === Window.Hidden || appWindow.visibility === Window.Minimized)
                {
                    appWindow.show();
//                    appWindow.raise();
//                    appWindow.requestActivate();
                }
                else
                {
                    appWindow.hide();
                }
            }
        }
    }

    Menu {
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

    Connections {
        target: mainAppWindowRef;
        onClosing:
        {
            console.log("send to system tray...")
            close.accepted = false;
            appWindow.hide();
        }
    }
}
