#ifndef HOMEWEATHERMODEL_H
#define HOMEWEATHERMODEL_H

#include <QObject>
#include <QDateTime>

class HomeWeatherModel : public QObject
{
    Q_OBJECT
public:
    explicit HomeWeatherModel(QObject *parent = nullptr);
    Q_PROPERTY(QDateTime timeUpdate READ timeUpdate WRITE setTimeUpdate NOTIFY timeUpdateChanged)

    QDateTime timeUpdate() const;
    void setTimeUpdate(const QDateTime &timeUpdate);

private:
    QDateTime m_timeUpdate;

signals:
    void timeUpdateChanged();

public slots:
};

#endif // HOMEWEATHERMODEL_H
