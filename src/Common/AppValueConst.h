#ifndef AppValueConst_H
#define AppValueConst_H

#include <QObject>

class AppValueConst : public QObject
{
    Q_OBJECT

public:

    explicit AppValueConst(QObject* parent = nullptr)
    {
        Q_UNUSED(parent);
    }
    // Constant time
    Q_PROPERTY(int time_screen_trans            READ time_screen_trans      CONSTANT)
    Q_PROPERTY(int time_screen_show_popup       READ time_screen_show_popup CONSTANT)
    // Constant Color
    Q_PROPERTY(int title_screen_size            READ title_screen_size      CONSTANT)
    Q_PROPERTY(QString title_screen_color       READ title_screen_color     CONSTANT)
    Q_PROPERTY(int title_popup_size             READ title_popup_size       CONSTANT)
    Q_PROPERTY(QString title_popup_color        READ title_popup_color      CONSTANT)
    Q_PROPERTY(QString text_screen_color        READ text_screen_color      CONSTANT)
    Q_PROPERTY(QString value_screen_color       READ value_screen_color     CONSTANT)
    Q_PROPERTY(QString text_popup_color         READ text_popup_color       CONSTANT)
    Q_PROPERTY(QString value_popup_color        READ value_popup_color      CONSTANT)
    Q_PROPERTY(QString text_label_color         READ text_label_color       CONSTANT)
    Q_PROPERTY(QString line_normal_color        READ line_normal_color      CONSTANT)
    Q_PROPERTY(QString text_click_color         READ text_click_color       CONSTANT)
    Q_PROPERTY(QString text_enter_color         READ text_enter_color       CONSTANT)
    Q_PROPERTY(QString item_select_color        READ item_select_color      CONSTANT)

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
    QString text_label_color()              {return "#404040";}
    QString line_normal_color()             {return "gray";}
    QString text_click_color()              {return "#AA00FF";}
    QString text_enter_color()              {return "#E1A6FF";}
    QString item_select_color()             {return "#9CE8FF";}

};

#endif // AppValueConst_H
