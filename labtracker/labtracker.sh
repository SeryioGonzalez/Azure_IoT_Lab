#!/bin/bash

numGroups=16
groupNamePrefix="icailabgroup"
region="westeurope"
resultFile="/home/sergio/index.html"

function checkDomain {
	domain=$1

	response=$(nslookup $domain | egrep -o "canonical|NXDOMAIN")

	if [ $response = "canonical" ]
	then
		echo "OK"
	else
		echo "KO"
	fi 
	
}	
#Check IoT Hub
function checkIoTHub {
	groupId=$1
	thisGroup=$groupNamePrefix$groupId
	domain=$thisGroup".azure-devices.net"
	checkDomain $domain
	
}

#Check Storage Account
function checkStorageAccount {
	groupId=$1
	thisGroup=$groupNamePrefix$groupId
	domain=$thisGroup".blob.core.windows.net"
	checkDomain $domain
	
}

#Check VM
function checkDeviceVM {
	groupId=$1
	thisGroup=$groupNamePrefix$groupId
	domain=$thisGroup".$region.cloudapp.azure.com"
	checkDomain $domain
	
}

echo "<table><tr><th>GroupID</th><th>Azure IoT Hub</th><th>Device VM</th><th>Storage Account</th></tr>" > $resultFile

for groupId in $(seq 1 $numGroups)
do
	iotHub=$(checkIoTHub         $groupId)
	storAc=$(checkStorageAccount $groupId)
	deviVM=$(checkDeviceVM       $groupId)
	
	echo "<tr><td>$groupId</td><td>$iotHub</td><td>$storAc</td><td>$deviVM</td></tr>" >> $resultFile

done

echo "</table>" >> $resultFile