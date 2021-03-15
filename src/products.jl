"""



"""
function products()
  res = HTTP.get(ENDPOINT * "products")
  rawData = JSON.parse(String(res.body))
  vcat(DataFrame.(rawData)...)
end

function product(id::String)
  res = HTTP.get(ENDPOINT * "products/" * id)
  rawData = JSON.parse(String(res.body))
  DataFrame(rawData)
end

function product(ccy1::String, ccy2::String)
  prodcut(ccy1 * "-" * ccy2)
end