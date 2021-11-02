#!/bin/bash 

region="westeurope"
environmentName="icai-iot-lab"

#Resource Groups
resourceGroup=$environmentName

#Read Group Number
read -p " Please enter your group number, (Example == 02):  " groupNumber

groupNumber=$(python3 group-checker.py $groupNumber)

if [ $? -ne 0 ]
then 
	echo 'ERROR: Your group number must use double digits, example 03'
	exit
fi

#Read user 
read -p " Please enter your VM user: " vmUser

#Read user password
echo "  Password must have 12 characters, a capital letter, small letters, numbers and special characters"
read -p " Please enter your VM user password: " vmUserPassword
python3 password-checker.py $vmUserPassword

if [ $? -ne 0 ]
then
	exit
fi


startTime=$(date +%s )

clientEnvironment=$environmentName"-client"

#groupId
groupId="icaiiotlabgroup"$groupNumber

#IoT Hub
messageStorageContainerName="messagedata"
messageIoTHubRoutingEndpoint="messageStorageEndpoint"
messageIoTHubRouteName="messageStorageRoute"

#IoT device
deviceId="sensor"

function log {
	secondsNow=$(date +%s )
	elapsed=$(expr $secondsNow - $startTime)
	echo "LOGGING - $elapsed s. - "$1
}

az --version > /dev/null

if [ $? != 0 ]
then
	echo "ERROR: You need to install AZ CLI"
	exit
fi

az extension add --name azure-iot > /dev/null
