#include "MeasureController.h"

MeasureController::MeasureController(QObject *parent) : QObject(parent)
{
    m_isMeasuring           = false;
    m_isHasMeasureResult    = false;
    m_isSavedData           = false;
    m_finalMeasureVal       = QVariant();
}
QVariant MeasureController::finalMeasureVal() const
{
    return m_finalMeasureVal;
}

void MeasureController::setFinalMeasureVal(const QVariant &finalMeasureVal)
{
    m_finalMeasureVal = finalMeasureVal;
}

bool MeasureController::isSavedData() const
{
    return m_isSavedData;
}

void MeasureController::setIsSavedData(bool isSavedData)
{
    if (m_isSavedData != isSavedData)
    {
        m_isSavedData = isSavedData;
        emit isSavedDataChanged();
    }
}

bool MeasureController::isHasMeasureResult() const
{
    return m_isHasMeasureResult;
}

void MeasureController::setIsHasMeasureResult(bool isHasMeasureResult)
{
    if (m_isHasMeasureResult != isHasMeasureResult)
    {
        m_isHasMeasureResult = isHasMeasureResult;
        emit isHasMeasureResultChanged();
    }
    if (isHasMeasureResult == true)
        setIsSavedData(false);
}

bool MeasureController::isMeasuring() const
{
    return m_isMeasuring;
}

void MeasureController::setisMeasuring(bool isMeasuring)
{
    if (m_isMeasuring != isMeasuring)
    {
        m_isMeasuring = isMeasuring;
        emit isMeasuringChanged();
    }
}
