
const L1_NAMES = ["price", "size", "num-orders"]

function _book(id::String, level::Int64)
  res = HTTP.get(ENDPOINT * "products/$id/book?level=$(level)")
  rawData = JSON.parse(String(res.body))
end

function book(id::String, level::Int64)

  rawData = _book(id, level)

  askData = rawData["asks"]
  bidData = rawData["bids"]

  askFrame = map(x -> DataFrame(Dict(zip(L1_NAMES .* "ask", x))), askData)
  bidFrame = map(x -> DataFrame(Dict(zip(L1_NAMES .* "bid", x))), bidData)
  hcat(askFrame, bidFrame, DataFrame(sequence = rawData["sequence"]))
end