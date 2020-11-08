
region="westeurope"
environmentName="icai-iot-lab"

#Resource Groups
resourceGroup=$environmentName

#Read Group Number
read -p " Please enter your group number, Example == 02h :" groupNumber
if [ ${#groupNumber} -eq 1 ]
then 
	groupNumber="0"$groupNumber
fi
[[ $groupNumber =~ ^[0-9]{2}[ch]$ ]] || echo "ERROR: Your group number must go from 1 to 99. Put c or h if you are at class or at home" && exit

#Read user name
read -p " Please enter your VM user name: " vmUser
[[ $vmUser"jjj" = "jjj" ]] && echo "ERROR: Specify your VM user name"

#Read user password
echo "  Password must have 12 characters, a capital letter, small letters, numbers and special characters"
read -p " Please enter your VM user password: " vmUserPassword
python password-checker.py $vmUserPassword

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

az extension add --name azure-cli-iot-ext > /dev/null
