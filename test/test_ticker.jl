
@testset "Ticker" begin 
    res = ticker("BTC-USD")
    @test isa(res, DataFrame)

end