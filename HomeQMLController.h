#ifndef HOMEQMLCONTROLLER_H
#define HOMEQMLCONTROLLER_H

#include <QObject>

class HomeQMLController : public QObject
{
    Q_OBJECT
public:
    explicit HomeQMLController(QObject *parent = nullptr);

signals:

public slots:
};

#endif // HOMEQMLCONTROLLER_H