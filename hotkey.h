#ifndef HOTKEY_H
#define HOTKEY_H

#include <QObject>

class HotKey : public QObject
{
    Q_OBJECT
public:
    explicit HotKey(QObject *parent = nullptr);

signals:

};

#endif // HOTKEY_H
