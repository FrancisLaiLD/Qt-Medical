#ifndef RESOURCEMANAGER_H
#define RESOURCEMANAGER_H

#define STATUSBAR_PATH      "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/icons/Statusbar/"
#define MEDICAL_PATH        "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/icons/medical/"
#define GENERAL_PATH        "/home/moonlight/Qt-Project/LearnMedical-1/Qt-Medical/resource/icons/general/"
#include <QObject>

#include "Resource_Statusbar.h"
#include "Resource_General.h"

class ResourceManager : public QObject
{
    Q_OBJECT
public:

    explicit ResourceManager(QObject *parent = nullptr)
{
    Q_UNUSED(parent);
}

private:

signals:

public slots:
};


#endif // RESOURCEMANAGER_H

