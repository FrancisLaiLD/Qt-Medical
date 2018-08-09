#ifndef HOMELISTDEVICEMODEL_H
#define HOMELISTDEVICEMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include "../Component/DeviceComponent.h"
#include <QDebug>

class HomeListDeviceModel : public QAbstractListModel
{
    Q_OBJECT
    enum DeviceNameRoles {
        DEVICE_NAME = Qt::UserRole + 1,
        DEVICE_STATE,
        DEVICE_LASTCONN
    };

public:
    HomeListDeviceModel();
    virtual ~HomeListDeviceModel() override {}

    // pure virtuals implementations
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QHash<int, QByteArray> roleNames() const override;

    void addDevice(const DeviceComponent& m_device);
    void remDevice(const int& _index);

    QVector<DeviceComponent> listDevice() const;
    void setListDevice(const QVector<DeviceComponent> &listDevice);

    void initListDevice();

private:
    QVector<DeviceComponent> m_listDevice;

};


#endif // HOMELISTDEVICEMODEL_H
