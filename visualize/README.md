# Visualize Time Series Data with Azure Time Series Insights

![Time Series Insights](../images/visualize_timeseriesinsights.jpg)

Azure Time Series Insights is a fully managed analytics, storage, and visualization service for managing IoT-scale time-series data in the cloud. It provides massively scalable time-series data storage and enables you to explore and analyze billions of events streaming in from all over the world in seconds. Use Time Series Insights to store and manage terabytes of time-series data, explore and visualize billions of events simultaneously, conduct root-cause analysis, and to compare multiple sites and assets.

In this lab you will learn

* How to set up a Time Series Insights environment
* Explore and analyze time series data of your IoT solutions or connected things

## Create Time Series Insights

1. Select **Time Series Insights** in the resource explorer search box of the Azure portal.
2. Selecty the **Subscription** and **Resource Group** used in the lab
3. For **Environment name** select your group nickname **icaiiotlabgroupY** as resource name. 
4. Select the **Location** to **West Europe**.
5. For **Tier** select **Gen2 (L1)**
6. In the field **Property name** input **temperature** and **heart_rate**
7. Create a **Storage Account** using your group nickname and **tsi** at the end
8. Disable **Data Lake Storage Gen2** and **Warm store**
9. Click on **Next: Event Source >** for configuring the IoT Hub that will be sending data to this TSI instance

![Create Time Series Insights](../images/tsi-01.png)

In the next blade, we are going to integrate the existing Azure IoT Hub: 

10. In **Create and event Source?** select **Yes**
11. Select **Source Type** to **IoT Hub** 
12. Give a sample name **iot-hub** 
13. Select your **Subscription** and your existing **IoT Hub name** 
14. Select **IoT Hub access policy name** to **iothubowner** 
15. Select **IoT Hub consumer group** create a new entry to **tsi**
17. Click **Create**

![Create Time Series Insights](../images/tsi-02.png)

Once the deployment is complete, you will see the following image.

![Create Time Series Insights](../images/tsi-03.png)

Select **Go to resource**

## Time Series Insights Explorer

In Azure Time Series Insights Explorer (AzTSIE) click in **Go to TSI Explorer** in the following image in order to see the explorer portal.

![Create Time Series Insights](../images/visualize-24.PNG)

The AzTSIE allows correlating and visualazing data. For this, supposing you have sent traffic from the simulated device to Azure IoT Hub, implement a diagram like the one shown below.

![Create Time Series Insights](../images/tsi-04.png)

In purple in the left hand side, we can select which metrics we want to monitor. In the simulated device, we configure 2 metrics, **heart_rate** and **temperature**. We can add N additiona metrics by clicking the **Add**, right above the purple highlight square.
We can explore in detail the value of a given metric, by clicking **Explore Events**, as highlighted in brown above.


## Additional capabilities Time Series Insights Explorer

Examples are not related to this very experiment.

Create a perspective by clicking on the image shown below

![Visualize Data](../images/visualize_perspective.png)

Click **+** to add a new query

![Visualize Data](../images/visualize_10_visual10.png)

Select an additional visual.

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

Go to the next module for continuing the lab.
[Go back to the main section](../README.md )
