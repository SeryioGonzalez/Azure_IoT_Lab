#!/bin/bash

source config.sh
az account set --subscription $subscription

echo "Creating RG $IoThubResourceGroup in $region"
az group create --name $IoThubResourceGroup --location $region --subscription $subscription

echo "Creating IoT Hub"
az iot hub create --name $IoTHubName --resource-group $IoThubResourceGroup --sku F1

echo "Creating storage account for messages"
az storage account create --name $messageStorageAccountName --resource-group $IoThubResourceGroup --https-only true --kind StorageV2 --sku Standard_GRS

echo "Creating storage container for messages"
az storage container create --name $messageStorageContainerName --account-name $messageStorageAccountName --public-access container

STORAGE_CONNECTION_STRING=$(az storage account show-connection-string --name $messageStorageAccountName --query connectionString -o tsv)

echo "Creating routing endpoint for messages to storage"
az iot hub routing-endpoint create \
	--connection-string $STORAGE_CONNECTION_STRING \
	--endpoint-name $messageIoTHubRoutingEndpoint \
	--endpoint-resource-group $IoThubResourceGroup \
	--endpoint-subscription-id $subscription \
	--endpoint-type azurestoragecontainer \
	--hub-name $IoTHubName \
	--container $messageStorageContainerName \
	--resource-group $IoThubResourceGroup \
	--encoding json
	
echo "Creating route for messages to storage"
az iot hub route create \
	--hub-name $IoTHubName \
	--route-name $messageIoTHubRouteName \
	--source-type devicemessages \
	--endpoint-name $messageIoTHubRoutingEndpoint \
	--resource-group $IoThubResourceGroup \
	--enable true
	