#include "mousehook.h"

MouseHook* MouseHook::_instance = nullptr;

MouseHook::MouseHook()
{
}

MouseHook *MouseHook::getInstance()
{
    if(_instance == nullptr)
    {
        _instance = new MouseHook();
    }
    return _instance;
}

void MouseHook::installHook()
{
    if(hHookMouse != NULL)
    {
        qDebug() << "Mouse hook already exist!";
        return;
    }

    hHookMouse = SetWindowsHookEx(WH_MOUSE_LL, CustomLowLevelMouseProc, NULL, 0);

    if(hHookMouse == NULL)
    {
        qDebug() << "Mouse hook failed";
        return;
    }
    emit hookInstalled();
}

void MouseHook::uninstallHook()
{
    if(hHookMouse == NULL)
    {
        qDebug() << "There aren't any more mouse hooks installed";
        return;
    }

    if(UnhookWindowsHookEx(hHookMouse) == false)
    {
        qDebug() << "Unhook mouse failed" << endl;
        return;
    }
    hHookMouse = NULL;
    emit hookUninstalled();
}

LRESULT CALLBACK MouseHook::CustomLowLevelMouseProc(int nCode, WPARAM wParam, LPARAM lParam)
{
    MSLLHOOKSTRUCT cButton = *((MSLLHOOKSTRUCT*)lParam);

    QPoint mousePosition(cButton.pt.x, cButton.pt.y);

    //qDebug() << "Mouse:" << wParam << cButton.pt.x << cButton.pt.y << cButton.mouseData;
//    if(wParam != WM_MOUSEMOVE)
//    {
//        qDebug() << wParam;
//        qDebug() << mousePosition;
//    }

    getInstance()->emitMouseStateChanged((int)wParam, mousePosition);
    if((int)wParam != WM_MOUSEMOVE && getInstance()->blockMousePropagation && !MouseHook::getInstance()->allowNextMousePropagation)
    {
        return 1;
    }
    MouseHook::getInstance()->allowNextMousePropagation = false;
    return CallNextHookEx(/*getInstance()->hHookMouse*/NULL, nCode, wParam, lParam);
}

bool MouseHook::isHookInstalled()
{
    if(hHookMouse != NULL) return true;
    return false;
}

int MouseHook::convertMessageToEvent(int message)
{
    if(message == WM_MOUSEMOVE || message == WM_MOUSEFIRST) return MOUSEEVENTF_MOVE;
    else if(message == WM_LBUTTONDOWN) return MOUSEEVENTF_LEFTDOWN;
    else if(message == WM_LBUTTONUP) return MOUSEEVENTF_LEFTUP;
    else if(message == WM_RBUTTONDOWN) return MOUSEEVENTF_RIGHTDOWN;
    else if(message == WM_RBUTTONUP) return MOUSEEVENTF_RIGHTUP;
    else if(message == WM_MBUTTONDOWN) return MOUSEEVENTF_MIDDLEDOWN;
    else if(message == WM_MBUTTONUP) return MOUSEEVENTF_MIDDLEUP;
    else if(message == WM_MOUSEWHEEL) return MOUSEEVENTF_WHEEL;
    else if(message == WM_MOUSEHWHEEL || message == WM_MOUSELAST) return MOUSEEVENTF_HWHEEL;
    else if(message == WM_XBUTTONDOWN) return MOUSEEVENTF_XDOWN;
    else if(message == WM_XBUTTONUP) return MOUSEEVENTF_XUP;
    return 0;
}

QString MouseHook::getMessageString(int message)
{
    QString result;

    if(message == WM_MOUSEMOVE) result = "WM_MOUSEMOVE";
    else if(message == WM_MOUSEFIRST) result = "WM_MOUSEFIRST";
    else if(message == WM_LBUTTONDOWN) result = "WM_LBUTTONDOWN";
    else if(message == WM_LBUTTONUP) result = "WM_LBUTTONUP";
    else if(message == WM_LBUTTONDBLCLK) result = "WM_LBUTTONDBCLK";
    else if(message == WM_RBUTTONDOWN) result = "WM_RBUTTONDOWN";
    else if(message == WM_RBUTTONUP) result = "WM_RBUTTONUP";
    else if(message == WM_RBUTTONDBLCLK) result = "WM_RBUTTONDBLCLK";
    else if(message == WM_MBUTTONDOWN) result = "WM_MBUTTONDOWN";
    else if(message == WM_MBUTTONUP) result = "WM_MBUTTONUP";
    else if(message == WM_MBUTTONDBLCLK) result = "WM_MBUTTONDBLCLK";
    else if(message == WM_MOUSEWHEEL) result = "WM_MOUSEWHEEL";
    else if(message == WM_MOUSEHWHEEL) result = "WM_MOUSEHWHEEL";
    else if(message == WM_MOUSELAST) result = "WM_MOUSELAST";
    else if(message == WM_XBUTTONDOWN) result = "WM_XBUTTONDOWN";
    else if(message == WM_XBUTTONUP) result = "WM_XBUTTONUP";
    else if(message == WM_XBUTTONDBLCLK) result = "WM_XBUTTONDBLCLK";

    return result;
}

QString MouseHook::getEventString(int event)
{
    QString result;

    if(event & MOUSEEVENTF_ABSOLUTE) result += "MOUSEEVENTF_ABSOLUTE | ";
    if(event & MOUSEEVENTF_VIRTUALDESK) result += "MOUSEEVENTF_VIRTUALDESK | ";
    if(event & MOUSEEVENTF_MOVE) result += "MOUSEEVENTF_MOVE | ";
    if(event & MOUSEEVENTF_MOVE_NOCOALESCE) result += "MOUSEEVENTF_MOVE_NOCOALESCE | ";
    if(event & MOUSEEVENTF_LEFTDOWN) result += "MOUSEEVENTF_LEFTDOWN | ";
    if(event & MOUSEEVENTF_LEFTUP) result += "MOUSEEVENTF_LEFTUP | ";
    if(event & MOUSEEVENTF_RIGHTDOWN) result += "MOUSEEVENTF_RIGHTDOWN | ";
    if(event & MOUSEEVENTF_RIGHTUP) result += "MOUSEEVENTF_RIGHTUP | ";
    if(event & MOUSEEVENTF_MIDDLEDOWN) result += "MOUSEEVENTF_MIDDLEDOWN | ";
    if(event & MOUSEEVENTF_MIDDLEUP) result += "MOUSEEVENTF_MIDDLEUP | ";
    if(event & MOUSEEVENTF_XDOWN) result += "MOUSEEVENTF_XDOWN | ";
    if(event & MOUSEEVENTF_XUP) result += "MOUSEEVENTF_XUP | ";
    if(event & MOUSEEVENTF_WHEEL) result += "MOUSEEVENTF_WHEEL | ";
    if(event & MOUSEEVENTF_HWHEEL) result += "MOUSEEVENTF_HWHEEL | ";

    result.chop(3);
    return result;
}

QPoint MouseHook::calculateMouseAbsolutePosition(QPoint position)
{
    QPoint result;
    result.setX(position.x() * (0xFFFF / GetSystemMetrics(SM_CXSCREEN)/*-1*/) + 1);
    result.setY(position.y() * (0xFFFF / GetSystemMetrics(SM_CYSCREEN)) + 1);
    return result;
}

void MouseHook::sendMouseEvent(int event, QPoint position)
{
    allowNextMousePropagation = true;

    INPUT Input = {0};
    Input.type = INPUT_MOUSE;

    if(position.isNull())
    {
        POINT cursorPos;
        GetCursorPos(&cursorPos);
        Input.mi.dx = cursorPos.x;
        Input.mi.dy = cursorPos.y;
    }
    else
    {
        QPoint pos = calculateMouseAbsolutePosition(position);
        Input.mi.dx = static_cast<LONG>(pos.x());
        Input.mi.dy = static_cast<LONG>(pos.y());
    }
    qDebug() << "sendMouseInput" << getEventString(event) << Input.mi.dx << Input.mi.dy;
    Input.mi.dwFlags = event;
    SendInput(1, &Input, sizeof(INPUT));

//    ZeroMemory(&Input, sizeof(INPUT));
//    Input.type = INPUT_MOUSE;
//    Input.mi.dx = 300;
//    Input.mi.dy = 600;
//    Input.mi.dwFlags = MOUSEEVENTF_ABSOLUTE | event;
//    if(state == WM_RBUTTONUP) SendInput(1, &Input, sizeof(INPUT));

}

void MouseHook::emitMouseStateChanged(int state, QPoint point)
{
    //    qDebug() << "emit" << state << point;
    emit mouseStateChanged(state, point);
}

bool MouseHook::getBlockMousePropagation() const
{
    return blockMousePropagation;
}

void MouseHook::setBlockMousePropagation(bool block)
{
    if(this->blockMousePropagation == block)
        return;

    this->blockMousePropagation = block;
    emit blockMousePropagationChanged(this->blockMousePropagation);
}
