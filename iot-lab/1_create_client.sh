#!/bin/bash

source config.sh
az account set --subscription $subscription

clientEnvironment=$environmentName"-client"

echo "Creating RG $clientResourceGroup in $region"
az group create --name $clientResourceGroup --location $region --subscription $subscription

echo "Deploying client VM"
az group deployment create --resource-group $clientResourceGroup --name "client" --template-file "clientdeploy.json" --parameters projectName=$clientEnvironment

echo "Installing required packages"
az vm run-command invoke --resource-group $clientResourceGroup -n $clientEnvironment"-vm" --command-id RunShellScript --scripts "sudo apt-get update -y && sudo apt-get install -y python-pip && pip install azure-iot-device && git clone https://github.com/SeryioGonzalez/azure-iot.git /home/sergio/azure-iot/"

CLIENT_PUBLIC_IP=$(az network public-ip list -g $clientResourceGroup --query "[0].ipAddress" -o tsv)
echo "Connect to client in $CLIENT_PUBLIC_IP"