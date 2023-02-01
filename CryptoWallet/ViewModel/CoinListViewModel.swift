

import Foundation


class CoinListViewModel {
    
    var currentUser: User
    var coinData: CoinData?
    
    init(currentUser: User) {
        self.currentUser = currentUser
    }
    
    func getData(completion: @escaping  () -> ()) {
        Task {
            do { 
                let data = try await NetworkService.shared.getCoinData()
                print(data.data[0].name)
                self.coinData = data
                DispatchQueue.main.async {
                    completion()
                }
                
            } catch {}
        }
    }

    
}
