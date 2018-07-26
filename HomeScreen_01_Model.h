#ifndef HOMESCREEN_01_MODEL_H
#define HOMESCREEN_01_MODEL_H

#include <QObject>

class HomeScreen_01_Model : public QObject
{
    Q_OBJECT
public:
    explicit HomeScreen_01_Model(QObject *parent = nullptr);
    ~HomeScreen_01_Model();
    Q_PROPERTY(int circleSize READ circleSize WRITE setCircleSize NOTIFY circleSizeChanged)

public:
    int circleSize() const;
    void setCircleSize(const int &_size);

private:
    int m_circleSize;

signals:
    void circleSizeChanged();

public slots:
};

#endif // HOMESCREEN_01_MODEL_H
