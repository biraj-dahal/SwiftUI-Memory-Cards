//
//  ContentView.swift
//  Memory Cards
//
//  Created by Biraj Dahal on 2/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cards: [Card] = Card.mockedCards
    @State private var cardsToPractice: [Card] = []
    @State private var cardsMemorized: [Card] = []
    
    var body: some View {
        
        ZStack{
            VStack{
                Button("Reset"){
                    cards = cardsToPractice + cardsMemorized
                    cardsToPractice = []
                    cardsMemorized = []
                }
                .disabled(cardsToPractice.isEmpty && cardsToPractice.isEmpty)
                
                Button("More Practice"){
                    cards = cardsToPractice
                    cardsToPractice = []
                    
                }
                .disabled(cardsToPractice.isEmpty)
            }
            
            ForEach(0..<cards.count, id: \.self){ index in
                CardView(card: cards[index], onSwipedLeft: {
                    let removedCard = cards.remove(at: index)
                    cardsToPractice.append(removedCard)
                }, onSwipedRight: {
                    let removedCard = cards.remove(at: index)
                    cardsMemorized.append(removedCard)
                })
                    .rotationEffect(.degrees(Double(cards.count - 1 - index) * -5))
            }
            
        }
        .animation(.bouncy, value: cards)
        
    }

}

#Preview {
    ContentView()
}
