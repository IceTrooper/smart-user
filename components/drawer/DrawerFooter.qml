import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import "../controls"

Pane {
    contentWidth: parent.width;
    padding: 0;

    RowLayout {
        anchors.fill: parent;
        z: 0.5;

        spacing: 0;

        Button {
            implicitWidth: height;
            implicitHeight: pageButton.implicitHeight;
            spacing: 0;
            padding: 0;
            text: "\uE7E8";
            font.family: fonts.segoeMDL2AssetsName;
            checkable: true;
        }

        ItemDelegate {
            id: pageButton;
            Layout.fillWidth: true;
            text: "Turn off";
        }
    }
} //Pane
