#ifndef HOMECOMPONENT_H
#define HOMECOMPONENT_H

#include <QObject>

class HomeComponent : public QObject
{
    Q_OBJECT
public:
    explicit HomeComponent(QString oLabel, QString oImageLink);

    ~HomeComponent();

    Q_PROPERTY(QString label READ label WRITE setLabel NOTIFY labelChanged)
    Q_PROPERTY(QString imageLink READ imageLink WRITE setImageLink NOTIFY imageLinkChanged)

    QString label() const;
    void setLabel(const QString& _data);

    QString imageLink() const;
    void setImageLink(const QString& _data);

private:
    QString m_label;
    QString m_imageLink;

signals:
    void labelChanged();
    void imageLinkChanged();

public slots:
};

#endif // HOMECOMPONENT_H
