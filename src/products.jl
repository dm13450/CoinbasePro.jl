"""
  products()


"""
function products()
  res = HTTP.get(ENDPOINT * "products")
  rawData = JSON.parse(String(res.body))
  vcat(DataFrame.(rawData)...)
end

function product(id::String)
  id = format_ccy(id)
  res = HTTP.get(ENDPOINT * "products/" * id)
  rawData = JSON.parse(String(res.body))
  DataFrame(rawData)
end

function product(ccy1::String, ccy2::String)
  product(ccy1 * "-" * ccy2)
end