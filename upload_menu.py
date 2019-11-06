import json
import jsonpickle
from pprint import pprint

class Object(object):
    pass


prods = Object()
prods.accountId="5c76ae99c6489f0001bc6b0a"
prods.locationId="5db938536d49b300017efcc3"

prods.products=[]
prods.categories=[]

with open ('pl.json', 'r') as f:
    products_dict = json.load(f)

for item in products_dict["models"]:
    prod = Object()
    prod.productType=1
    prod.plu=item["id"]
    prod.price=item["price"]
    prod.posProductId=item["id"]
    prod.name=item["name"]
    prod.posProductCategoryId=item["parentId"]
    prod.imageUrl=""
    prod.description=item["description"]
    prod.deliveryTax=20000
    prod.takeawayTax=20000
    prods.products.append(prod)

with open ('cat.json', 'r') as f:
    category_dict = json.load(f)

for item in category_dict["models"]:
    cat = Object()
    cat.name=item["name"]
    cat.posCategoryId=item["id"]
    cat.imageUrl:""
    prods.categories.append(cat)


print(jsonpickle.dumps(prods))

