#Environment
subscription="87984371-c3e0-4cfb-b9ce-b167b780b2ed"

environmentName="iot-icai-lab"
region="westeurope"

#Resource Groups
clientResourceGroup=$environmentName"-client-rg"
IoThubResourceGroup=$environmentName"-iot-hub-rg"

#IoT Hub
IoTHubName=$environmentName"-iot-hub"
messageStorageAccountName=$(echo $subscription | cut -c1-8)"messages"
messageStorageContainerName="messagedata"
messageIoTHubRoutingEndpoint="messageStorageEndpoint"
messageIoTHubRouteName="messageStorageRoute"

#IoT device
deviceId="sensor"