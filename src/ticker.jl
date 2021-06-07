
```
Snapshot information for a currency. 
```
function ticker(id::String)
  res = HTTP.get(ENDPOINT * "products/$id/ticker")
  rawData = JSON.parse(String(res.body))
  df = DataFrame(rawData)
  df.ask = parse.(Float64, df.ask)
  df.bid = parse.(Float64, df.bid)
  df.size = parse.(Float64, df.size)
  df.volume = parse.(Float64, df.volume) 
  df.price = parse.(Float64, df.price) 
  #df.time = DateTime.(chop.(df.time), dateformat"yyyy-mm-ddTHH:MM:SS.ssssss")
  df
end