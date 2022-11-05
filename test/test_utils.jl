
@testset "Utils" begin

  @testset "Format ccy" begin 
    ccy = "BTCUSD"
    ccy2 = CoinbasePro.format_ccy(ccy)
    @test ccy2 == "BTC-USD"
  end

end