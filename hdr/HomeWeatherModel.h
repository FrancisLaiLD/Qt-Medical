#ifndef HOMEWEATHERMODEL_H
#define HOMEWEATHERMODEL_H

#include <QObject>

class HomeWeatherModel : public QObject
{
    Q_OBJECT
public:
    explicit HomeWeatherModel(QObject *parent = nullptr);

signals:

public slots:
};

#endif // HOMEWEATHERMODEL_H