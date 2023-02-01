
import Foundation

class NetworkService {
    
    static let shared = NetworkService(); private init() {}
    let url = "https://data.messari.io/api/v1/assets"
    
    func getCoinData() async throws -> CoinData {
        guard let url = URL(string: url) else { throw HTTPError.badUrl }
        let response = try await URLSession.shared.data(from: url)
        let data = response.0
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let coinData = try jsonDecoder.decode(CoinData.self, from: data)
        return coinData
    }
}

enum HTTPError: Error {
    case badUrl
    case badRequest
    case invalidDecoding    
 }

