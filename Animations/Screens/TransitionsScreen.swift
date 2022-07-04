//
//  TransitionsScreen.swift
//  Animations
//
//  Created by David Verbenyi on 01/07/2022.
//

import SwiftUI

struct TransitionsScreen: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .slide))
                
                Rectangle()
                    .fill(.blue)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        
    }
}

struct TransitionsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TransitionsScreen()
    }
}
