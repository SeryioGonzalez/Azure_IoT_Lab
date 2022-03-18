import json
import random
import re
import sys
import threading
import time

from azure.iot.device import IoTHubDeviceClient, Message

AUX_CONNECTION_STRING = sys.argv[1]

def aux_validate_connection_string():
    if not AUX_CONNECTION_STRING.startswith( 'HostName=' ):
        print ("ERROR  - YOUR IoT HUB CONNECTION STRING IS NOT VALID")
        print ("FORMAT - HostName=your_iot_hub_name.azure-devices.net;DeviceId=your_device_name;SharedAccessKey=your_shared_access_key")
        sys.exit()

def aux_iothub_client_init():
    client = IoTHubDeviceClient.create_from_connection_string(AUX_CONNECTION_STRING)
    return client

#MESSAGE FOR RECEIVING DATA FROM IoT HUB. THIS METHOD WILL BE CALLED BY THE RECEPTION THREAD
def message_listener(message):
    
    message_payload = message.data.decode("utf-8")
    
    print("\nMessage received")
    print( "    Data: {}".format(message_payload ) )
    
    #HERE WE CAN READ CLOUD TO DEVICE MESSAGES
    for property_key in message.custom_properties.keys():
        if property_key == 'device_command':
            device_command = message.custom_properties[property_key]

            print("Command received: {}".format(device_command))
    
            if device_command == 'stop_engine':
                print("    Command: I am stopping an engine")
                device_command_actuation_stop_engine()

def device_command_actuation_stop_engine():
    print("    Command - Stop Engine - Teach me what to do to stop_engine")

def iothub_client_read_c2d_run():
    try:
        aux_validate_connection_string()
        device_client = aux_iothub_client_init()
        device_client.on_message_received = message_listener

	#IT WILL RUN FOREVER UNLESS YOU STOP IT
        while True:
            time.sleep(5000)
			
    except KeyboardInterrupt:
        print ( "IoTHubClient sample stopped" )

if __name__ == '__main__':
    iothub_client_read_c2d_run()
