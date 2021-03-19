# CoinbasePro

A basic API for getting Coinbase data into Julia. 

This package provides a Julia interface for the market data functions listed here: https://docs.pro.coinbase.com/

## Functions

* `products` lists the available currency pairs provided by Coinbase. 
* `book` provides order book information at 3 different levels. 
* `ticker` a snapshot of the last trade, best bid/offer and volume over the last 24 hours. 
* `trades` historical trades of a currency. 
* `candles` historical open-high-low-close (OHLC) market data 
* `stats` OHLC and volume data from the last 24 hours. 
