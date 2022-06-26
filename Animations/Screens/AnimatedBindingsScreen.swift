//
//  AnimatedBindingsScreen.swift
//  Animations
//
//  Created by David Verbenyi on 25/06/2022.
//

import SwiftUI

struct AnimatedBindingsScreen: View {
    @State private var animationAmmount = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            Stepper("Scale amount", value: $animationAmmount.animation(
                .easeInOut(duration: 0.5)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            Spacer()
            ShapedButton(title: "Tap me", color: .red, textColor: .white, clipShape: AnyShape(Circle())) {
                animationAmmount += 1
            }
            .scaleEffect(animationAmmount)
        }
        .padding()
    }
}

struct AnimatedBindingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedBindingsScreen()
    }
}
