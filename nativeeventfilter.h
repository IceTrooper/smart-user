#ifndef NATIVEEVENTFILTER_H
#define NATIVEEVENTFILTER_H

#include <QAbstractNativeEventFilter>
#include <QCoreApplication>
#include <QDebug>
#include <QWindow>
#include "windows.h"

#define HK_ALT MOD_ALT
#define HK_CTRL MOD_CONTROL
#define HK_NOREPEAT MOD_NOREPEAT
#define HK_SHIFT MOD_SHIFT
#define HK_WIN MOD_WIN

//https://evileg.com/en/post/165/
//https://forum.qt.io/topic/57372/does-global-shortcuts-exist/5
//https://github.com/Skycoder42/QHotkey

class NativeEventFilter : public QObject, public QAbstractNativeEventFilter
{
    Q_OBJECT
    Q_DISABLE_COPY(NativeEventFilter)
public:
    NativeEventFilter();

    static NativeEventFilter* getInstance();

    enum class Modifiers {
        Ctrl = HK_CTRL,
        Alt = HK_ALT,
        Shift = HK_SHIFT,
        NoRepeat = HK_NOREPEAT,
        Win = HK_WIN
    };
    Q_ENUM(Modifiers)

private:
    static NativeEventFilter* _instance;

    QMap<int, QString> globalHotKeysMap;
    int globalHotKeyCounter = 0;

protected:
    bool nativeEventFilter(const QByteArray &eventType, void *message, long *result);

signals:
//    void hk_togglegrid();
    void hk_mouse();
//    void hotKeyActivated(QString name);
    void activateHotKey(quint32 nativeKey, quint32 nativeMods);

public slots:
    bool findGlobalHotKey(QString globalHotKeyName, int &idOut);
    bool registerGlobalHotKey(QString globalHotKeyName, UINT modifiers, UINT vk, int &idOut);
    bool unregisterGlobalHotKey(int globalHotKeyId);
    bool unregisterGlobalHotKey(QString globalHotKeyName);
    void unregisterAllGlobalHotKeys();
};

#endif // NATIVEEVENTFILTER_H
