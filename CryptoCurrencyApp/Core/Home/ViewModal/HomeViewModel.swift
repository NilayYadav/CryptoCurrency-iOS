//
//  HomeViewModel.swift
//  CryptoCurrencyApp
//
//  Created by Nilay on 13/10/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    @Published var Topcoins = [Coin]()

    init() {
        fetchCoinData()
    }
    
    func fetchCoinData() {
        let api = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"
        
        guard let url = URL(string: api) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("API RESPONS \(response.statusCode)")
            }
            
            guard let data = data else { return }
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMoverCoin()
                }
            } catch let error {
                print("Error \(error)")
            }
            
        }.resume()
    }
    
    func configureTopMoverCoin () {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
        self.Topcoins = Array(topMovers.prefix(5))
    }
}
