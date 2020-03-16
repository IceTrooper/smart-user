#include "nativeeventfilter.h"

NativeEventFilter* NativeEventFilter::_instance = nullptr;

NativeEventFilter::NativeEventFilter()
{

}

NativeEventFilter *NativeEventFilter::getInstance()
{
    if(_instance == nullptr)
    {
        _instance = new NativeEventFilter();
    }
    return _instance;
}

bool NativeEventFilter::findGlobalHotKey(QString globalHotKeyName, int &idOut)
{
    QMapIterator<int, QString> it(this->globalHotKeysMap);
    while(it.hasNext())
    {
        it.next();
        if(it.value() == globalHotKeyName)
        {
            idOut = it.key();
            return true;
        }
        UnregisterHotKey(NULL, it.key());
    }
    return false;
}

bool NativeEventFilter::registerGlobalHotKey(QString globalHotKeyName, UINT modifiers, UINT vk, int &idOut)
{
    this->globalHotKeyCounter++;

    if(RegisterHotKey(NULL, this->globalHotKeyCounter, modifiers, vk))
    {
        this->globalHotKeysMap.insert(this->globalHotKeyCounter, globalHotKeyName);
        idOut = globalHotKeyCounter;
        return true;
    }
    return false;
}

bool NativeEventFilter::unregisterGlobalHotKey(int globalHotKeyId)
{
    if(UnregisterHotKey(NULL, globalHotKeyId))
    {
        this->globalHotKeysMap.remove(globalHotKeyId);
        return true;
    }
    return false;
}

bool NativeEventFilter::unregisterGlobalHotKey(QString globalHotKeyName)
{
    int id;

    if(this->findGlobalHotKey(globalHotKeyName, id) &&
       UnregisterHotKey(NULL, id))
    {
        this->globalHotKeysMap.remove(id);
        return true;
    }
    return false;
}

void NativeEventFilter::unregisterAllGlobalHotKeys()
{
    QMapIterator<int, QString> it(this->globalHotKeysMap);
    while(it.hasNext())
    {
        it.next();
        UnregisterHotKey(NULL, it.key());
    }
    this->globalHotKeyCounter = 0;
    this->globalHotKeysMap.clear();
}

bool NativeEventFilter::nativeEventFilter(const QByteArray &eventType, void *message, long *result)
{
    Q_UNUSED(eventType);
    Q_UNUSED(result);

    MSG* msg = static_cast<MSG*>(message);
//    qDebug() << msg->message << msg->wParam << WM_HOTKEY;

    if(msg->message == WM_HOTKEY)
    {

        qDebug() << "HOTKEY" << msg->wParam;
//        emit hotKeyActivated(this->globalHotKeysMap[msg->wParam]);
//        if(msg->wParam == this->globalHotKeysMap["TOGGLEGRID_HK"])
//        {
////            INPUT Input = {0};
////            Input.type = INPUT_MOUSE;
////            POINT cursorPos;
////            GetCursorPos(&cursorPos);
////            qDebug() << cursorPos.x << cursorPos.y << (LONG)300;
////            Input.mi.dx = (LONG)300;
////            Input.mi.dy = (LONG)600;
////            Input.mi.dwFlags = MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_LEFTDOWN;
////            SendInput(1, &Input, sizeof(INPUT));

////            ZeroMemory(&Input, sizeof(INPUT));
////            Input.type = INPUT_MOUSE;
////            Input.mi.dx = 300;
////            Input.mi.dy = 600;
////            Input.mi.dwFlags = MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_LEFTUP;
////            SendInput(1, &Input, sizeof(INPUT));

////            qDebug() << "HotKey worked";
////            if(MouseHook::getInstance()->blockMousePropagation) MouseHook::getInstance()->blockMousePropagation = false;
////            else MouseHook::getInstance()->blockMousePropagation = true;

//            emit hk_togglegrid();
////            SendMessage(HWND_BROADCAST, WM_SYSCOMMAND, SC_MONITORPOWER, (LPARAM) 2);
//            return true;
//        }
//        else if(msg->wParam == this->globalHotKeysMap["MOUSE_HK"])
//        {
//            emit hk_mouse();
//            return true;
//        }
    }
    return false;
}
