# Visualize Time Series Data with Azure Time Series Insights

![Time Series Insights](../images/visualize_timeseriesinsights.jpg)

Azure Time Series Insights is a fully managed analytics, storage, and visualization service for managing IoT-scale time-series data in the cloud. It provides massively scalable time-series data storage and enables you to explore and analyze billions of events streaming in from all over the world in seconds. Use Time Series Insights to store and manage terabytes of time-series data, explore and visualize billions of events simultaneously, conduct root-cause analysis, and to compare multiple sites and assets.

In this lab you will learn

* how to set up a Time Series Insights environment
* explore
* analyze time series data of your IoT solutions or connected things

## Create Time Series Insights

Select **Time Series Insights** in the resource explorer search box of the Azure portal.
Select your group nickname **icaiiotlabgroupX** as resource name. Place the resource in the lab resource group, so later deletion is easier and select the region to **West Europe**.

![Create Time Series Insights](../images/visualize-20.PNG)

In the next blade, give a sample name **iot-hub** to the IoT Hub integration resource.
Select **Source Type** to **IoT Hub** and **Select existing** in the **Select a hub** option. Select your previously created Azure IoT Hub instance.
Additionally, select **IoT Hub access policy name** to **iothubowner** and **IoT Hub consumer group** to **$Default**.

![Create Time Series Insights](../images/visualize-21.PNG)

**You might not yet see data** in Time Series Insights Explorer, since it connects by default to the built-in endpoint in Azure IoT Hub. Once we added a route in the previous lab for sending the sensor data to an storage, the built-in endpoint gets disabled, as you can read in the following link.

[Routing behaviour with built-in endpoint in Azure IoT Hub](https://docs.microsoft.com/es-es/azure/iot-hub/iot-hub-devguide-messages-d2c#built-in-endpoint)

## Enable a Route in Azure IoT Hub to Events Built-in Endpoint

Navigate to the Azure IoT Hub instance created in previous modules. As you did in [module 4](https://github.com/SeryioGonzalez/azure-iot/blob/master/routing/README.md) of this lab with Azure Storage, we need to enable an extra Route to the built-in **events** endpoint, as shown in the following image.

![Create Time Series Insights](../images/visualize-22.PNG)

Once the Route has been created, it will be shown as in the following image.
![Create Time Series Insights](../images/visualize-23.PNG)

### Time Series Insights Explorer

Once this route has been created, you can go to the Azure Time Series Insights Explorer (AzTSIE). In the AzTSIE click in **Go to Environment** in the following image in order to see the explorer portal.

![Create Time Series Insights](../images/visualize-24.PNG)

Split By ID. You will see data flowing from two devices. MXChip and Pi Simulator. 

![Visualize Data](../images/visualize_06_Visual1.png)

Select humidity and Split By ID. You will see data flowing from two devices. MXChip and Pi Simulator.

![Visualize Data](../images/visualize_07_Visual2.png)

Right Click to Explore events. You can download events in CSV and JSON format by clicking on **CSV or JSON** buttons

![Visualize Data](../images/visualize_08_Visual3.png)

Create a perspective by clicking on the image shown below

![Visualize Data](../images/visualize_perspective.png)

Click **+** to add a new query

![Visualize Data](../images/visualize_10_visual10.png)

Select Temperature and split by Device ID and click on perspective image.

![Visualize Data](../images/visualize_11_visual11.png)

Create a chart by selecting a timeframe with drag feature

![Visualize Data](../images/visualize_12_Visual12.png)

Create a Chart by adding a predicate

![Visualize Data](../images/visualize_predicate.png)

Perspective with 4 different charts and also changed Title

![Visualize Data](../images/visualize_14_Visual_dashboard.png)

Click on Heatmap

![Visualize Data](../images/visualize_heatmap.png)

View data in a table

![Visualize Data](../images/visualize_table.png)
