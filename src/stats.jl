function stats(id::String)
  id = format_ccy(id)
  res = HTTP.get(ENDPOINT * "products/$id/stats")
  rawData = JSON.parse(String(res.body))
  DataFrame(rawData)
end

function stats(ccy1::String, ccy2::String)
  stats(ccy1 * "-" * ccy2)
end