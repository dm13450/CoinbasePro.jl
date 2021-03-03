
@testset "trades" begin

  @testset "trades" begin
    trades = trades("USDBTC")
    @test length(trades) == 2
    @test isa(trades[1], DataFrame)
    @test length(trades[2]) == 2
  end


end 