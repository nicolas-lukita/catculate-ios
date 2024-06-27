//
//  DistributionTipItem.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/6/13.
//

import SwiftUI

struct DistributionTipItem: View {
    let title: String;
    let amount: Double;
    let isSelected: Bool;
    let color: Color;
    
    var body: some View {
        HStack {
            Text("\(title)")
                .font(.system(size: 20))
                .fontWeight(.semibold)
            Spacer()
            HStack(spacing: 2) {
                Text("\(formatAmount(amount))")
                    .fontWeight(.semibold)
                Text("%")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 15)
        .padding(.horizontal, 20)
        .background(isSelected ? color.opacity(0.2) : .gray.opacity(0.2))
        .cornerRadius(10)
    }
}

#Preview {
    VStack {
        DistributionTipItem(title: "Tip", amount: 5, isSelected: true, color: .red)
        DistributionTipItem(title: "Tip", amount: 10, isSelected: false, color: .yellow)
    }
}
