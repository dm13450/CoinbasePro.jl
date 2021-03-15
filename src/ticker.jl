
function ticker(id::String)
  res = HTTP.get(ENDPOINT * "products/$id/ticker")
  rawData = JSON.parse(String(res.body))
  DataFrame(rawData)
end