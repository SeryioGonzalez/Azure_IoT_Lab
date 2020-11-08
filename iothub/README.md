# Creating an IoT Hub
In this module we will create an Azure IoT Hub and configure a device.

The outcome of this module is creating the central Azure IoT Hub element in the intended architecture below
![Snapshot](../images/Lab-1.png "Azure IoT Hub Service")


## Look for the Azure IoT Hub icon in the search area of the Azure portal
![Snapshot](../images/iot-hub-1.PNG "Azure IoT Hub Service")

## Create an Azure IoT Hub instance

#### Parameterize Azure IoT Hub instance parameters
Select your subscription.<br/> 
Create a resource group, for this project, name "icai-iot-lab". <br/>
Select region "West Europe". <br/>
Assign an Azure IoT Hub instance name "icaiiotlabgroupX", where X is your group number. <br/>
Click in "Size and scale" in order to set the proper service tier.<br/>
![Snapshot](../images/iot-hub-0.PNG "Azure IoT Hub Service")

#### In the following diagram, remember to select "Free tier", which allows for 8000 free messages per day
![Snapshot](../images/iot-hub-2.PNG "Azure IoT Hub Service")

#### Select "review + create". Upon successful validation, click "Create" and wait for a few minutes for the creation process to complete
![Snapshot](../images/iot-hub-3.PNG "Azure IoT Hub Service")

#### Once the creation process has completed, the following window will show up
![Snapshot](../images/iot-hub-4.PNG "Azure IoT Hub Service")

#### Press "Go to Resource" in the previous image and a window like the following will show up

![Snapshot](../images/iot-hub-5.PNG "Azure IoT Hub Service")

#### At this state, the Azure IoT Hub module is created and ready to work. Next is to provision a device

## Create a device identity in Azure IoT hub
Click in "IoT Devices" in the icon highlighted in red in the previous diagram. A window like the one below will show up. Click in "New", as highlighted in red in the image below.

![Snapshot](../images/iot-hub-8.PNG "Azure IoT Hub Service")

In the "Device ID" field, enter a name for your device. Select the default options highlighted, such as "Symmetric key" and "Auto-generate keys" 

![Snapshot](../images/iot-hub-6.PNG "Azure IoT Hub Service")

Once created, click on the device just provisioned in order to get the device details, as highlighted in red below
![Snapshot](../images/iot-hub-9.png "Azure IoT Hub Service")

Select the primary connection string and store this information for following modules. You can obtain this information by clicking in the icon highlighted in red in the following figure.
The connection string should be something like
```
HostName=icaiiotlabgroup1.azure-devices.net;DeviceId=simulatedDevice;SharedAccessKey=7VA3mGEaP8U8JiH899kFGJit1234567890223312
```
![Snapshot](../images/iot-hub-7.PNG "Azure IoT Hub Service")

After this point, your Azure IoT Hub instance is up and running and the device identity is created. Go to the next module for continuing the lab.
[Go back to the main section](../README.md )
