

import Foundation

struct CoinData: Decodable {
    var status: Status
    var data: [ExchangeData]
    
    struct Status: Decodable {
        var elapsed: Int
        var timestamp: String
    }
    
    struct ExchangeData: Decodable {
        
        var id: String
        var symbol: String
        var name: String
        var metrics: Metrics
        
        struct Metrics: Decodable {
            var marketData: MarketData
            
            struct MarketData: Decodable {
                var priceUsd: Double
                var percentChangeUsdLast24Hours: Double 
            }
        }
    }
}
