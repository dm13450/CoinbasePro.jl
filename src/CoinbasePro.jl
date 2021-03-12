module CoinbasePro

using HTTP
using JSON
using Dates
using DataFrames

const ENDPOINT = "https://api.pro.coinbase.com/"

include("trades.jl")
include("utils.jl")
include("products.jl")
include("stats.jl")
include("ticker.jl")
include("book.jl")

export trades, lasttrades, products, product, stats, ticker, book

end
