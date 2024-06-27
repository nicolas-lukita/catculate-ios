//
//  Background.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/5/25.
//

import SwiftUI

struct WhiteBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .edgesIgnoringSafeArea(.all) 
    }
}

extension View {
    func whiteBackground() -> some View {
        self.modifier(WhiteBackgroundModifier())
    }
}

