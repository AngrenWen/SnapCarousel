//
//  SnapCarousel.swift
//  
//
//  Created by Anna Smoleń on 21/02/2022.
//

import SwiftUI
import Combine

struct SnapCarousel<Content: View & Identifiable>: View {
    var cardsContent: [Content]
    
    private var cardWidth: CGFloat
    private var cardHeight: CGFloat
    
    public init(cardWidth: CGFloat, cardHeight: CGFloat, items: [Content]) {
        self.cardWidth = cardWidth
        self.cardHeight = cardHeight
        self.cardsContent = items
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(cardsContent, id: \.self.id) { content in
                    Card(width: cardWidth, height: cardHeight) {
                        content
                    }
                }
            }
        }
    }
}

struct SnapCarousel_Previews: PreviewProvider {
    static var previews: some View {
        let width = UIScreen.main.bounds.width * 0.8
        let height = width * 0.3
        let data = [DataModel(s1: "jeden", s2: "dwa"),
        DataModel(s1: "one", s2: "two"),
        DataModel(s1: "ein", s2: "zwei")]
        
        let views = data.map { CardContent(data: $0) }
        SnapCarousel<CardContent>(cardWidth: width, cardHeight: height, items: views)
    }
}

struct DataModel {
    let s1: String
    let s2: String
}

struct CardContent: View, Identifiable {
    let id = UUID()
    var data: DataModel
  
    var body: some View {
        HStack {
            Text(data.s1)
            Text(data.s2)
        }
    }
}
