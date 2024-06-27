//
//  AmountTextField.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/6/5.
//

import SwiftUI

struct AmountTextField: View {
    let title: String
    let hint: String?
    @Binding var valueBinding: String
    
    var body: some View {
        HStack(spacing: 0) {
            HStack {
                Text(title)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            }
            .frame(width: 70, height: 50)
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            .background(
                UnevenRoundedRectangle(cornerRadii: .init(
                    topLeading: 10,
                    bottomLeading: 10,
                    bottomTrailing: 0,
                    topTrailing: 0
                ))
                .fill(Color.mint))
            TextField(hint ?? "", text:
                        $valueBinding )
            .frame(height: 50)
            .padding(6)
            .cornerRadius(10)
            .textContentType(.none)
            .frame(height: 50)
            .background(
                UnevenRoundedRectangle(cornerRadii: .init(
                    topLeading: 0,
                    bottomLeading: 0,
                    bottomTrailing: 10,
                    topTrailing: 10
                ))
                .fill(Color.gray.opacity(0.1)))
        }
    }
}

#Preview {
    @State var value: String = ""
    return AmountTextField(title:"Sample", hint:"hint text", valueBinding: $value)
}
