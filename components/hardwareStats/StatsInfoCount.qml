import QtQuick 2.14
import QtQuick.Controls 2.14

Pane {
    id: statsInfoCount;
    width: parent.width;
    contentWidth: countLabel.implicitWidth;
    contentHeight: countLabel.implicitHeight;

    padding: 4;
    horizontalPadding: 12;
    font.pointSize: 16;

    background: Rectangle {
        color: "black";
    }

    property string text;

    Label {
        id: countLabel;
        anchors.fill: parent;
//         Set leftMargin because of elide. When -4 even with elide at least two numbers are showed
        anchors.leftMargin: -4;
        horizontalAlignment: Qt.AlignRight;
        verticalAlignment: Qt.AlignVCenter;

        color: "#bfff00";
        elide: Qt.ElideLeft;

        text: statsInfoCount.text;
    } //Label

    Label {
        id: backgroundLabel;
        anchors.fill: parent;
        anchors.leftMargin: -4;
        horizontalAlignment: Qt.AlignRight;
        verticalAlignment: Qt.AlignVCenter;
        color: "#bfff00";
        opacity: 0.25;
        clip: true;

        text: "0".repeat(28);
    } //Label
}
