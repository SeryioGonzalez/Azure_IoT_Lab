# Create resources for last cloud lab day

## Deploy the template
Use the following link for launching all resources. <br/>

This is a template that deploys:
- Ubuntu VM as a sensor with required snippets
- A storage account 
- An IoT Hub with routing information to the storage account

[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FSeryioGonzalez%2FAzure_IoT_Lab%2Fmaster%2Ffinalday%2Fazuredeploy.json)  

In the image, you can see important information:
- The **Resource Group** (In black), the resource group to be used. For consistency, use **icaiiotlab**. If not created, please create it
- The **Region** (In red), select **West Europe**
- **Group Number** is your group to be used
- **Admin User Password** is the password of the simulated device. **DO NOT FORGET IT!!!**

![Lab deployment](../images/deployment-2.png "Deploy lab")

Upon success after a few minutes, the following image will show-up: 

![Lab deployment](../images/deployment-3.png "Deploy lab")

## Create an IoT hub device identity

In the previous image, click in **Go to resource group** and select the **IoT Hub** instance created.<br/>
In the left pane, select the option **Devices**, as highlighted in red in the following image and click in **Add Device**, as shown in blue:


![Lab deployment](../images/deployment-4.png "Deploy lab")
