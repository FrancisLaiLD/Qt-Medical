#ifndef HOMELISTDEVICEMODEL_H
#define HOMELISTDEVICEMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include "../Component/DeviceComponent.h"
#include <QDebug>
#include "../Common/DeviceDef.h"

class HomeListDeviceModel : public QAbstractListModel
{
    Q_OBJECT
    enum DeviceNameRoles {
        DEVICE_NAME = Qt::UserRole + 1,
        DEVICE_STATE,
        DEVICE_LASTCONN,
        DEVICE_SHOW_IN_MAIN,
        DEVICE_MANUFACTURER
    };

public:
    HomeListDeviceModel();
    virtual ~HomeListDeviceModel() override {}

    // pure virtuals implementations
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QHash<int, QByteArray> roleNames() const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;

    void addDevice(const DeviceComponent& m_device);
    void remDevice(const int& _index);

    QVector<DeviceComponent> listDevice() const;
    void setListDevice(const QVector<DeviceComponent> &listDevice);

    void initListDevice();
    bool askItemConnected(const int& _index);
    bool askItemShowInMain(const int& _index);

private:
    QVector<DeviceComponent> m_listDevice;

};


#endif // HOMELISTDEVICEMODEL_H
