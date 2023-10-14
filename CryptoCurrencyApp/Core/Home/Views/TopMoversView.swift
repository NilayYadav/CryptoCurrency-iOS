//
//  TopMoversView.swift
//  CryptoCurrencyApp
//
//  Created by Nilay on 12/10/23.
//

import SwiftUI

struct TopMoversView: View {
    
    @StateObject var viewModal = HomeViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Movers")
                .font(.headline)
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(viewModal.Topcoins) { coin in
                        TopMoversItemView(coin: coin)
                    }
                }
            }
        }
        .padding()
        
    }
}

#Preview {
    TopMoversView()
}
