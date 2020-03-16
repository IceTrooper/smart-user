import QtQuick 2.14
import Qt.labs.settings 1.1

import "windows"

Item {

    MainWindow {
        id: mainWindow;
    }

    property alias fonts: fontsLoader.fonts;
    Fonts {
        id: fontsLoader;
    }

    Settings {
        id: mainSettings;
        category: "general";
    }

    ApplicationsListModel {
        id: appsListModel;
    }

//    property alias winLoaders: windowLoaders.loaders;
    WindowLoaders {
        id: windowLoaders;
    }
}

