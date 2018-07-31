#ifndef RESOURCE_GENERAL_H
#define RESOURCE_GENERAL_H

#include    <QObject>

class Resource_General : public QObject
{
    Q_OBJECT
public:

    Resource_General(QObject *parent = nullptr, QString cPrefix = "")
    {
        Q_UNUSED(parent);
        m_prefix = cPrefix;
    }
    virtual ~Resource_General() {}
    // define Q_PROPERTY
    Q_PROPERTY(QString ico_boy_1                    READ ico_boy_1                      CONSTANT)
    Q_PROPERTY(QString ico_boy_2                    READ ico_boy_2                      CONSTANT)
    Q_PROPERTY(QString ico_father_1                 READ ico_father_1                   CONSTANT)
    Q_PROPERTY(QString ico_father_2                 READ ico_father_2                   CONSTANT)
    Q_PROPERTY(QString ico_girl_1                   READ ico_girl_1                     CONSTANT)
    Q_PROPERTY(QString ico_grandfather_1            READ ico_grandfather_1              CONSTANT)
    Q_PROPERTY(QString ico_grandmother_1            READ ico_grandmother_1              CONSTANT)
    Q_PROPERTY(QString ico_kidboy_1                 READ ico_kidboy_1                   CONSTANT)
    Q_PROPERTY(QString ico_kidgirl_1                READ ico_kidgirl_1                  CONSTANT)
    Q_PROPERTY(QString ico_mother_1                 READ ico_mother_1                   CONSTANT)
    Q_PROPERTY(QString ico_mother_2                 READ ico_mother_2                   CONSTANT)
    Q_PROPERTY(QString rad_btn_check                READ rad_btn_check                  CONSTANT)
    Q_PROPERTY(QString rad_btn_uncheck              READ rad_btn_uncheck                CONSTANT)

    //define QString return function
    QString ico_boy_1()                 {return m_prefix + "ico_boy_1.png";}
    QString ico_boy_2()                 {return m_prefix + "ico_boy_2.png";}
    QString ico_father_1()              {return m_prefix + "ico_father_1.png";}
    QString ico_father_2()              {return m_prefix + "ico_father_2.png";}
    QString ico_girl_1()                {return m_prefix + "ico_girl_1.png";}
    QString ico_grandfather_1()         {return m_prefix + "ico_grandfather_1.png";}
    QString ico_grandmother_1()         {return m_prefix + "ico_grandmother_1.png";}
    QString ico_kidboy_1()              {return m_prefix + "ico_kidboy_1.png";}
    QString ico_kidgirl_1()             {return m_prefix + "ico_kidgirl_1.png";}
    QString ico_mother_1()              {return m_prefix + "ico_mother_1.png";}
    QString ico_mother_2()              {return m_prefix + "ico_mother_2.png";}
    QString rad_btn_check()             {return m_prefix + "rad-btn-check.png";}
    QString rad_btn_uncheck()           {return m_prefix + "rad-btn-uncheck.png";}


private:
    QString m_prefix;
};

#endif // RESOURCE_GENERAL_H
