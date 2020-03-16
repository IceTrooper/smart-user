#include <QApplication>
#include <QDebug>
#include <QIcon>
#include <QSettings>
#include <QSystemTrayIcon>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include "version.h"

#include "nativeeventfilter.h"
#include "mousehook.h"
#include "mouseanalyzer.h"

Q_DECLARE_METATYPE(QSystemTrayIcon::ActivationReason)

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;

    app.setQuitOnLastWindowClosed(false);

    QQuickStyle::setStyle("Universal");

    app.setApplicationName(VER_PRODUCTVERSION_STR);
    app.setOrganizationName(VER_COMPANYNAME_STR);
    app.setOrganizationDomain(VER_COMPANYDOMAIN_STR);
    app.setApplicationDisplayName(VER_PRODUCTNAME_STR);
    QSettings::setDefaultFormat(QSettings::IniFormat);

//    qmlRegisterSingletonType<MouseHook>("MouseHook", 1, 0, "QmlMouseHook", QmlMouseHookSingletonProvider);

//    //----- GLOBAL HOT KEYS -----
////    NativeEventFilter::getInstance()->registerGlobalHotKey("TOGGLEGRID_HK", HK_CTRL | HK_ALT | HK_SHIFT | HK_NOREPEAT, 'D');
////    NativeEventFilter::getInstance()->registerGlobalHotKey("MOUSE_HK", HK_ALT, 'Q');
//    app.installNativeEventFilter(NativeEventFilter::getInstance());
//    qmlRegisterUncreatableType<NativeEventFilter>("com.icetrooper.hotkeys", 1, 0, "HotKeys", "Cannot create HotKey in QML");
//    //----- GLOBAL HOT KEYS -----

    //----- SYSTEM TRAY ICON -----
    // Register QSystemTrayIcon in Qml
    qmlRegisterType<QSystemTrayIcon>("QSystemTrayIcon", 1, 0, "QSystemTrayIcon");
    // Register in QML the data type of click by tray icon
    qRegisterMetaType<QSystemTrayIcon::ActivationReason>("ActivationReason");
    engine.rootContext()->setContextProperty("iconTray", QIcon(":/graphics/su_icon.ico"));
    //https://evileg.com/en/post/180/
    //----- SYSTEM TRAY ICON -----

    engine.rootContext()->setContextProperty("appVersion", VER_FILEVERSION_STR);
    engine.rootContext()->setContextProperty("mouseHookQML", MouseHook::getInstance());
    MouseHook::getInstance()->installHook();

    qmlRegisterUncreatableType<MouseData>("MouseData", 1, 0, "MouseData", "MouseData class uncreatable");
    MouseAnalyzer mouseAnalyzer(nullptr, app.screens());
    engine.rootContext()->setContextProperty("mouseAnalyzer", &mouseAnalyzer);
//    qmlRegisterUncreatableType<MouseAnalyzer>("Analyzer", 1, 0, "MouseAnalyzer", "MouseAnalyzer class uncreatable");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

//    QObject::connect(&app, SIGNAL(aboutToQuit()), engine.rootObjects().first(), SIGNAL(aboutToQuit()));
//    QObject::connect(&app, SIGNAL(applicationStateChanged(Qt::ApplicationState)), engine.rootObjects().first(), SIGNAL(stateChanged()));

    return app.exec();
}
