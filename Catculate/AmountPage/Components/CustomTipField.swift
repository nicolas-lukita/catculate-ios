//
//  CustomTipField.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/6/13.
//

import SwiftUI

struct CustomTipField: View {
    let title: String
    let hint: String?
    let isSelected: Bool
    let onSelect: () -> Void
    @Binding var valueBinding: Double?
    
    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(width: 70, height: 40)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                .background(
                    UnevenRoundedRectangle(cornerRadii: .init(
                        topLeading: 6,
                        bottomLeading: 6,
                        bottomTrailing: isSelected ? 0 : 6,
                        topTrailing: isSelected ? 0 : 6
                    ))
                    .fill(
                        isSelected
                        ? .mint.opacity(0.8)
                        : .gray.opacity(0.8))
                )
                .onTapGesture {
                    onSelect()
                }
            if isSelected {
                TextField(hint ?? "", value:
                            $valueBinding, format: .number)
                .frame(height: 40)
                .frame(maxWidth: 140)
                .padding(6)
                .cornerRadius(6)
                .keyboardType(.decimalPad)
                .textContentType(.none)
                .frame(height: 40)
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
}

#Preview {
    @State var value: Double? = nil
    return CustomTipField(title:"Custom", hint: "Tip amount %", isSelected: true, onSelect: {}, valueBinding: $value)
}
