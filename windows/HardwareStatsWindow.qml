import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Window 2.14
import QtQuick.Layouts 1.14

import "../components/hardwareStats"

ApplicationWindow {
    id: hsWindow;
    x: 800;
//    y: 600;
    y: 50;
    // Cannot set visible in window property because of parent bug in Loader
//    visible: true;
    width: 250;
//    height: 600;
    height: mouseStatsColumn.implicitHeight
            + mouseStatsColumn.anchors.topMargin
            + mouseStatsColumn.anchors.bottomMargin;
//    maximumHeight: mouseStatsColumn.implicitHeight
//                       + mouseStatsColumn.anchors.topMargin
//                       + mouseStatsColumn.anchors.bottomMargin;
    minimumWidth: 250;
    maximumWidth: 400;
    minimumHeight: 200;
    flags: Qt.Window |
           //Qt.MSWindowsFixedSizeDialogHint |
           Qt.WindowSystemMenuHint |
           Qt.WindowTitleHint |
           Qt.WindowMinimizeButtonHint |
           Qt.WindowCloseButtonHint |
           Qt.WindowStaysOnTopHint;
//           Qt.WA_DeleteOnClose
    title: "Mouse Stats";

    font.family: fonts.robotoMonoName;

    Component.onCompleted: {
        console.log(parent, parent.parent, parent.parent.parent);
    }

    background: Image {
        fillMode: Image.Tile;
        source: "qrc:/graphics/circuit_green_seamless.jpg";
    }

    Column {
        id: mouseStatsColumn;
        anchors.fill: parent;
        anchors.margins: 15;
        spacing: 8;

        ClicksCircularGauge {
            title: "Clicks Per Minute";
            count: 120;
        }

        DistanceStatsInfo {
            distance: mouseAnalyzer.overallData.distance;
        }

        StatsInfo {
            title: "Mouse Clicks";
            count: leftStatsInfo.count +
                   rightStatsInfo.count +
                   middleStatsInfo.count;
        }

        StatsInfo {
            id: leftStatsInfo;
            title: "Left Button";
            count: mouseAnalyzer.overallData.leftButton;
        }

        StatsInfo {
            id: rightStatsInfo;
            title: "Right Button";
            count: mouseAnalyzer.overallData.rightButton;
        }

        StatsInfo {
            id: middleStatsInfo;
            title: "Middle Button";
            count: mouseAnalyzer.overallData.middleButton;
        }

        StatsInfo {
            title: "Mouse Wheel";
            count: mouseAnalyzer.overallData.wheelForward;
        }

        PositionStatsInfo {
            position: mouseAnalyzer.position;
        }
    }


//    ScrollView {
//        SplitView {

//        }
//    }

//    Timer {
//        interval: 5000;
//        repeat: true;
//        running: true;
//        onTriggered: {
//            console.log(visible, visibility, active, parent, parent.parent, ApplicationWindow.window);
//            show();
//        }
//    }
}
