#ifndef MOUSEANALYZER_H
#define MOUSEANALYZER_H

#include <QObject>
#include <QScreen>
#include "mousedata.h"
#include "mousehook.h"

#define INCH_TO_CENTIMETER 2.54

class MouseAnalyzer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QPoint position READ getPosition NOTIFY positionChanged)
    Q_PROPERTY(MouseData* overallData READ getOverallData NOTIFY overallDataChanged)

public:
    explicit MouseAnalyzer(QObject *parent = nullptr);
    MouseAnalyzer(QObject *parent, QList<QScreen*> screens);

    QPoint getPosition() const;
    MouseData* getOverallData() const;

public slots:
    void analyzeMouse(int state, QPoint point);
    qreal getPhysicalDotsPerInch(QPoint position);

private:
    QList<QScreen*> screens;
    QPoint lastPosition;
    QPoint position;
    MouseData* overallData;
    MouseData* currentData;

signals:
    void positionChanged(QPoint);
    void overallDataChanged(MouseData*);
};

#endif // MOUSEANALYZER_H
