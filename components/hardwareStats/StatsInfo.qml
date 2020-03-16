import QtQuick 2.14
import QtQuick.Controls 2.14

import "../controls"

Pane {
    id: statsInfo;
    width: parent.width;
//    implicitWidth: statsInfoColumn.implicitWidth;
//    implicitHeight: statsInfoColumn.implicitHeight;
    padding: 6;

    background: Rectangle {
        color: "black";
        opacity: 0.35;
        radius: 8;
    }

    property string title;
    property int count;

    Column {
        id: statsInfoColumn;
        width: parent.width;

        spacing: 4;

        StatsInfoTitle {
            text: statsInfo.title;
        }

        StatsInfoCount {
            text: statsInfo.count;
        }
    } //Column
}

