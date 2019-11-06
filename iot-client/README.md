# Extending sensor metrics

In this module, we will extend the script sending data to the cloud for adding new measures. You will get familiar with an example script structure so you can extend it for your own project.

Please browse the script **iot-hub-client.py** in this repo. Explore the main method structure. See it run a sample collection method that starts the Azure IoT Hub connection and starts an infinite loop in which it collects sensor data, sends it to the cloud and repeats the look forever after a sleep period.
In order to updating the code of the sensor, in a more professional model you should look at DevOps Continuous Deployment models. For this lab, you can connect to the VM using NotePad++ FTP plugin and adding an SFTP connection

![Snapshot](../images/simulated-13.PNG "Azure VM")

As an example, we added a new meassure called **blood_sugar** supposing we have a sensor we can read from.

![Snapshot](../images/simulated-14.PNG "Azure VM")

After executing the script again, we can see the new metric being sent to the cloud.

![Snapshot](../images/simulated-15.PNG "Azure VM")
