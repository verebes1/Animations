//
//  MainTabScreen.swift
//  Animations
//
//  Created by David Verbenyi on 25/06/2022.
//

import SwiftUI

struct MainTabScreen: View {
    @State private var selected = 0
    
    var body: some View {
        TabView(selection: $selected.animation(
            .easeInOut(duration: 3.5))
        ) {
            ImplicitAnimationScreen()
                .tabItem {
                    Label("Implicit", systemImage: "list.dash")
                }.tag(0)
            
            AnimatedBindingsScreen()
                .tabItem {
                    Label("Bindings", systemImage: "paperclip")
                }.tag(1)
            
            ExplicitAnimationScreen()
                .tabItem {
                    Label("Explicit", systemImage: "square.and.arrow.down")
                }.tag(2)
            GesturesScreen()
                .tabItem {
                    Label("Gestures", systemImage: "scribble.variable")
                }.tag(3)
            TransitionsScreen()
                .tabItem {
                    Label("Transitions", systemImage: "rectangle.portrait.and.arrow.right.fill")
                }.tag(4)
        }
        .animation(.easeInOut(duration: 1), value: selected)
//        .onChange(of: selected, perform: { tab in
//            print("TAPPED ON :\(tab)")
//            withAnimation(.easeInOut(duration: 2)) {
//                selected = tab
//            }
//        })
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabScreen()
    }
}
