import random
import re
import sys
import time

from azure.iot.device import IoTHubDeviceClient, Message

CONNECTION_STRING = sys.argv[1]

# Define the JSON message to send to IoT Hub.
BASE_BODY_TEMPERATURE = 37.0
BASE_HEART_RATE = 65
MAXIMUM_BODY_TEMPERATURE = 40.0
MAXIMUM_HEART_RATE = 150

MSG_TXT = '{{"temperature": {temperature_value},"heart_rate": {heart_rate_value}}}'

def validate_connection_string():
    if not CONNECTION_STRING.startswith( 'HostName=' ):
        print "ERROR  - YOUR IoT HUB CONNECTION STRING IS NOT VALID"
        print "FORMAT - HostName=your_iot_hub_name.azure-devices.net;DeviceId=your_device_name;SharedAccessKey=your_shared_access_key"
        sys.exit()

def iothub_client_init():
    client = IoTHubDeviceClient.create_from_connection_string(CONNECTION_STRING)
    return client

def iothub_client_telemetry_sample_run():
    try:
        validate_connection_string()
        client = iothub_client_init()

        print ( "IoT Hub Simulated body sensor" )
        print ( "Press Ctrl-C to exit" )

        while True:
        # Build the message with simulated telemetry values.
            temperature_measure = BASE_BODY_TEMPERATURE + (random.random() * random.random() * 5)
            heart_rate_measure  = BASE_HEART_RATE + (random.random() * random.random() * 15)
            msg_txt_formatted = MSG_TXT.format(temperature_value=temperature_measure, heart_rate_value=heart_rate_measure)
            message = Message(msg_txt_formatted)

        # Add a custom application property to the message.
            if temperature_measure > MAXIMUM_BODY_TEMPERATURE:
              message.custom_properties["temperature_alert"] = "true"
            else:
              message.custom_properties["temperature_alert"] = "false"

            message.content_encoding='utf-8'
            message.content_type='application/json'

            # Send the message.
            print( "Sending message: {}".format(message) )
            client.send_message(message)
            print ( "Message successfully sent" )
            time.sleep(1)

    except KeyboardInterrupt:
        print ( "IoTHubClient sample stopped" )

if __name__ == '__main__':
    iothub_client_telemetry_sample_run()