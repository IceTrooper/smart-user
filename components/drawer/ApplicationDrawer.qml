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

//    background: Rectangle {
//        color: Universal.theme === Universal.Light ? "#EBEBEB" : "#2B2B2B"
//    }

    ScrollView {
        anchors.fill: parent;

//        rightPadding: 4;

        ListView
        {
            id: listView;
            currentIndex: -1;

    //        highlightMoveDuration: 0;
    //        highlight: Component {
    //            Rectangle {
    //                color: mainWindow.Universal.accent;
    //            }
    //        }

            model: appsListModel;//DrawerListModel {}
            delegate: DrawerDelegate {}

            headerPositioning: ListView.OverlayHeader;
            header: DrawerHeader {}

            footerPositioning: ListView.OverlayFooter;
            footer: DrawerFooter {}


        } //ListView

    }

} //Drawer
