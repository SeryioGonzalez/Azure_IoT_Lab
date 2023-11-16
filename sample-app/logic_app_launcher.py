import requests

api_endpoint=""

headers = {'Content-type': 'application/json'}
post_json={}

post_json["date"] = "17th November 2023"
post_json["distance_object"] = "2.3m"
post_json["size_object"] = "4m"



response = requests.post(api_endpoint, json = post_json, headers=headers)
print(response)

