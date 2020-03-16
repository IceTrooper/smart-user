import QtQuick 2.14

Item {
    property alias loaders: _loaders;

    QtObject {
        id: _loaders;

        property alias hardwareStatsLoader: hsLoader;
//        property alias winBreakAlaramLoader;

        function toggleWindow(loader) {
            if(loader.active) {
//                console.log(loader.item.visible)
                if(loader.item.visible) {
//                    loader.item.requestActivate();
//                    loader.item.raise();
                    loader.item.visible = true;
                }
                else {
                    console.log("no-item");
                    loader.item.show();
//                    loader.item.visible = true;
                }
            } else {
                loader.active = true;
            }
        }
    }

    Loader {
        id: hsLoader;
//        active: false;
        active: true;
        asynchronous: true;
        source: "qrc:/windows/HardwareStatsWindow.qml";

        onLoaded: {
            item.show();
        }
    }
}
