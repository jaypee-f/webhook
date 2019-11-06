#!/bin/sh

## Token: Password (user&pass -> login-token)
access_token=`\
curl -s -X "POST" "https://oauth.stage.intelligentposapi.com/token" \
     -H 'Access-Control-Allow-Origin: *' \
     -H 'X-Request-Id: UUID' \
     -H 'Content-Type: application/x-www-form-urlencoded; charset=utf-8' \
     -u 'login:' \
     --data-urlencode "username=$1" \
     --data-urlencode "password=$2" \
     --data-urlencode "grant_type=password" \
     --data-urlencode "scope=LOGIN" \
| jq -r .access_token`

## Get OTP: (login-token -> one-time-passw)
otp=`\
curl -s "https://oauth.stage.intelligentposapi.com/otp" \
     -H "Authorization: Bearer $access_token" \
     -H 'X-Request-Id: UUID' \
     -H 'Content-Type: application/x-www-form-urlencoded; charset=utf-8' | jq -r .otp`

## Authorize: Get Authorization Code (one-time-passw -> code)
code=`\curl -s -X "POST" "https://oauth.stage.intelligentposapi.com/authorize?code_challenge&scope=ALL:INTERNAL&state=987654312&response_type=code&code_challenge_method&otp=$otp&redirect_uri=%2Foauth%2Freceivecode&client_id=iposbackoffice" \
     -H 'X-Request-Id: UUID' \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{}' \
| jq -r .code`

## Token: Authorization Code (code -> token)
curl -s -X "POST" "https://oauth.stage.intelligentposapi.com/token?code_verifier&code=$code&grant_type=authorization_code&redirect_uri=%2Foauth%2Freceivecode" \
     -H 'X-Request-Id: UUID' \
     -H 'Content-Type: application/x-www-form-urlencoded; charset=utf-8' \
     -u 'iposbackoffice:' | jq -r .access_token
