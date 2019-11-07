#!/bin/bash

numGroups=2
groupNamePrefix="icaiiotlabgroup"
region="westeurope"
resultFile="/home/sergio/index.html"

cat <<EOF > $resultFile
<!DOCTYPE html>
<html>
<head>
<title>Lab validator</title>
<meta charset="UTF-8">
<style>
table, th, td {
  border: 1px solid black;
}
</style>
<script>
	var td_array = document.getElementsByTagName('TD');
	alert(td_array.length);

	for (var i = 0; i < td_array.length; i++){
	  if (td_array[i].textContent == 'OK'){
		td_array[i].style.color = 'red';
	  };
	};
</script>
</head>
<body>
<table><tr><th>GroupID</th><th>Azure IoT Hub</th><th>Device VM</th><th>Storage Account</th></tr>
EOF


function checkDomain {
	domain=$1

	response=$(nslookup $domain | egrep -o "canonical|NXDOMAIN")

	if [ $response"a" = "canonicala" ]
	then
		echo "OK"
	elif [ $response"a" = "a" ]
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


for groupId in $(seq 1 $numGroups)
do
	iotHub=$(checkIoTHub         $groupId)
	storAc=$(checkStorageAccount $groupId)
	deviVM=$(checkDeviceVM       $groupId)
	
	echo "<tr><td>$groupId</td><td>$iotHub</td><td>$storAc</td><td>$deviVM</td></tr>" >> $resultFile

done

echo "</table></body></html>" >> $resultFile