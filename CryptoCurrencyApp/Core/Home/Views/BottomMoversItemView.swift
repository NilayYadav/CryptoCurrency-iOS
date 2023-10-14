//
//  BottomMoversItemView.swift
//  CryptoCurrencyApp
//
//  Created by Nilay on 12/10/23.
//

import SwiftUI
import Kingfisher

struct BottomMoversItemView: View {
    let coin: Coin
    
    var body: some View {
        
        HStack {
            
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundColor(.gray)
            
            KFImage(URL(string: coin.image))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.orange)
                    .padding(.bottom, 2)
                
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading,6)
                    .fontWeight(.bold)
            }
            .padding(.leading, 2)
                
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.priceChangePercentage24H.toPercent())
                    .font(.caption)
                    .padding(.leading,6)
                    .fontWeight(.bold)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
            }
            .padding(.leading, 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
//
//#Preview {
//    BottomMoversItemView(coin: <#Coin#>)
//}
