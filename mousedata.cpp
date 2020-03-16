#include "mousedata.h"

MouseData::MouseData(QObject *parent) : QObject(parent)
{

}

int MouseData::getLeftButton() const
{
    return this->leftButton;
}

void MouseData::setLeftButton(int leftButton)
{
    if (this->leftButton == leftButton)
        return;

    this->leftButton = leftButton;
    emit leftButtonChanged(this->leftButton);
}

void MouseData::incrementLeftButton()
{
    ++leftButton;
    emit leftButtonChanged(this->leftButton);
}

int MouseData::getRightButton() const
{
    return this->rightButton;
}

void MouseData::incrementRightButton()
{
    ++rightButton;
    emit rightButtonChanged(this->rightButton);
}

int MouseData::getMiddleButton() const
{
    return this->middleButton;
}

void MouseData::incrementMiddleButton()
{
    ++middleButton;
    emit middleButtonChanged(this->middleButton);
}

int MouseData::getWheelForward() const
{
    return this->wheelForward;
}

void MouseData::incrementWheelForward()
{
    ++wheelForward;
    emit wheelForwardChanged(wheelForward);
}

int MouseData::getWheelBackward() const
{
    return this->wheelBackward;
}

void MouseData::incrementWheelBackward()
{
    ++wheelBackward;
    emit wheelBackwardChanged(wheelBackward);
}

double MouseData::getDistance() const
{
    return distance;
}

void MouseData::incrementDistance(double v)
{
    distance += v;
    emit distanceChanged(distance);
}
