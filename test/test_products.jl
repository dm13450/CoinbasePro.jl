
@testset "products" begin
  res = products()

  @test isa(res, DataFrame)
end 

@testset "product" begin
  res = product("btc-usd")

  @test isa(res, DataFrame)
end