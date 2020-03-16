import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

Pane {
    id: clicksCircularGauge;
    width: parent.width;
    padding: 6;

    background: Rectangle {
        color: "black";
        opacity: 0.35;
        radius: 8;
    }

    property string title;
    property int count;

    Column {
        width: parent.width;

        spacing: 4;

        StatsInfoTitle {
            text: clicksCircularGauge.title;
        }

        Pane {
            width: parent.width;
//            height: contentHeight + 2*padding;
            contentHeight: cpmGauge.implicitHeight;
//            contentWidth: cpmGauge.paintedWidth;
//            contentHeight: cpmGauge.paintedWidth;
            padding: 12;

            background: Rectangle {
                color: "black";
            }

            CircularGauge {
                id: cpmGauge;
                width: parent.width;

//                onImplicitHeightChanged: {
//                    console.log("hhh", implicitHeight)
//                }
//                onImplicitWidthChanged: {
//                    console.log("ww", implicitWidth)
//                }

                stepSize: 1;
                minimumValue: 0;
                maximumValue: 500;

                value: clicksCircularGauge.count;

                style: CircularGaugeStyle {
                    tickmarkStepSize: 50;
                }
            } //CircularGauge

            StatsInfoCount {
                width: 60;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.bottom: parent.bottom;
                anchors.bottomMargin: 45;
                text: clicksCircularGauge.count;
            } //StatsInfoCount
        } //Pane

    } //Column
}
