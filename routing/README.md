# Routing messages from Azure IoT Hub to an storage account
Azure IoT hub is intended to route messages, based on different conditions to different destionations. This capability is called message brokering. The following image shows this concept.
![Snapshot](../images/message-enrichments-flow.png "Azure VM")

In this lab, we will store data in the previously created storage account, which is intended for storing massive ammount of data from millions of devices.
The outcome if this module is competing the end to end architecture presented.
![Snapshot](../images/Lab.png "Azure VM")

## Creating a Custom Endpoint of type Storage under Azure IoT Hub routes

First we need to declare the previously created storage endpoint. Select **Message routing** (red), **Custom endpoints** (blue). Click **Add** (green) and select **Storage**, as shown in the diagram below
![Snapshot](../images/routing-1.png "Azure VM")
