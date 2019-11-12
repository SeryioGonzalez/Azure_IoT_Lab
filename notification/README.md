# React to Critical Device Lifecycle Events and Trigger Actions

![Header Image](../images/notification_eventgrid.jpg)

Azure IoT Hub integrates with Azure Event Grid so that you can send event notifications to other services and trigger downstream processes. Configure your business applications to listen for IoT Hub events so that you can react to critical events in a reliable, scalable, and secure manner. For example, build an application to perform multiple actions like updating a database, creating a ticket, and delivering an email notification every time a new IoT device is registered to your IoT hub.

In this lab you will learn how to

* Create logic app to be able to send email notifications

* Create Event Grid

* Connect IoT Hub to Event Grid

## Create Logic App

Create a Logic App to be able to send email notifications

Select **Logic Apps** from the Azure resource explorer and click **Add**

![Create Resource](../images/email-1.PNG)

Using **Logic App Designer**, Create **Blanck Logic App**

![Create App](../images/notification_03_Logic_App_designer.png)

**Select HTTP Request** under the Request category

![Select HTTP Request](../images/notification_04_Http_Request.png)

Azure Logic Apps is able to build the notification schema if provided with an exemplary JSON structure. 

For this, select **Use sample payload to generate schema** and paste the content in the JSON snippet below.

![Provide Sample Payload](../images/notification_05_Sample_Payload.png)

Copy and paste the following sample JSON.

```code
[{
  "id": "56afc886-767b-d359-d59e-0da7877166b2",
  "topic": "/SUBSCRIPTIONS/<Subscription ID>/RESOURCEGROUPS/<Resource group name>/PROVIDERS/MICROSOFT.DEVICES/IOTHUBS/<IoT hub name>",
  "subject": "devices/LogicAppTestDevice",
  "eventType": "Microsoft.Devices.DeviceCreated",
  "eventTime": "2018-01-02T19:17:44.4383997Z",
  "data": {
    "twin": {
      "deviceId": "LogicAppTestDevice",
      "etag": "AAAAAAAAAAE=",
      "status": "enabled",
      "statusUpdateTime": "0001-01-01T00:00:00",
      "connectionState": "Disconnected",
      "lastActivityTime": "0001-01-01T00:00:00",
      "cloudToDeviceMessageCount": 0,
      "authenticationType": "sas",
      "x509Thumbprint": {
        "primaryThumbprint": null,
        "secondaryThumbprint": null
      },
      "version": 2,
      "properties": {
        "desired": {
          "$metadata": {
            "$lastUpdated": "2018-01-02T19:17:44.4383997Z"
          },
          "$version": 1
        },
        "reported": {
          "$metadata": {
            "$lastUpdated": "2018-01-02T19:17:44.4383997Z"
          },
          "$version": 1
        }
      }
    },
    "hubName": "egtesthub1",
    "deviceId": "LogicAppTestDevice",
    "operationTimestamp": "2018-01-02T19:17:44.4383997Z",
    "opType": "DeviceCreated"
  },
  "dataVersion": "",
  "metadataVersion": "1"
}]
```

## Setup Notification by Sending Email 

**Click on New Step**

![New Step](../images/notification_06_New_Step.png)

**Add an action**

![Add an Action](../images/notification_07_Add_new_Action.png)

Choose **Gmail**
Select the action **Send email**.

![Choose Mail](../images/notification_08_Choose_Mail.png)

Sign in to Gmail

## Create Email template ##
In the **Add new parameter** area, select Subject and Body, as shown below.

![Create Resource](../images/email-5.PNG)

You can compose an email in the following window, using dynamic parameters, obtained from the received IoT event.

![Create Resource](../images/email-6.PNG)

A result equivalent to the following image should be obtained. 

![Provide Sample Payload](../images/email-7.PNG)

## Copy Request URL

![Copy Request URL](../images/notification_12_eventurl.png)

## Integrate With IoTHub

Integrate Logic App with IoTHub via Event Grid

![Imported Script](../images/notification_13_IoTHub_EventHub.png "Integrated with IoTHub")

Click on Event Subscription

![Integrated with IoTHub](../images/notification_14_empty_event_subscription.png "")

Copy the URL from previous steps into Subscriber Endpoint and click create

![Integrated with IoTHub](../images/notification_15_device_events.png)

## Add Device and Test Notification

Go To IoTHub -> IoT Devices (Device Management) -> Add

![Add Device](../images/notification_16_add_device.png)

Click Save button to create a new device

![Add Device](../images/notification_17_add_device.png)

You Should get an email notification

![Email Notification](../images/notification_18_email_generated.png)

## Delete Device and Test Notification

Go To IoTHub -> IoT Devices (Device Management) -> Select Device you created in previous step -> Delete

![Delete Device](../images/notification_19_delete_device.png)

You Should get an email notification

![Email Notification](../images/notification_20_email_generated.png)
