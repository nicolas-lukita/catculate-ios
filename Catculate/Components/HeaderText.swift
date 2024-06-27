//
//  HeaderText.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/5/18.
//

import SwiftUI

struct HeaderText: View {
    let title: String;
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 34))
                .fontWeight(.semibold)
                .foregroundStyle(.mint)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HeaderText(title: "Headline")
}
