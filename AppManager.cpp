#include "AppManager.h"

AppManager::AppManager(QObject *parent) : QObject(parent)
{

}

bool AppManager::handleHomeClick(const int &_index)
{
    qDebug() << "Handle of click to index: " << _index;
    std::cout << "cout handle :" << _index;
    return true;
}
