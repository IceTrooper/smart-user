#ifndef MOUSEHOOK_H
#define MOUSEHOOK_H

#include <iostream>
#include <Windows.h>
#include <QObject>
#include <QDebug>
#include <QQmlEngine>
#pragma comment(lib, "user32.lib")

//#define LBUTTONDOWN     WM_LBUTTONDOWN
//#define LBUTTONUP       WM_LBUTTONUP
//#define LBUTTONDBLCLK   WM_LBUTTONDBLCLK
//#define RBUTTONDOWN     WM_RBUTTONDOWN
//#define RBUTTONUP       WM_RBUTTONUP
//#define RBUTTONDBLCLK   WM_RBUTTONDBLCLK
//#define MBUTTONDOWN     WM_MBUTTONDOWN
//#define MBUTTONUP       WM_MBUTTONUP
//#define MBUTTONDBLCLK   WM_MBUTTONDBLCLK
//#define XBUTTONDOWN     WM_XBUTTONDOWN
//#define XBUTTONUP       WM_XBUTTONUP
//#define XBUTTONDBLCLK   WM_XBUTTONDBLCLK
//#define MOUSEMOVE       WM_MOUSEMOVE

using namespace std;

class MouseHook : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(MouseHook)
public:
    MouseHook();
    virtual ~MouseHook(){}

    static MouseHook* getInstance();

    static LRESULT CALLBACK CustomLowLevelMouseProc(int nCode, WPARAM wParam, LPARAM lParam);

    Q_PROPERTY(bool blockMousePropagation READ getBlockMousePropagation WRITE setBlockMousePropagation NOTIFY blockMousePropagationChanged)

//    enum class MouseButtons
//    {
//        LeftButton,
//        RightButton,
//        MiddleButton,
//        WheelButton
//    };

    bool getBlockMousePropagation() const;
    void setBlockMousePropagation(bool block);

    bool isHookInstalled();

    int convertMessageToEvent(int message);
    QString getMessageString(int message);
    QString getEventString(int event);
    QPoint calculateMouseAbsolutePosition(QPoint position);
//    QPoint getMouseAbsolutePosition();
    void sendMouseEvent(int event, QPoint position=QPoint());

private:
    static MouseHook* _instance;

    HHOOK hHookMouse = NULL;

    bool blockMousePropagation = false;
    bool allowNextMousePropagation=false;

    void emitMouseStateChanged(int state, QPoint point);

signals:
    void hookInstalled();
    void hookUninstalled();
    void mouseStateChanged(int state, QPoint point);
    void blockMousePropagationChanged(bool);

public slots:
    void installHook();
    void uninstallHook();

//    void sendMouse
};

//static QObject *QmlMouseHookSingletonProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
//{
//    Q_UNUSED(engine)
//    Q_UNUSED(scriptEngine)

//    MouseHook* example = MouseHook::getInstance();
//    return example;
//}

#endif // MOUSEHOOK_H
