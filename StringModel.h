#ifndef ESTRINGMODEL_H
#define ESTRINGMODEL_H

#include <QObject>

class EStringModel : public QObject
{
    Q_OBJECT
public:
    explicit EStringModel(QObject *parent = nullptr);

    QString STR_HOME_MENU_HEART()               {return tr("Heart");}
    QString STR_HOME_MENU_TEMP()                {return tr("Temperature");}
    QString STR_HOME_MENU_NURSE()               {return tr("Nurse");}
    QString STR_HOME_MENU_HOSPITAL()            {return tr("Hospital");}
    QString STR_HOME_MENU_SETTING()             {return tr("Setting");}
signals:

public slots:
};

#endif // ESTRINGMODEL_H
