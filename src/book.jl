
const L12_NAMES = ["price", "size", "num-orders"]
const L3_NAMES = ["price", "size", "order_id"]
const LEVELS = [1,2,3]

function book(id::String, level::Int64)
  @assert level in LEVELS

  if level == 3
    return _book3(id)
  else
    return _book12(id, level)
  end
end

function _book(id::String, level::Int64)
  res = HTTP.get(ENDPOINT * "products/$id/book?level=$(level)")
  rawData = JSON.parse(String(res.body))
end

function _book12(id::String, level::Int64)
  rawData = _book(id, level)

  askData = rawData["asks"]
  bidData = rawData["bids"]

  askFrame = vcat(DataFrame.(Dict.(zip.([L12_NAMES .* "_ask"], askData)))...)
  bidFrame = vcat(DataFrame.(Dict.(zip.([L12_NAMES .* "_bid"], bidData)))...)

  res = hcat(askFrame, bidFrame)
  res[!, :sequence] .= rawData["sequence"]
  res[!, :level] .= 1:nrow(res)
  res = _format_book(res)
  res
end

function _book3(id::String)
  rawData = _book(id, 3)

  askData = rawData["asks"]
  bidData = rawData["bids"]

  askFrame = vcat(DataFrame.(Dict.(zip.([L3_NAMES .* "_ask"], askData)))...)
  bidFrame = vcat(DataFrame.(Dict.(zip.([L3_NAMES .* "_bid"], bidData)))...)

  askFrame[!, :level] .= 1:nrow(askFrame) 
  bidFrame[!, :level] .= 1:nrow(bidFrame) 

  full = outerjoin(askFrame, bidFrame, on=:level)
  full[!, :sequence] .= rawData["sequence"]
  full = _format_book(full)
  full
end 

function _format_book(df::DataFrame)

  for col in ("price_ask", "size_ask", "price_bid", "size_bid")
    df[!, col] = coalesce.(df[!, col], "NaN")
    df[!, col] = parse.(Float64, df[!, col])
  end
  df
end