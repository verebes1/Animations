//
//  GesturesScreen.swift
//  Animations
//
//  Created by David Verbenyi on 01/07/2022.
//

import SwiftUI

struct GesturesScreen: View {
    @State private var cardDragAmount = CGSize.zero
    
    let letters = Array("Hello SwiftUI!")
    @State private var enabled = false
    @State private var textDragAmount = CGSize.zero

    
    var body: some View {
        VStack(spacing: 30) {
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(cardDragAmount)
                .gesture(
                    DragGesture()
                        .onChanged { cardDragAmount = $0.translation }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                cardDragAmount = .zero
                            }
                        }
                )
            //            .animation(.spring(), value: dragAmount)

            HStack(spacing: 0) {
                ForEach(0 ..< letters.count) { num in
                    Text(String(letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(enabled ? .blue : .red)
                        .foregroundColor(.white)
                        .offset(textDragAmount)
                        .animation(.default.delay(Double(num) / 20), value: textDragAmount)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { textDragAmount = $0.translation }
                    .onEnded { _ in
                        textDragAmount = .zero
                        enabled.toggle()
                    }
            )
        }
    }
}

struct GesturesScreen_Previews: PreviewProvider {
    static var previews: some View {
        GesturesScreen()
    }
}
