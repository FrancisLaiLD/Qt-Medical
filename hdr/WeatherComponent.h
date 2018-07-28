#ifndef WEATHERCOMPONENT_H
#define WEATHERCOMPONENT_H

#include <QObject>

class WeatherComponent : public QObject
{
    Q_OBJECT
public:
    explicit WeatherComponent(QObject *parent = nullptr);

signals:

public slots:
};

#endif // WEATHERCOMPONENT_H