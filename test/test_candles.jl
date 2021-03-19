using Dates

@testset "candles" begin

  for gran in CoinbasePro.GRANULARITY
    @testset "Granularity: $(gran)" begin
      if gran in [21600, 86400]
        res = candles("btc-usd", now() - Day(1), now(), gran)
      else 
        res = candles("btc-usd", now() - Hour(1), now(), gran)
      end
      @test isa(res, DataFrame)
    end
  end

  @testset "granularity failure" begin

  end

end