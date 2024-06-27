//
//  AmountPage.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/5/17.
//

import SwiftUI

struct AmountPage: View {
    @Binding var path: NavigationPath
    
    @State private var transactions: [Transaction] = []
    @State private var newTransactionTitle: String = ""
    @State private var newTransactionAmount: Double? = nil
    @State private var selectedTip: Double = 0
    @State private var customTip: Double? = nil
    
    let tips: [Double] = [5, 10, 15, 20]
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    VStack {
                        HeaderText(title: "Transactions")
                        AmountTextField(title: "Name", hint: "Enter transaction", valueBinding: $newTransactionTitle)
                        AmountNumberField(title: "$", hint: "Enter amount", valueBinding: $newTransactionAmount)
                        Spacer().frame(height: 20)
                        Button(action: addNewTransaction) {
                            Text("Add Transaction")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                                .foregroundColor(.white)
                                .background(.mint)
                                .cornerRadius(10)
                        }
                        Spacer().frame(height: 30)
                        ForEach(transactions, id: \.self) { transaction in
                            TransactionItem(transaction: transaction, title: transaction.title, amount: transaction.amount, onRemove: handleRemoveTransaction)
                        }
                    }
                }
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("Tip :")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundStyle(.mint)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10) {
                    
                    ForEach(tips, id: \.self) { tip in
                        TipButton(title: "\(Int(tip))%", isSelected: selectedTip == tip, onTap: {selectedTip = tip})
                    }
                }
                HStack(spacing: 14) {
                    TipButton(title: "No tip", isSelected: selectedTip == 0, onTap: {selectedTip = 0})
                    
                    CustomTipField(title: "Custom", hint: "Tip amount %", isSelected: selectedTip == -1, onSelect: {selectedTip = -1}, valueBinding: $customTip)
                    Spacer()
                }
            }
            NavigationLink(destination: {
                let tipPercentage: Double = selectedTip == -1 ? customTip ?? 0 : selectedTip
                PeoplePage(transactions: transactions,tipPercentage: tipPercentage, path: $path)}) {
                CustomButton(title: "Continue")
            }
        }
        .padding()
    }
    private func handleRemoveTransaction(transaction: Transaction) {
        if let index = transactions.firstIndex(where: { $0.id == transaction.id }) {
            transactions.remove(at: index)
        }
    }
    
    private func addNewTransaction() {
        guard let amount = newTransactionAmount, !newTransactionTitle.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        let newTransaction = Transaction(title: newTransactionTitle, amount: amount)
        transactions.append(newTransaction)
        newTransactionTitle = ""
        newTransactionAmount = nil
    }
    
    private func calculateTotalSum() -> Double {
        return transactions.reduce(0) { $0 + $1.amount }
    }
}

#Preview {
    AmountPage(path: .constant(NavigationPath()))
}
