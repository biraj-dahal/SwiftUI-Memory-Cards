//
//  CardView.swift
//  Memory Cards
//
//  Created by Biraj Dahal on 2/11/25.
//

import SwiftUI

struct Card{
    
    let question: String
    let answer: String
    
    static let mockedCards = [
        Card(question: "What is Swift?", answer: "A high-level programming language"),
        Card(question: "What is iOS?", answer: "A mobile operating system"),
        Card(question: "What is macOS?", answer: "A desktop operating system"),
        Card(question: "What is Linux?", answer: "An open-source operating system"),
        Card(question: "What is Docker?", answer: "Docker is a packaging software to contenarize applications"),
    ]
}

struct CardView: View {
    
    let card: Card
    
    @State private var isShowingQuestion = true
    
    var body: some View {
        ZStack
        {
            RoundedRectangle(cornerRadius: 20)
                .fill(isShowingQuestion ? Color.red : Color.green)
                .shadow(color: .black, radius: 4, x: -10, y: 20)
                .onTapGesture {
                    isShowingQuestion.toggle()
                }
            
            VStack(spacing:30){
                
                Text(isShowingQuestion ? "Question" : "Answer")
                    .font(.title)
                
                Rectangle()
                    .frame(height: 1)
                
                Text(isShowingQuestion ? card.question : card.answer)
                    .font(.system(size: 24, weight: .semibold))
                    .multilineTextAlignment(.center)
                    
            }
            .foregroundStyle(.white)
            .bold()
            .padding(40)
            
        }
        .frame(width: 350, height: 700)
    }
}

#Preview {
    CardView(card: Card(question: "Located at the southern end of Puget Sound, which is the capitol of Washington?", answer: "Olympia"))
}
