#include "AppListCommand.h"

bool CommandComponent::avaiable() const
{
    return m_avaiable;
}

void CommandComponent::setAvaiable(bool avaiable)
{
    m_avaiable = avaiable;
}

bool CommandComponent::showInMain() const
{
    return m_showInMain;
}

void CommandComponent::setShowInMain(bool showInMain)
{
    m_showInMain = showInMain;
}

QString CommandComponent::commandName() const
{
    return m_commandName;
}

void CommandComponent::setCommandName(const QString &commandName)
{
    if (m_commandName != commandName)
        m_commandName = commandName;
}

QString CommandComponent::commandQML() const
{
    return m_commandQML;
}

void CommandComponent::setCommandQML(const QString &commandQML)
{
    if (m_commandQML != commandQML)
        m_commandQML = commandQML;
}
// Define App List Command
AppListCommand::AppListCommand()
{
    initListCommand();
}

QVariant AppListCommand::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_listCommand.size())
    {
        qDebug() << "HungLD";
        return QVariant();
    }
    CommandComponent m_command = m_listCommand[index.row()];
    if (role == CommandRoles::COMMAND_NAME)
    {
        return m_command.commandName();
    }
    else if (role == CommandRoles::COMMAND_QML)
    {
        return  m_command.commandQML();
    }
    else if (role == CommandRoles::COMMAND_AVAIABLE)
    {
        return m_command.avaiable();
    }
    else if (role == CommandRoles::COMMAND_SHOWINMAIN)
    {
        return m_command.showInMain();
    }

    return QVariant();
}

int AppListCommand::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_listCommand.size();
}

QHash<int, QByteArray> AppListCommand::roleNames() const
{
    QHash<int, QByteArray> m_role;
    m_role[CommandRoles::COMMAND_NAME] = "commandName";
    m_role[CommandRoles::COMMAND_QML]  = "commandQML";
    m_role[CommandRoles::COMMAND_AVAIABLE] = "commandAvaiable";
    m_role[CommandRoles::COMMAND_SHOWINMAIN] = "commandShowInMain";
    return m_role;
}

bool AppListCommand::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (index.row() < 0 || index.row() >= m_listCommand.size())
        return false;
    CommandComponent &m_command = m_listCommand[index.row()];

    switch (role) {
    case CommandRoles::COMMAND_SHOWINMAIN: {
        m_command.setShowInMain(value.toBool());
        break;
        }
    default:
        break;
    }
    emit dataChanged(index, index);
    return true;
}

void AppListCommand::addCommand(const CommandComponent &m_command)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_listCommand.push_back(m_command);
    endInsertRows();
}

void AppListCommand::remCommand(const int &_index)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_listCommand.removeAt(_index);
    endInsertRows();
}

void AppListCommand::initListCommand()
{
    int m_size = CONST_TABLE_COMMAND.size();
    for (int i= 0; i< m_size; i++)
    {
        addCommand(CommandComponent( CONST_TABLE_COMMAND[i].s_commandName,
                                     CONST_TABLE_COMMAND[i].s_commandQML,
                                     askCommandAvaiable(i),
                                     askCommandShowInMain(i)));
    }
}

bool AppListCommand::askCommandAvaiable(const int &_index)
{
    return true;
}

bool AppListCommand::askCommandShowInMain(const int &_index)
{
    return true;
}

QVector<CommandComponent> AppListCommand::listCommand() const
{
    return m_listCommand;
}

void AppListCommand::setListCommand(const QVector<CommandComponent> &listCommand)
{
    m_listCommand = listCommand;
}
