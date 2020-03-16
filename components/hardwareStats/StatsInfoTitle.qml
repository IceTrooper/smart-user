import QtQuick 2.14
import QtQuick.Controls 2.14

Label {
    width: parent.width;
    padding: 4;
    leftPadding: 12;
    rightPadding: 12;

    horizontalAlignment: Qt.AlignHCenter;
    verticalAlignment: Qt.AlignVCenter;
    elide: Qt.ElideMiddle;

    font.pointSize: 12;
    color: "#fffc00";

    background: Rectangle {
        color: "black";
    }
}
