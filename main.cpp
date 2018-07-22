#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "AppManager.h"
#include "HomeScreenModel.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    AppManager* p_AppManager = new AppManager();
    HomeScreenModel* p_HomeScreenModel = new HomeScreenModel();
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
//    engine.rootContext()->setContextProperty("HomeModel", p_HomeScreenModel);
    engine.rootContext()->setContextProperty("AppManager", p_AppManager);
    engine.load("/home/moonlight/Qt-Project/LearnMedical-1/qml/main.qml");
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
