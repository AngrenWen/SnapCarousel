//
//  Card.swift
//  
//
//  Created by Anna Smoleń on 21/02/2022.
//

import SwiftUI

struct Card<Content: View>: View {
    let width: CGFloat
    let height: CGFloat
    let content: Content
    
    @inlinable init(width: CGFloat,
                    height: CGFloat,
                    @ViewBuilder content: () -> Content) {
        self.width = width
        self.height = height
        self.content = content()
    }
    
    var body: some View {
        content
            .frame(width: width,
                   height: height,
                   alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.gray)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        let width = UIScreen.main.bounds.width * 0.8
        let height = width / 3
        Card(width: width, height: height) {
            Text("\(width) \(height)")
        }
//        .foregroundColor(Color.gray)
//        .background(Color.yellow)
//        .cornerRadius(8)
//        .shadow(color: Color.gray, radius: 4, x: 0, y: 4)
    }
}
