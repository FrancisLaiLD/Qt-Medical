#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "AppManager.h"



int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    AppManager* p_AppManager = new AppManager(nullptr, &engine);
    p_AppManager->initApplication();

    return app.exec();
}
