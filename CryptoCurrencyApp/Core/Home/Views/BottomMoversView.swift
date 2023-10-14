//
//  BottomMoversView.swift
//  CryptoCurrencyApp
//
//  Created by Nilay on 12/10/23.
//

import SwiftUI

struct BottomMoversView: View {
    
    @StateObject var viewModal = HomeViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
             Text("All Coins")
                .font(.headline)
                .padding()
                
            HStack {
                Text("Coin")
                
                Spacer()
                
                Text("Prices")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            ScrollView {
                VStack {
                    ForEach(viewModal.coins) { coin in
                        BottomMoversItemView(coin: coin)
                    }
                }
            }
        }
    }
}

#Preview {
    BottomMoversView()
}
