#ifndef APPLISTCOMMAND_H
#define APPLISTCOMMAND_H

#include <QObject>
#include <QAbstractListModel>
#include <QDebug>
#include "../Common/CommandDef.h"

class CommandComponent {

public:
    explicit CommandComponent(QString c_commandName, QString c_commandQML, bool c_avaiable, bool c_showInMain) :
        m_commandName(c_commandName),
        m_commandQML(c_commandQML),
        m_avaiable(c_avaiable),
        m_showInMain(c_showInMain)
        {}
    CommandComponent() {}
    ~CommandComponent() {}
    bool avaiable() const;
    void setAvaiable(bool avaiable);

    bool showInMain() const;
    void setShowInMain(bool showInMain);

    QString commandName() const;
    void setCommandName(const QString &commandName);

    QString commandQML() const;
    void setCommandQML(const QString &commandQML);

private:
    QString m_commandName;
    QString m_commandQML;
    bool m_avaiable;
    bool m_showInMain;

};

class AppListCommand : public QAbstractListModel
{
    Q_OBJECT
    enum CommandRoles {
        COMMAND_NAME,
        COMMAND_QML,
        COMMAND_AVAIABLE,
        COMMAND_SHOWINMAIN
    };

public:
    AppListCommand();
    virtual ~AppListCommand() override {}

    // pure virtuals implementations
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QHash<int, QByteArray> roleNames() const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;

    void addCommand(const CommandComponent& m_command);
    void remCommand(const int& _index);

    void initListCommand();
    bool askCommandAvaiable(const int& _index);
    bool askCommandShowInMain(const int& _index);

    QVector<CommandComponent> listCommand() const;
    void setListCommand(const QVector<CommandComponent> &listCommand);

private:
    QVector<CommandComponent> m_listCommand;
};

#endif // APPLISTCOMMAND_H
