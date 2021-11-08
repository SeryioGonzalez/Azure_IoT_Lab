# React to Critical Device Lifecycle Events and Trigger Actions

![Header Image](../images/notification_eventgrid.jpg)

Azure IoT Hub integrates with Azure Event Grid so that you can send event notifications to other services and trigger downstream processes. Configure your business applications to listen for IoT Hub events so that you can react to critical events in a reliable, scalable, and secure manner. For example, build an application to perform multiple actions like updating a database, creating a ticket, and delivering an email notification every time a new IoT device is registered to your IoT hub.

In this lab you will learn how to create logic app to be able to send Twitter tweets

## Create Logic App from Azure IoT Hub

Navigate to your Azure IoT hub and select the option **Events** and click in **Logic Apps** as shown in the image below.

![Create Resource](../images/logic-apps-01.png)

## Create a workflow within the Logic App
Once the Logic App instance has been created, you need to sign in to Azure Event Grid and complete the form as shown in the following image, adding **Twitter** as the next step, by pressing the **Continue** button

![Create Resource](../images/logic-apps-02.png)

You need to Sign-in your Twitter account

![Create Resource](../images/logic-apps-03.png)

Once there, introduce what text you want to tweet, as shown below:

![Create Resource](../images/logic-apps-04.png)

Go create a device in IoT Hub, in this example, I created a device called **TWEET** and the result is as follows:

![Create Resource](../images/logic-apps-05.png)
