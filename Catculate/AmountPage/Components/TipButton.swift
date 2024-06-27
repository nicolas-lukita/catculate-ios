//
//  TipButton.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/6/13.
//

import SwiftUI

struct TipButton: View {
    let title: String
    let isSelected: Bool
    let onTap: () -> Void
    var body: some View {
        Button(action: { onTap() }) {
            Text(title)
                .fontWeight(.bold)
                .frame(width: 80, height: 40)
                .foregroundStyle(.white)
                .background(isSelected ? Color.mint.opacity(0.8) : Color.gray.opacity(0.8))
                .cornerRadius(6)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    TipButton(title: "5%", isSelected: true, onTap: {})
}
