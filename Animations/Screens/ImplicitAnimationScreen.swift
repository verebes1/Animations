//
//  ContentView.swift
//  Animations
//
//  Created by David Verbenyi on 24/06/2022.
//

import SwiftUI

struct ImplicitAnimationScreen: View {  
    @State private var animationAmount = 1.0
    @State private var repeatAnimation = 1.0
    @State private var bounceAnimation = 1.0
    @State private var pulseAnimation = 1.0
    
    // double animation stack
    @State private var morphed = false
    
    var body: some View {
        VStack(spacing: 35) {
            ShapedButton(title: "Scaling\n Blurring", color: .red, textColor: .white, padding: 30, clipShape: AnyShape(Circle())) {
                animationAmount = animationAmount == 4 ? 1.0 : animationAmount + 1
            }
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1) * 3)
            .animation(.easeInOut, value: animationAmount)
            
            ShapedButton(title: "Repeat Scaling", color: .green, textColor: .white, padding: 15, clipShape: AnyShape(Capsule())) {
                repeatAnimation = repeatAnimation == 2 ? 1.0 : repeatAnimation + 1
            }
            .scaleEffect(repeatAnimation)
            .animation(.easeInOut(duration: 0.5)
                .repeatCount(3, autoreverses: true)
//                .repeatForever(autoreverses: true)
                       , value: repeatAnimation)
            
            ShapedButton(title: "Bouncy Button", color: .blue, textColor: .white, padding: 15, clipShape: AnyShape(RoundedRectangle(cornerRadius: 10))) {
                bounceAnimation = bounceAnimation == 2.5 ? 1 : bounceAnimation + 0.5
            }
            .scaleEffect(bounceAnimation)
            .animation(.interpolatingSpring(stiffness: 100, damping: 5), value: bounceAnimation)
            
            ShapedButton(title: "Pulsating", color: .orange, textColor: .white, clipShape: AnyShape(Circle())) {
                // Code here
            }
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(pulseAnimation)
                    .opacity(2 - pulseAnimation)
                    .animation(.easeOut(duration: 1.0)
                        .repeatForever(autoreverses: false)
                               , value: pulseAnimation)
            )
            .onAppear {
                pulseAnimation = 2
            }
            
            Button("Morphing") {
                morphed.toggle()
            }
            .foregroundColor(.white)
//            .frame(width: morphed ? 150 : 200, height: 50, alignment: .center)
            .frame(width: 150, height: 50, alignment: .center)
            .background(morphed ? .gray : .teal)
            .animation(.easeInOut(duration: 3.5), value: morphed)
//            .padding(10)
//            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: morphed ? 50 : 0))
//            .rotation3DEffect(.degrees(morphed ? 180 : 0), axis: (0, 1, 0))
            .rotation3DEffect(.degrees(morphed ? 180 : 0), axis: (1, 0, 0))
            .scaleEffect(morphed ? 1.3 : 1)
            .animation(.interpolatingSpring(stiffness: 100, damping: 1), value: morphed)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimationScreen()
    }
}
