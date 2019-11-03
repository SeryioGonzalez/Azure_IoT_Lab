#!/bin/bash

source config.sh

echo "Creating IoT device"	
az iot hub device-identity create --device-id $deviceId --hub-name $IoTHubName

echo "Device Connection String"
az iot hub device-identity show-connection-string --device-id $deviceId --hub-name $IoTHubName -o tsv