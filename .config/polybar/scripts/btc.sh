#!/bin/sh

API="https://api.kraken.com/0/public/Ticker"

case $1 in 
  btc) 
    quote=$(curl -sf $API?pair=BTCUSD | jq -r ".result.XXBTZUSD.c[0]")
    quote=$(LANG=C printf "%.2f" "$quote")
    echo "$quote"
    ;;
  sol)
    quoteSol=$(curl -sf $API?pair=SOLUSDT | jq -r ".result.SOLUSDT.c[0]")
    quoteSol=$(LANG=C printf "%.2f" "$quoteSol")
    echo "$quoteSol"
    ;;
  eth)
    quoteEth=$(curl -sf $API?pair=ETHUSDT | jq -r ".result.ETHUSDT.c[0]")
    quoteEth=$(LANG=C printf "%.2f" "$quoteEth")
    echo "$quoteEth"
    ;;
esac
