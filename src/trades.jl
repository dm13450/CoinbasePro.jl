
function _get_trades(url::String)
    
  res = HTTP.get(url)
  @assert !isnothing(res)

  rawData = JSON.parse(String(res.body))

  df = vcat(DataFrame.(rawData)...)
  df.time = TimeDate.(String.(chop.(df.time)))
  df.price = parse.(Float64, df.price)
  df.size = parse.(Float64, df.size)

  (df, get_pages(res))
end

function trades(ccy::String)
  ccy = format_ccy(ccy)
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
    nextpage = pages[2]
    for i in eachindex(res)
      df2, pages2 = trades_page(ccy, nextpage, "after")
      nextpage = pages2[2]
      res[i] = df2
    end
  end
  allres = vcat(res...)
  allres[1:n, :]
end