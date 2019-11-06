import json

with open ('orders_list', 'r') as f:
    orders_dict = json.load(f)

for item in orders_dict["_items"]:
    print item["_id"]

