import asyncio
import datetime
import os
import pytz
import sys
from azure.eventhub.aio import EventHubConsumerClient
from azure.iot.hub import IoTHubRegistryManager
from azure.eventhub.extensions.checkpointstoreblobaio import BlobCheckpointStore


MAXIMUM_TEMPERATURE=40
IOT_HUB_BUILT_IN_ENDPOINT_CONNECTION_STRING = os.environ["IOT_HUB_BUILT_IN_ENDPOINT_CONNECTION_STRING"]

#NO NEED TO UPDATE
utc=pytz.UTC
EVENT_HUB_NAMESPACE_CONNECTION_STRING=";".join(IOT_HUB_BUILT_IN_ENDPOINT_CONNECTION_STRING.split(";")[0:3])
EVENT_HUB_NAME=IOT_HUB_BUILT_IN_ENDPOINT_CONNECTION_STRING.split(";")[3].split("=")[1]
EVENT_HUB_SAS=IOT_HUB_BUILT_IN_ENDPOINT_CONNECTION_STRING.split(";")[2][16:]

IOT_HUB_CONNECTION_STRING="HostName={}.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey={}".format(EVENT_HUB_NAME, EVENT_HUB_SAS)

START_TIME=utc.localize(datetime.datetime.utcnow() ) 

async def on_event(partition_context, event):
    # Print the event data.
    if event.enqueued_time > START_TIME:
        #print("Received the event: \"{}\" ".format(event.body_as_str(encoding='UTF-8')))
        event_body=event.body_as_json()
        event_temperature=event_body['temperature']
        event_device_name=event_body['device_name']

        print("Temperature {} from device {} is lower than {}".format(event_temperature, event_device_name, MAXIMUM_TEMPERATURE))
  
        if event_temperature > MAXIMUM_TEMPERATURE:

            print("Temperature {} from device {} is higher than {}".format(event_temperature, event_device_name, MAXIMUM_TEMPERATURE))
            print("Sending alert to device")

            registry_manager = IoTHubRegistryManager(IOT_HUB_CONNECTION_STRING)

            data = "ONE ACTION CODE YOU SHOULD IMPLEMENT"
            i=1
            props={}
            # optional: assign system properties
            props.update(messageId = "message_%d" % i)
            props.update(correlationId = "correlation_%d" % i)
            props.update(contentType = "application/json")
            props.update(onePropertyNameIShouldGiveAProperName = 'youShouldChangeThis')

            registry_manager.send_c2d_message(event_device_name, data, properties=props)


async def main():
    
    # Create a consumer client for the event hub.
    client = EventHubConsumerClient.from_connection_string(EVENT_HUB_NAMESPACE_CONNECTION_STRING, consumer_group="app", eventhub_name=EVENT_HUB_NAME)
    async with client:
        # Call the receive method. Read from the beginning of the partition (starting_position: "-1")
        await client.receive(on_event=on_event,  starting_position="-1")

if __name__ == '__main__':

    print("Starting the temperature control application")
    loop = asyncio.get_event_loop()
    # Run the main method.
    loop.run_until_complete(main())