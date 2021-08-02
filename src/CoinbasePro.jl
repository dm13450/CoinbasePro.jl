module CoinbasePro

using HTTP
using JSON
using Dates
using DataFrames
using TimesDates

const ENDPOINT = "https://api.pro.coinbase.com/"

include("trades.jl")
include("utils.jl")
include("products.jl")
include("stats.jl")
include("ticker.jl")
include("book.jl")
include("candles.jl")

export trades, lasttrades, products, product, stats, ticker, book, candles

end
