//
//  MainTabScreen.swift
//  Animations
//
//  Created by David Verbenyi on 25/06/2022.
//

import SwiftUI

struct MainTabScreen: View {
    var body: some View {
        TabView {
            ImplicitAnimationScreen()
                .tabItem {
                    Label("Implicit", systemImage: "list.dash")
                }
            
            AnimatedBindingsScreen()
                .tabItem {
                    Label("Bindings", systemImage: "paperclip")
                }
            
            ExplicitAnimationScreen()
                .tabItem {
                    Label("Explicit", systemImage: "square.and.arrow.down")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabScreen()
    }
}
