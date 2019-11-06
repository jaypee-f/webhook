#!/bin/sh

curl "https://api.staging.deliverect.com/orders?where=%7B%22account%22:%225c76ae99c6489f0001bc6b0a%22,%22_created%22:%7B%22\$gte%22:%222018-12-20T20:50:00.000Z%22,%22\$lt%22:%222020-12-20T20:52:00.000Z%22%7D%7D" \
     -H 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IlJUWkVNakV5TVVZeVJqazJPRGs1TkRjMVF6QXpNMFE1UTBFek1UazNPRFZGTkVJeFF6YzFRZyJ9.eyJpc3MiOiJodHRwczovL2RlbGl2ZXJlY3QuZXUuYXV0aDAuY29tLyIsInN1YiI6ImF5cnRqNFR6bXRxUWxqQmxoMWpnRm9SN2ZEZEtRZkZwQGNsaWVudHMiLCJhdWQiOiJodHRwczovL2FwaS5kZWxpdmVyZWN0LmNvbSIsImlhdCI6MTU3Mjk3Mzc2OCwiZXhwIjoxNTczMDYwMTY4LCJhenAiOiJheXJ0ajRUem10cVFsakJsaDFqZ0ZvUjdmRGRLUWZGcCIsImd0eSI6ImNsaWVudC1jcmVkZW50aWFscyJ9.bO89rJpNUfPKmMKwL-L_JIPzLGsDbq2kz4ImYe5ia_vpYVcwMXafGYrrxwgavtnha74cK_SBVE4Jo5PCYItDCDXEMlf786xwCmKX9Ha_3QYB92LxiF-pmmSQd3T_HHLnkFcHaMcaqo0M_6878BVgI-ZevXdh7l_kObhlSl8wo7S1Dddg9O6q0DRCPWTtluMh2T6_lU57FrXrOz39Z9MXkFQqRtv7trDN-nw_ZyItkxWrWqwxhDGqmQmW2R6Ib91kCGHjMLyuu8jfV9bRcyj2EkwfYwjhfR9UHDFNCbyq5EE1HXLvGNDd5nW8s7MBcUEfxIFCzEjH908ZwAySyzqjUQ' \
     -H 'Content-Type: application/json' > orders_list


orders=`python ./clear_orders.py`

for order in $orders
do
    curl --location --request POST "https://api.staging.deliverect.com/orderStatus/$order"   --header "Content-Type: application/json" --header "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IlJUWkVNakV5TVVZeVJqazJPRGs1TkRjMVF6QXpNMFE1UTBFek1UazNPRFZGTkVJeFF6YzFRZyJ9.eyJpc3MiOiJodHRwczovL2RlbGl2ZXJlY3QuZXUuYXV0aDAuY29tLyIsInN1YiI6ImF5cnRqNFR6bXRxUWxqQmxoMWpnRm9SN2ZEZEtRZkZwQGNsaWVudHMiLCJhdWQiOiJodHRwczovL2FwaS5kZWxpdmVyZWN0LmNvbSIsImlhdCI6MTU3Mjk3Mzc2OCwiZXhwIjoxNTczMDYwMTY4LCJhenAiOiJheXJ0ajRUem10cVFsakJsaDFqZ0ZvUjdmRGRLUWZGcCIsImd0eSI6ImNsaWVudC1jcmVkZW50aWFscyJ9.bO89rJpNUfPKmMKwL-L_JIPzLGsDbq2kz4ImYe5ia_vpYVcwMXafGYrrxwgavtnha74cK_SBVE4Jo5PCYItDCDXEMlf786xwCmKX9Ha_3QYB92LxiF-pmmSQd3T_HHLnkFcHaMcaqo0M_6878BVgI-ZevXdh7l_kObhlSl8wo7S1Dddg9O6q0DRCPWTtluMh2T6_lU57FrXrOz39Z9MXkFQqRtv7trDN-nw_ZyItkxWrWqwxhDGqmQmW2R6Ib91kCGHjMLyuu8jfV9bRcyj2EkwfYwjhfR9UHDFNCbyq5EE1HXLvGNDd5nW8s7MBcUEfxIFCzEjH908ZwAySyzqjUQ"  --data "{
    \"orderId\": \"$order\",
    \"status\": 30,
    \"reason\": \"\",
    \"timeStamp\":\"\",
    \"receiptId\":\"1234\"
}"
done
