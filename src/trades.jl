
function _get_trades(url::String)
    
  res = HTTP.get(url)

  rawData = JSON.parse(String(res.body))

  df = vcat(DataFrame.(rawData)...)
  df.time = DateTime.(chop.(df.time), dateformat"yyyy-mm-ddTHH:MM:SS.sss")
  df.price = parse.(Float64, df.price)
  df.size = parse.(Float64, df.size)

  (df, get_pages(res))
end

function trades(ccy::String)
    url = ENDPOINT * "products/" * ccy * "/trades" 
    _get_trades(url)
end

function trades_page(ccy::String, pageid::Number, beforeafter::String)
    @assert beforeafter in ["before", "after"] 
    url = ENDPOINT * "products/" * ccy * "/trades?($beforeafter)=$(pageid)"
    _get_trades(url)
end

function lasttrades(ccy::String, n::Int64)
  nreqs = div(n, 100) + 1
  res = Array{DataFrame}(undef, nreqs)

  df, pages = trades(ccy)

  if nreqs == 1 
    return df[1:n, :]
  else
    for i in eachindex(res)
      df, pages = trades_page(ccy, pages[2], "before")
      res[i] = df
    end
  end
  allres = vcat(res...)
  allres[1:n, :]
end