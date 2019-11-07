#!/bin/sh

auth=`./auth_me.sh $1 $2`

## Fetch all categories by site
curl -s "https://boundary.stage.intelligentposapi.com/product-library/v1/businesses/self/categories/sites/6ee6df90-a30f-4792-8289-ecf516e79000" \
     -H 'X-Request-Id: 99e4d7ed-ee0d-4d13-a436-61cc7b693cf1' \
     -H "Authorization: Bearer $auth" > cat.json

## Fetch all products by site
curl -s "https://boundary.stage.intelligentposapi.com/product-library/v1/businesses/self/products/sites/6ee6df90-a30f-4792-8289-ecf516e79000?site=6ee6df90-a30f-4792-8289-ecf516e79000" \
     -H 'X-Request-Id: 46c2ef23-5998-4080-aea6-0d947a8b3142' \
     -H "Authorization: Bearer $auth" > pl.json
