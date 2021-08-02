const CANDLE_NAMES = ["unix_time", "low", "high", "open", "close", "volume"]
const GRANULARITY = [60, 300, 900, 3600, 21600, 86400]

function _candles_url(id::String, startDate::DateTime, endDate::DateTime, granularity::Int64)
  ENDPOINT * "products/$(id)/candles?start=$(startDate)&&end=$(endDate)&&granularity=$(granularity)"
end

function candles(id::String, startDate::DateTime, endDate::DateTime, granularity::Int64)

  url = _candles_url(id, startDate, endDate, granularity)

  res = HTTP.get(url, status_execption=false)
  rawData = JSON.parse(String(res.body))
  if(!isa(rawData, Array))
    error(rawData["message"])
  end

  if isempty(rawData)
    error("Response is empty")
  end

  df = vcat(DataFrame.(Dict.(zip.([CANDLE_NAMES], rawData)))...)
  df.time = unix2datetime.(df.unix_time)
  df
end