//
//  ShapedButton.swift
//  Animations
//
//  Created by David Verbenyi on 25/06/2022.
//

import SwiftUI

struct ShapedButton: View {
    let title: String
    let color: Color
    let textColor: Color
    var padding: CGFloat = 30
    var clipShape: AnyShape
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .padding(.all, padding)
            .background(color)
            .foregroundColor(textColor)
            .clipShape(clipShape)
    }
}

struct ShapedButton_Previews: PreviewProvider {
    static var previews: some View {
        ShapedButton(title: "Test button", color: .blue, textColor: .white, padding: 15, clipShape: AnyShape(Capsule())) {
            print("")
        }
    }
}

// Allows passing any shape into clipShape modifier
struct AnyShape: Shape {
    init<S: Shape>(_ wrapped: S) {
        _path = { rect in
//            print("rect=\(rect)")
            let path = wrapped.path(in: rect)
//            print("path=\(path)")
            return path
        }
    }

    func path(in rect: CGRect) -> Path {
        return _path(rect)
    }

    private let _path: (CGRect) -> Path
}
