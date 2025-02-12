//
//  ContentView.swift
//  Memory Cards
//
//  Created by Biraj Dahal on 2/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cards: [Card] = Card.mockedCards
    
    var body: some View {
        ZStack{
            
            ForEach(0..<cards.count, id: \.self){ index in
                CardView(card: cards[index])
                    .rotationEffect(.degrees(Double(cards.count - 1 - index) * -5))
            }
            
        }
        
    }

}

#Preview {
    ContentView()
}
