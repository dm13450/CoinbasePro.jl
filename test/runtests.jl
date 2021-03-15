using CoinbasePro
using Test
using DataFrames

@testset "CoinbasePro" begin

for file in filter(x->occursin("test_", x), readdir("."))
  include(file)
end

end