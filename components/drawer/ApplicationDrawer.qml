import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Universal 2.14

import "../controls"

Drawer {
    id: applicationDrawer;
    visible: true;

    modal: false;
    interactive: false;
    position: 1.0;
    clip: true;

    background: Rectangle {
        color: Universal.theme === Universal.Light ? "#EBEBEB" : "#2B2B2B"
    }

    ListView
    {
        id: listView;
        anchors.fill: parent;
        currentIndex: -1;

//        highlightMoveDuration: 0;
//        highlight: Component {
//            Rectangle {
//                color: appWindow.Universal.accent;
//            }
//        }

        model: DrawerListModel {}
        delegate: ItemDelegate {
            width: parent.width;
            height: implicitHeight;
            z: 0.5;

//            text: pageName;

            contentItem: StyledLabel {
                text: pageName;
            }

            onClicked: {
                console.log(pageSource);
            }
        }

        headerPositioning: ListView.OverlayHeader;
        header: Pane {
            id: drawerHeader;

            width: parent.width;
            contentWidth: parent.width;
            padding: 0;
            background: Rectangle {
                color: Universal.theme === Universal.Light ? "#EBEBEB" : "#2B2B2B"
            }
        }


    } //ListView
} //Drawer
