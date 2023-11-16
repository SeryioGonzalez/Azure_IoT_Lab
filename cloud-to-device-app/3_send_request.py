import requests
import json

#YOU NEED TO UPDATE THIS LINE
CONTAINER_HOSTNAME = "iotteacherdeployment.westeurope.azurecontainer.io"

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


#THIS IS THE LOGIC OF YOUR PROGRAM
device_name = "demo_TMO"
device_command = "start_engine"

send_cloud_to_device_command (device_name, device_command)
