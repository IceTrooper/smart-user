import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.14
import QtQuick.Controls.Universal 2.14

import "components/drawer"

Item
{
    id: mainWindow;

    ApplicationDrawer {
        id: applicationDrawer;
        height: mainWindow.height;
        width: 120;
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
}
