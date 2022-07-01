//
//  ExplicitAnimationScreen.swift
//  Animations
//
//  Created by David Verbenyi on 26/06/2022.
//

import SwiftUI

struct ExplicitAnimationScreen: View {
    @State private var flipped = false
    let x: CGFloat = 0
    let y: CGFloat = 1
    let z: CGFloat = 0
    
    @State private var rotationDegrees = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            // Button
            ShapedButton(title: "Flip me", color: .blue, textColor: .white, clipShape: AnyShape(RoundedRectangle(cornerRadius: 15))) {
                withAnimation(.interpolatingSpring(stiffness: 50, damping: 2.5)) {
                    rotationDegrees = rotationDegrees == 0.0 ? 180 : 0
                }
            }
            .rotation3DEffect(.degrees(rotationDegrees), axis: (1, 0, 0))
            
            // Shape
            ZStack {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)
                    .clipShape(flipped ? AnyShape(Circle()) : AnyShape(RoundedRectangle(cornerRadius: 10)))
                Text("Flipping\n Shape")
            }
            .rotation3DEffect(.degrees(flipped ? -180 : 0), axis: (x, y, z))
            .onTapGesture {
                withAnimation() {
                    self.flipped.toggle()
                }
            }
        }
    }
}

struct ExplicitAnimationScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimationScreen()
    }
}
