import QtQuick.Controls 2.14
import QtQuick.Controls.Universal 2.14
import QtQuick.Layouts 1.14

import "../controls"

RowLayout {
    width: parent.width;
//    height: pageButton.implicitHeight;
    z: 0.5;

    spacing: 0;

//    Button {
//        implicitWidth: height;
//        implicitHeight: pageButton.implicitHeight;
//        spacing: 0;
//        padding: 0;
//        text: "\uE712"//"\uE7E8";
//        font.family: fontSeagoeMDL2;
//        checkable: true;

////        background: Rectangle {
////            implicitWidth: 32;
////            implicitHeight: 32;

////            visible: !flat || down || checked || highlighted;
////            color: down ? Universal.baseMediumLowColor :
////                   enabled && (highlighted || checked) ? Universal.accent :
////                                                         Universal.baseLowColor;

////            Rectangle {
////                width: parent.width;
////                height: parent.height;
////                color: "transparent";
////                visible: hovered;
////                border.width: 2; // ButtonBorderThemeThickness
////                border.color: Universal.baseMediumLowColor;
////            }
////        }
//    }

    ItemDelegate {
        id: appButton;
        Layout.fillWidth: true;
        text: appName;

//        background: Rectangle {
//            color:
//        }

//        contentItem: StyledLabel {
//            text: pageName;
//        }

        onClicked: {
            toggleWindow();
        }
    }

//    StyledSeparator {
//        Layout.fillHeight: true;
//        orientation: StyledSeparator.Orientation.Vertical;
//    }

    ItemDelegate {
        text: "\uE712";
        font.family: fonts.segoeMDL2AssetsName;
    }
}
