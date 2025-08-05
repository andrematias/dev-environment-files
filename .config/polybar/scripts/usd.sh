#!/bin/sh

API="https://economia.awesomeapi.com.br/json/last"
quote=$(curl -sf $API/USD-BRL | jq -r ".USDBRL.bid")
# quote=$(LANG=C printf "%.2f" "$quote")
echo "$quote"
