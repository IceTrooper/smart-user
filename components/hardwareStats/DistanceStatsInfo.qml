import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

Pane {
    width: parent.width;

    padding: 6;

    property int distance;

    background: Rectangle {
        color: "black";
        opacity: 0.35;
        radius: 8;
    }

    RowLayout {
        width: parent.width;
        spacing: 4;

        StatsInfo {
            Layout.minimumWidth: 60;
            Layout.fillWidth: true;
            count: (distance - distance % 10000) / 100000;
            title: "km";

            padding: 0;
            background: null;
        } //StatsInfo

        StatsInfo {
            Layout.preferredWidth: 60;
            count: ((distance - distance % 100) / 100) % 1000;
            title: "m";

            padding: 0;
            background: null;
        } //StatsInfo

        StatsInfo {
            Layout.preferredWidth: 48;
            count: distance % 100;
            title: "cm";

            padding: 0;
            background: null;
        } //StatsInfo
    } //RowLayout
}

