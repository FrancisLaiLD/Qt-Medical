#ifndef MeasureController_H
#define MeasureController_H

#include <QObject>
#include <QVariant>


class MeasureController : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool isMeasuring             READ isMeasuring            WRITE setisMeasuring            NOTIFY isMeasuringChanged)
    Q_PROPERTY(bool isHasMeasureResult      READ isHasMeasureResult     WRITE setIsHasMeasureResult     NOTIFY isHasMeasureResultChanged)
    Q_PROPERTY(QVariant finalMeasureVal     READ finalMeasureVal        WRITE setFinalMeasureVal        NOTIFY finalMeasureValChanged)
    Q_PROPERTY(bool isSavedData             READ isSavedData            WRITE setIsSavedData            NOTIFY isSavedDataChanged)

public:
    explicit MeasureController(QObject *parent = nullptr);

    bool isMeasuring() const;
    void setisMeasuring(bool isMeasuring);

    bool isHasMeasureResult() const;
    void setIsHasMeasureResult(bool isHasMeasureResult);

    bool isSavedData() const;
    void setIsSavedData(bool isSaveData);

    QVariant finalMeasureVal() const;
    void setFinalMeasureVal(const QVariant &finalMeasureVal);

signals:
    void isMeasuringChanged();
    void isHasMeasureResultChanged();
    void isSavedDataChanged();
    void finalMeasureValChanged();

public slots:

private:
    bool        m_isMeasuring;
    bool        m_isHasMeasureResult;
    bool        m_isSavedData;
    QVariant    m_finalMeasureVal;
};

#endif // MeasureController_H
