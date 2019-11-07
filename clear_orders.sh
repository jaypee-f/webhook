#!/bin/sh

auth=`cat deliverect_token`

curl "https://api.staging.deliverect.com/orders?where=%7B%22account%22:%225c76ae99c6489f0001bc6b0a%22,%22_created%22:%7B%22\$gte%22:%222018-12-20T20:50:00.000Z%22,%22\$lt%22:%222020-12-20T20:52:00.000Z%22%7D%7D" \
     -H "Authorization: Bearer $auth" \
     -H 'Content-Type: application/json' > orders_list


orders=`python ./clear_orders.py`

for order in $orders
do
    curl --location --request POST "https://api.staging.deliverect.com/orderStatus/$order"   --header "Content-Type: application/json" --header "Authorization: Bearer $auth"  --data "{
    \"orderId\": \"$order\",
    \"status\": 30,
    \"reason\": \"\",
    \"timeStamp\":\"\",
    \"receiptId\":\"1234\"
}"
done
