#include "mouseanalyzer.h"

MouseAnalyzer::MouseAnalyzer(QObject *parent) : QObject(parent), overallData(new MouseData(this))
{
    QObject::connect(MouseHook::getInstance(), &MouseHook::mouseStateChanged,
                     this, &MouseAnalyzer::analyzeMouse);
    //    overallData = new MouseData(this);
}

MouseAnalyzer::MouseAnalyzer(QObject *parent, QList<QScreen *> screens) : QObject(parent), overallData(new MouseData(this))
{
    this->screens = screens;

    QObject::connect(MouseHook::getInstance(), &MouseHook::mouseStateChanged,
                     this, &MouseAnalyzer::analyzeMouse);
}

QPoint MouseAnalyzer::getPosition() const
{
    return this->position;
}

MouseData* MouseAnalyzer::getOverallData() const
{
    return this->overallData;
}

void MouseAnalyzer::analyzeMouse(int state, QPoint point)
{
    if(state == WM_MOUSEMOVE) {
        if(this->lastPosition.isNull()) {
            this->lastPosition = point;
        }
        this->position = point;
        emit positionChanged(position);

        this->overallData->incrementDistance(
                    sqrt(pow(position.x()-lastPosition.x(), 2) + pow(position.y()-lastPosition.y(), 2))
                    * INCH_TO_CENTIMETER
                    / getPhysicalDotsPerInch(point)
                    );
        this->lastPosition = point;
    }
    else if(state == WM_LBUTTONDOWN) {
        this->overallData->incrementLeftButton();
    } else if(state == WM_RBUTTONDOWN) {
        this->overallData->incrementRightButton();
    } else if(state == WM_MBUTTONDOWN) {
        this->overallData->incrementMiddleButton();
    } else if(state == WM_MOUSEWHEEL) {
        this->overallData->incrementWheelForward();
    }
//    qDebug() << "Analyze " << state << point;
}

qreal MouseAnalyzer::getPhysicalDotsPerInch(QPoint position)
{
    for(int i=0; i<screens.length(); i++) {
        if(screens.at(i)->geometry().contains(position)) {
            return screens.at(i)->physicalDotsPerInch();
        }
    }
    return screens.at(0)->physicalDotsPerInch();
}

//void MouseAnalyzer::setOverallData(MouseData *md)
//{
//    if (this->overallData == md)
//        return;

//    this->overallData = md;
//    emit overallDataChanged(this->overallData);
//}
