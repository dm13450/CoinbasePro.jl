
@testset "book" begin

  @testset "level 1" begin
    res = book("BTC-USD", 1)
    @test isa(res, DataFrame)
    @test nrow(res) == 1
  end

  @testset "level 2" begin
    res = book("BTC-USD", 2)
    @test isa(res, DataFrame)
    @test nrow(res) == 50
  end

  @testset "level 3" begin
    res = book("BTC-USD", 3)
    @test isa(res, DataFrame)
  end


end