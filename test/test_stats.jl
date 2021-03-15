
@testset "stats" begin
  res = stats("BTC-USD")
  @test isa(res, DataFrame)
end 