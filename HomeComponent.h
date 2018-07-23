#ifndef HOMECOMPONENT_H
#define HOMECOMPONENT_H

#include <QObject>

class HomeComponent : public QObject
{

    Q_OBJECT

public:
    explicit HomeComponent(bool c_proVisible, bool c_proEnable, QString c_proLabel, QString c_proImgLink);
    ~HomeComponent();

    Q_PROPERTY(bool proVisible          READ proVisible             WRITE setProVisible             NOTIFY proVisibleChanged)
    Q_PROPERTY(bool proEnable           READ proEnable              WRITE setProEnable              NOTIFY proEnableChanged)
    Q_PROPERTY(QString proLabel         READ proLabel               WRITE setProLabel               NOTIFY proLabelChanged)
    Q_PROPERTY(QString proImgLink       READ proImgLink             WRITE setProImgLink             NOTIFY proImgLinkChanged)

    bool proVisible() const;
    void setProVisible(bool proVisible);

    bool proEnable() const;
    void setProEnable(bool proEnable);

    QString proLabel() const;
    void setProLabel(const QString &proLabel);

    QString proImgLink() const;
    void setProImgLink(const QString &proImgLink);

private:
    bool m_proVisible;
    bool m_proEnable;
    QString m_proLabel;
    QString m_proImgLink;

signals:
    void proVisibleChanged();
    void proEnableChanged();
    void proLabelChanged();
    void proImgLinkChanged();

public slots:
};

#endif // HOMECOMPONENT_H
