#!/bin/sh

API="https://economia.awesomeapi.com.br/json/last"
quote=$(curl -sf $API/USD-BRL | jq -r ".USDBRL.bid")
echo "$quote"
