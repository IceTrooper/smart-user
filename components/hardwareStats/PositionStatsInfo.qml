import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

Pane {
    width: parent.width;

    padding: 6;

    property point position;
//    property alias xPosition: xStatsInfo.count;
//    property alias yPosition: yStatsInfo.count;

    background: Rectangle {
        color: "black";
        opacity: 0.35;
        radius: 8;
    }

    RowLayout {
        width: parent.width;
        spacing: 4;

        StatsInfo {
            id: xStatsInfo;
            Layout.fillWidth: true;
            Layout.minimumWidth: 62;
            Layout.preferredWidth: 62;
            count: position.x;
            title: "X";

            padding: 0;
            background: null;
        } //StatsInfo

        StatsInfo {
            id: yStatsInfo;
            Layout.fillWidth: true;
            Layout.minimumWidth: 62;
            Layout.preferredWidth: 62;
            count: position.y;
            title: "Y";

            padding: 0;
            background: null;
        } //StatsInfo
    } //RowLayout
}

