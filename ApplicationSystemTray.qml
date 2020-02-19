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
                if(applicationWindow.visibility === Window.Hidden || applicationWindow.visibility === Window.Minimized)
                {
                    applicationWindow.show();
//                    applicationWindow.raise();
//                    applicationWindow.requestActivate();
                }
                else
                {
                    applicationWindow.hide();
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

    Connections {
        target: mainAppWindowRef;
        onClosing:
        {
            console.log("send to system tray...")
            close.accepted = false;
            applicationWindow.hide();
        }
    }
}
