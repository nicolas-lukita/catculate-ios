//
//  SwiftUIView.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/5/25.
//

import SwiftUI

struct DefaultBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.yellow)
            .edgesIgnoringSafeArea(.all)
    }
}

extension View {
    func defaultBackground() -> some View {
        self.modifier(DefaultBackgroundModifier())
    }
}
