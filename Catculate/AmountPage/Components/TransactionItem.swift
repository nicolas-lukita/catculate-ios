//
//  TransactionItem.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/5/25.
//

import SwiftUI

struct TransactionItem: View {
    let transaction: Transaction;
    let title: String;
    let amount: Double;
    let onRemove: (Transaction) -> Void
    @State var showRemovePrompt: Bool = false;
    
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
            Button(action: { showRemovePrompt = true }) {
                Image(systemName: "trash")
                    .padding(.leading, 8)
                    .foregroundColor(.red)
            }.buttonStyle(PlainButtonStyle())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 15)
        .padding(.horizontal, 20)
        .background(.gray.opacity(0.2))
        .cornerRadius(10)
        .confirmationDialog("Are you sure you want to remove \(title)?", isPresented: $showRemovePrompt) {
            Button("Remove transaction", role: .destructive) {
                onRemove(transaction)
            }
        } message: {
            Text("Are you sure you want to remove \(title)?")
        }
    }
}

#Preview {
    TransactionItem(transaction:Transaction(title: "Drinks", amount: 1234),title: "Drinks", amount:1234, onRemove: {_ in})
}
