# Creating an Azure Blob Storage
In previous modules, we have set-up a simulated client sending traffic to an [Azure IoT Hub](https://docs.microsoft.com/en-us/azure/iot-hub/) (AzIoTH) instance. At this point, AzIoTH is not doing anything with that data, which obviously is not very useful.
Azure IoT Hub, apart from supporting device security and management, is a message broker capable of sending those IoT device messages to other services for consuming them.
In this lab, we will store those messages to an [Azure Blob Storage](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blobs-overview). Blob storage is a highly scalable cloud storage service, allowing massive data ingest at very low price 

## Create an Storage Account in the Azure portal

Look for **Storage Account** in the Azure Portal. Click "Add" in order to create your Storage Account. Use the resource group previously used and name the storage account **icaiiotgroupX**, where X is your group ID. Select **LRS** as Replication option. 
![Snapshot](../images/storage-3.PNG "Azure Storage")

Once you click **Review + create**, a window similar to the one that follows will show up.
If the Validated message in green is displayed, press **Create**

![Snapshot](../images/storage-4.PNG "Azure Storage")
