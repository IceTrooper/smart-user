import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Universal 2.12

Control {
    id: control;

    enum Orientation {
        Horizontal,
        Vertical
    }

    property int orientation: StyledSeparator.Orientation.Horizontal;

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding);
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding);

    verticalPadding: orientation === StyledSeparator.Orientation.Horizontal ? 0 : 8;
    horizontalPadding: orientation === StyledSeparator.Orientation.Horizontal ? 8 : 0;

    contentItem: Rectangle {
        implicitWidth: orientation === StyledSeparator.Orientation.Horizontal ? 16 : 1;
        implicitHeight: orientation === StyledSeparator.Orientation.Horizontal ? 1 : 16;
        color: control.Universal.baseMediumLowColor;
    }
}
