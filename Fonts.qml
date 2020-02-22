import QtQuick 2.14

Item {
    property alias notoName: notoLoader.name;
    property alias openSansName: openSansLoader.name;
    property alias robotoMonoName: robotoMonoLoader.name;

    FontLoader {
        id: openSansLoader;
        source: "qrc:/fonts/OpenSans-Regular.ttf";
    }
    FontLoader {
        source: "qrc:/fonts/OpenSans-Light.ttf";
    }
    FontLoader {
        source: "qrc:/fonts/OpenSans-Bold.ttf";
    }

    FontLoader {
        id: notoLoader;
        source: "qrc:/fonts/NotoSans-Regular.ttf";
    }
    FontLoader {
        source: "qrc:/fonts/NotoSans-Bold.ttf";
    }
    FontLoader {
        source: "qrc:/fonts/NotoSans-Italic.ttf";
    }

    FontLoader {
        id: robotoMonoLoader;
        source: "qrc:/fonts/RobotoMono-Regular.ttf";
    }
    FontLoader {
        source: "qrc:/fonts/RobotoMono-Light.ttf";
    }
    FontLoader {
        source: "qrc:/fonts/RobotoMono-Medium.ttf";
    }
    FontLoader {
        source: "qrc:/fonts/RobotoMono-Bold.ttf";
    }
}
