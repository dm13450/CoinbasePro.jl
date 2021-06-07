
function get_pages(resp)

  headers = Dict(resp.headers)
  before, after = parse.(Int64, (get(headers, "Cb-Before", ""), 
                                get(headers, "Cb-After", "")))
  (before, after)
end