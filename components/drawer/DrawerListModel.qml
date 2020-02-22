import QtQuick 2.14

ListModel {
    id: drawerListModel;

    ListElement {
        pageName: "Home";
        pageSource: "qrc:/pages/HomePage.qml";
    }

    ListElement {
        pageName: "Hardware Stats";
        pageSource: "qrc:/pages/HardwareStatsPage.qml";
    }
}
