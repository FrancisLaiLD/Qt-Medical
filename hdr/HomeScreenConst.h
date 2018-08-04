#ifndef HOMESCREENCONST_H
#define HOMESCREENCONST_H

#include <QObject>

class HomeScreenConst : public QObject
{
    Q_OBJECT

public:

    explicit HomeScreenConst(QObject* parent = nullptr)
    {
        Q_UNUSED(parent);
    }
    // Constant time
    Q_PROPERTY(int time_screen_trans            READ time_screen_trans      CONSTANT)
    Q_PROPERTY(int time_screen_show_popup       READ time_screen_show_popup      CONSTANT)
    // Constant Color
    Q_PROPERTY(int title_screen_size            READ title_screen_size      CONSTANT)
    Q_PROPERTY(QString title_screen_color       READ title_screen_color     CONSTANT)
    Q_PROPERTY(int title_popup_size             READ title_popup_size       CONSTANT)
    Q_PROPERTY(QString title_popup_color        READ title_popup_color      CONSTANT)
    Q_PROPERTY(QString text_screen_color        READ text_screen_color      CONSTANT)
    Q_PROPERTY(QString value_screen_color       READ value_screen_color     CONSTANT)
    Q_PROPERTY(QString text_popup_color         READ text_popup_color       CONSTANT)
    Q_PROPERTY(QString value_popup_color        READ value_popup_color      CONSTANT)

    //define function return time
    int time_screen_trans()         {return 500;}
    int time_screen_show_popup()    {return 350;}

    // define function return const
    int title_screen_size()         { return 28;}
    int title_popup_size()          { return 24;}

    QString title_screen_color()            {return "#000000";}
    QString title_popup_color()             {return "#000000";}
    QString text_screen_color()             {return "#000000";}
    QString value_screen_color()            {return "#000000";}
    QString text_popup_color()              {return "#000000";}
    QString value_popup_color()             {return "#004466";}
};

#endif // HOMESCREENCONST_H
