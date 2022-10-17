param prefix string
param location string

resource iotHub 'Microsoft.Devices/IotHubs@2021-07-02' = {
  name: '${prefix}hub'
  location: location
  sku: {
    capacity: 1
    name: 'S1'
  }
}

output iotHubName string = iotHub.name
