# CoinbasePro

A basic API for getting Coinbase data into Julia. 

This package provides a Julia interface for the market data functions listed here: https://docs.pro.coinbase.com/

## Under Development
* Non market data based functions.

## Getting Started
Install the package in Julia using the Pkg REPL:

```julia 
julia> ]
pkg> add CoinbasePro
```

or 

```julia 
using Pkg
Pkg.add("CoinbasePro")
```

## Functions

### Market Data Functions

- [products](https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproducts-1)

Information on all currency pairs for trading or a specific currency pair. 

```julia 
products()
products("BTC-USD")
produces("ETH", "USD")
```

- [book](https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproductbook-1)

Get the orderbook for a product. 
* Level 1: Best Bid and Ask 
* Level 2: Full order book aggregated
* Level 3: Full order book not aggregated.

Change the level with the 2nd argument to the function. 

```julia
#level 1
book("BTC-USD", 1)
#level 3
book("BTC-USD", 3)
```

- [ticker](https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproductticker-1)
Get the last trade, best bid/offer and 24 hour volume for a product. 

```julia
ticker("BTC-USD")
```

- [trades](https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproducttrades-1)
Get a list of trades of a product. 
Paginated so will return both the data and a pagination cursor. 
using `lasttrades` to get the last `n` trades of a product.

```julia
trades("BTC-USD")
lasttrades("BTC-USD", 100)
```


- [candles](https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproductcandles-1)
Historical rates for a product in terms of open, high, low, and close (OHLC).  
1 minute, 5 minute, 15 minute, 1 hour, 6 hour and 1 day granularity available. 

```julia
# 1 minute bars
using DateTime
candles("BTC-USD", now() - Hour(1), now(), 60)
```

- [stats](https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproductstats-1?)
OHLC and volume data from the last 24 hours and 30 day average volume. 

```julia 
stats("BTC-USD")
```

A tutorial on the various functions can be found [here](http://dm13450.github.io/2021/06/25/HighFreqCrypto.html).