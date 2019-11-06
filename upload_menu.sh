#!/bin/sh

body=`python3 upload_menu.py`


curl -X "POST" "https://api.staging.deliverect.com/productAndCategories" \
    -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IlJUWkVNakV5TVVZeVJqazJPRGs1TkRjMVF6QXpNMFE1UTBFek1UazNPRFZGTkVJeFF6YzFRZyJ9.eyJpc3MiOiJodHRwczovL2RlbGl2ZXJlY3QuZXUuYXV0aDAuY29tLyIsInN1YiI6ImF5cnRqNFR6bXRxUWxqQmxoMWpnRm9SN2ZEZEtRZkZwQGNsaWVudHMiLCJhdWQiOiJodHRwczovL2FwaS5kZWxpdmVyZWN0LmNvbSIsImlhdCI6MTU3Mjk3Mzc2OCwiZXhwIjoxNTczMDYwMTY4LCJhenAiOiJheXJ0ajRUem10cVFsakJsaDFqZ0ZvUjdmRGRLUWZGcCIsImd0eSI6ImNsaWVudC1jcmVkZW50aWFscyJ9.bO89rJpNUfPKmMKwL-L_JIPzLGsDbq2kz4ImYe5ia_vpYVcwMXafGYrrxwgavtnha74cK_SBVE4Jo5PCYItDCDXEMlf786xwCmKX9Ha_3QYB92LxiF-pmmSQd3T_HHLnkFcHaMcaqo0M_6878BVgI-ZevXdh7l_kObhlSl8wo7S1Dddg9O6q0DRCPWTtluMh2T6_lU57FrXrOz39Z9MXkFQqRtv7trDN-nw_ZyItkxWrWqwxhDGqmQmW2R6Ib91kCGHjMLyuu8jfV9bRcyj2EkwfYwjhfR9UHDFNCbyq5EE1HXLvGNDd5nW8s7MBcUEfxIFCzEjH908ZwAySyzqjUQ' \
    -d "$body"

exit


curl -X "POST" "https://api.staging.deliverect.com/productAndCategories" \
    -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IlJUWkVNakV5TVVZeVJqazJPRGs1TkRjMVF6QXpNMFE1UTBFek1UazNPRFZGTkVJeFF6YzFRZyJ9.eyJpc3MiOiJodHRwczovL2RlbGl2ZXJlY3QuZXUuYXV0aDAuY29tLyIsInN1YiI6ImF5cnRqNFR6bXRxUWxqQmxoMWpnRm9SN2ZEZEtRZkZwQGNsaWVudHMiLCJhdWQiOiJodHRwczovL2FwaS5kZWxpdmVyZWN0LmNvbSIsImlhdCI6MTU3Mjk3Mzc2OCwiZXhwIjoxNTczMDYwMTY4LCJhenAiOiJheXJ0ajRUem10cVFsakJsaDFqZ0ZvUjdmRGRLUWZGcCIsImd0eSI6ImNsaWVudC1jcmVkZW50aWFscyJ9.bO89rJpNUfPKmMKwL-L_JIPzLGsDbq2kz4ImYe5ia_vpYVcwMXafGYrrxwgavtnha74cK_SBVE4Jo5PCYItDCDXEMlf786xwCmKX9Ha_3QYB92LxiF-pmmSQd3T_HHLnkFcHaMcaqo0M_6878BVgI-ZevXdh7l_kObhlSl8wo7S1Dddg9O6q0DRCPWTtluMh2T6_lU57FrXrOz39Z9MXkFQqRtv7trDN-nw_ZyItkxWrWqwxhDGqmQmW2R6Ib91kCGHjMLyuu8jfV9bRcyj2EkwfYwjhfR9UHDFNCbyq5EE1HXLvGNDd5nW8s7MBcUEfxIFCzEjH908ZwAySyzqjUQ' \
    -d $'{
  "products": [
    {
      "takeawayTax": 20000,
      "productType": 1,
      "price": 550,
      "uniqueKey": "",
      "plu": "PR01",
      "posProductId": "46b79ddd-8c14-4ce5-852c-f99c1d44afe3",
      "posProductCategoryId": "0c5736c0-ef14-43d2-a1be-e0c5691644f6",
      "imageUrl": "",
      "description": "Nice and spicy chilli",
      "name": "Chilli",
      "deliveryTax": 20000
    },
    {
      "takeawayTax": 20000,
      "productType": 1,
      "price": 750,
      "uniqueKey": "",
      "plu": "PR02",
      "posProductId": "609207b8-6ab8-4965-9819-96474165bade",
      "posProductCategoryId": "0c5736c0-ef14-43d2-a1be-e0c5691644f6",
      "imageUrl": "",
      "description": "Tasty burger",
      "name": "Burger",
      "deliveryTax": 20000
    },
    {
      "takeawayTax": 20000,
      "productType": 1,
      "price": 400,
      "uniqueKey": "",
      "plu": "PR03",
      "posProductId": "4cb3fda2-aab6-4903-9d30-b85988e0f34b",
      "posProductCategoryId": "5f053935-a267-4bb6-ab35-540e1a41ec4a",
      "imageUrl": "",
      "description": "Delicious turkey sandwich",
      "name": "Turkey sandwich",
      "deliveryTax": 20000
    }
  ],
  "accountId": "5c76ae99c6489f0001bc6b0a",
  "categories": [
    {
      "name": "Hot food",
      "posCategoryId": "0c5736c0-ef14-43d2-a1be-e0c5691644f6",
      "imageUrl": ""
    },
    {
      "name": "Cold food",
      "posCategoryId": "5f053935-a267-4bb6-ab35-540e1a41ec4a",
      "imageUrl": ""
    }
  ],
  "locationId": "5db938536d49b300017efcc3"
}'
