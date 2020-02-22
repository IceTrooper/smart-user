import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import "../components/controls"
import com.icetrooper.hotkeys 1.0

Page {
    id: hardwareStatsPage;
    title: "Home page";

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

                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        console.log("clicked");
                        console.log(HotKeys.Ctrl, HotKeys.Alt, HotKeys.Shift, HotKeys.NoRepeat, HotKeys.Win);
//                        HotKey.registerGlobalHotKey()
                    }
                }
            }

            StyledTitleLabel {
                text: "Home Page";
            }

            StyledLabel {
                text: "App made by IceTrooper"
                horizontalAlignment: Text.AlignRight;
                Layout.alignment: Qt.AlignRight;
            }

            Connections {
                target: HotKeys;
                onHk_mouse: {
                    console.log("JKJ");
                }

//                onHotKeyActivated: {
//                    console.log("Oh yeah");
//                }
            }

        } //ColumnLayout
    } //Pane
}
