//
//  AnyTransition+Extension.swift
//  Animations
//
//  Created by David Verbenyi on 04/07/2022.
//

import SwiftUI

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}
