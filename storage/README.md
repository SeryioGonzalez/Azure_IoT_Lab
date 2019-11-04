# Creating an Azure Blob Storage
In previous modules, we have set-up a simulated client sending traffic to an [Azure IoT Hub](https://docs.microsoft.com/en-us/azure/iot-hub/) (AzIoTH) instance. At this point, AzIoTH is not doing anything with that data, which obviously is not very useful.
Azure IoT Hub, apart from supporting device security and management, is a message broker capable of sending those IoT device messages to other services for consuming them.
In this lab, we will store those messages to an Azure Blob Storage. 

## Look for the Azure IoT lab icon in the search area of the Azure portal
![Snapshot](../images/iot-hub-1.PNG "Azure IoT Hub Service")

## Create an Azure IoT Hub instance
