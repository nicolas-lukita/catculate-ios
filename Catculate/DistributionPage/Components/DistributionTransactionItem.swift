//
//  DistributionTransactionItem.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/5/26.
//

import SwiftUI

struct DistributionTransactionItem: View {
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
                Text("$")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                Text("\(formatAmount(amount))")
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
        DistributionTransactionItem(title: "Groceries", amount: 999.2342, isSelected: true, color: .red)
        DistributionTransactionItem(title: "Food", amount: 100, isSelected: false, color: .yellow)
    }
}
