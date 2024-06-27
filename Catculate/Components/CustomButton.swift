//
//  CustomButton.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/5/18.
//

import SwiftUI

struct CustomButton: View {
    let title: String;
    
    var body: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .foregroundColor(.white)
            .background(Color.mint)
            .cornerRadius(10)
    }
}

#Preview {
    CustomButton(title: "Continue")
}
