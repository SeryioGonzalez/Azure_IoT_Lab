import requests
import json

#YOU NEED TO UPDATE THESE LINES
CONTAINER_HOSTNAME = "iotteacherdeployment.westeurope.azurecontainer.io"
DEVICE_NAME = "demo_TMO"

device_command = "start_engine"

#THIS WOULD WORK FOR YOU
url = "http://" + CONTAINER_HOSTNAME + "/api/az_iot_cloud_to_device"

def send_cloud_to_device_command (device_name, device_command):
    payload = json.dumps({
        "device_name": device_name,
        "device_command": device_command
    })

    headers = {
    'Content-Type': 'application/json'
    }

    response = requests.request("POST", url, headers=headers, data=payload)

    print(response.text)




send_cloud_to_device_command (DEVICE_NAME, device_command)
