import QtQuick 2.14

Item {
    property alias notoName: notoLoader.name;

    FontLoader {
        id: notoLoader;
        source: "qrc:/fonts/OpenSans-Regular.ttf";
    }
    FontLoader {
        source: "qrc:/fonts/OpenSans-Light.ttf";
    }
    FontLoader {
        source: "qrc:/fonts/OpenSans-Bold.ttf";
    }
}
