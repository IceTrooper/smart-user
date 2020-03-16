import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import "../controls"

Pane
{
    contentWidth: parent.width;
    padding: 0;
    bottomPadding: 15;

    ColumnLayout {
        anchors.fill: parent;
        spacing: 5;

        StyledLabel {
            Layout.fillWidth: true;
            text: "Smart User";
            padding: 15;
            bottomPadding: 5;
            horizontalAlignment: Qt.AlignHCenter;
        }

        ItemDelegate {
            id: homeButton;
            Layout.fillWidth: true;
            text: "\uE80F Home";

            property url source: "qrc:/pages/HomePage.qml";
        }

        StyledLabel {
            text: "Applications";
            padding: 5;
            leftPadding: 10;
        }
    } //ColumnLayout
} //Pane
