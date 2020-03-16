#ifndef MOUSEDATA_H
#define MOUSEDATA_H

#include <QObject>
#include <QDebug>
#include <QJsonObject>

class MouseData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int leftButton READ getLeftButton NOTIFY leftButtonChanged)
    Q_PROPERTY(int rightButton READ getRightButton NOTIFY rightButtonChanged)
    Q_PROPERTY(int middleButton READ getMiddleButton NOTIFY middleButtonChanged)
    Q_PROPERTY(int wheelForward READ getWheelForward NOTIFY wheelForwardChanged)
    Q_PROPERTY(int wheelBackward READ getWheelBackward NOTIFY wheelBackwardChanged)
    Q_PROPERTY(double distance READ getDistance NOTIFY distanceChanged)

public:
    explicit MouseData(QObject *parent = nullptr);
//    MouseData() = default;
//    MouseData(const MouseData &other) = default;
//    ~MouseData() = default;
//    MouseData &operator=(const MouseData &) = default;

//    QJsonObject toJSON();

    int getLeftButton() const;
    void setLeftButton(int leftButton);
    void incrementLeftButton();

    int getRightButton() const;
    void incrementRightButton();

    int getMiddleButton() const;
    void incrementMiddleButton();

    int getWheelForward() const;
    void incrementWheelForward();

    int getWheelBackward() const;
    void incrementWheelBackward();

    double getDistance() const;
    void incrementDistance(double v);

signals:
    void leftButtonChanged(int);
    void rightButtonChanged(int);
    void middleButtonChanged(int);
    void wheelForwardChanged(int);
    void wheelBackwardChanged(int);

    void distanceChanged(double);

private:
    int leftButton = 0;
    int rightButton = 0;
    int middleButton = 0;
    int wheelForward = 0;
    int wheelBackward = 0;

    double distance = 0;
};

//Q_DECLARE_METATYPE(MouseData);

#endif // MOUSEDATA_H
