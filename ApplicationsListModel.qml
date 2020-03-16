import QtQuick 2.14

ListModel {
    id: drawerListModel;

    ListElement {
        appName: qsTr("Hardware Stats");
//        appName: QT_TR_NOOP("Hardware Stats");
        pageSource: "qrc:/pages/HardwareStatsPage.qml";
        toggleWindow: () => {
          drawerListModel.toggleWindow(windowLoaders.loaders.hardwareStatsLoader)
        };
    }

    ListElement {
        appName: "Break Alarm";
        pageSource: "qrc:/pages/HardwareStatsPage.qml";
    }

    ListElement {
        appName: "Timer";
        pageSource: "qrc:/pages/HardwareStatsPage.qml";
    }

    ListElement {
        appName: "Stoper";
        pageSource: "qrc:/pages/HardwareStatsPage.qml";
    }

    ListElement {
        appName: "Break Alarm";
        pageSource: "qrc:/pages/HardwareStatsPage.qml";
    }

    ListElement {
        appName: "Timer";
        pageSource: "qrc:/pages/HardwareStatsPage.qml";
    }

    ListElement {
        appName: "Stoper";
        pageSource: "qrc:/pages/HardwareStatsPage.qml";
    }

    function toggleWindow(loader) {
        windowLoaders.loaders.toggleWindow(loader);
    }
}
