
function get_pages(resp)

  headers = Dict(resp.headers)
  before, after = parse.(Int64, (get(headers, "Cb-Before", "0"), 
                                get(headers, "Cb-After", "0")))
  (before, after)
end

function format_ccy(ccypair)
  if occursin("-", ccypair)
    return ccypair
  end
  ccypair[1:3] * "-" * ccypair[4:end]
end
