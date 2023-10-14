//
//  HomeView.swift
//  CryptoCurrencyApp
//
//  Created by Nilay on 12/10/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModal = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                TopMoversView()
                
                Divider()
                
                BottomMoversView(viewModal: viewModal)
            }
            .navigationTitle("Live Prices")
        }
    }
}

#Preview {
    HomeView()
}
