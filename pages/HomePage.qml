import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import "../components/controls"

Page {
    id: hardwareStatsPage;
    title: "Home page"

    Pane {
        anchors.fill: parent;

        ColumnLayout {
            width: parent.width;
            spacing: 15;

            Rectangle {
                Layout.alignment: Qt.AlignHCenter;
                width: 280;
                height: 120;
                color: "purple";
            }

            StyledTitleLabel {
                text: "Home Page";
            }

        } //ColumnLayout
    } //Pane
}
