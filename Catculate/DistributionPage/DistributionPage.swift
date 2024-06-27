//
//  DistributionPage.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/5/18.
//

import SwiftUI

struct DistributionPage: View {
    let transactions: [Transaction]
    let tipPercentage: Double
    let numberOfPeople: Int
    let colors: [Color]
    @Binding var path: NavigationPath
    
    @State private var currentPerson = 0
    
    @State private var personTransaction: [Transaction] = []
    @State private var individualTransactions: [IndividualTransactions] = []
    @State private var isIncludeTip = false
    
    var body: some View {
        VStack(alignment: .leading) {
            if ((currentPerson+1 > numberOfPeople)) {
                ResultPage(transactions: transactions, tipPercentage: tipPercentage, numberOfPeople: numberOfPeople, individualTransactions: individualTransactions, path: $path)
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(4)
                    .foregroundColor(colors[currentPerson])
                DistributionPersonHeader(title: "Person \(currentPerson + 1)", color: colors[currentPerson]).foregroundColor(colors[currentPerson])
                Text("Select transaction(s) to include to your bill")
                    .fontWeight(.medium)
                    .foregroundStyle(colors[currentPerson])
                Spacer().frame(height: 30)
                ForEach(transactions, id: \.self) { transaction in
                    let isSelected: Bool = personTransaction.contains(transaction)
                    DistributionTransactionItem(title: transaction.title, amount: transaction.amount, isSelected: isSelected, color: colors[currentPerson])
                        .onTapGesture {
                            print("transaction added")
                            if (personTransaction.contains(transaction)) {
                                if let index = personTransaction.firstIndex(of: transaction) {
                                    personTransaction.remove(at: index)
                                } else {
                                    print("Transaction does not exist")
                                }
                            } else {
                                personTransaction.append(transaction)
                            }
                        }
                }
                Spacer()
                Button(action: {
                    if (currentPerson + 1 < numberOfPeople) {
                        individualTransactions.append(IndividualTransactions(index: currentPerson, transactions: personTransaction))
                        personTransaction = []
                        isIncludeTip = false
                    } else {
                        individualTransactions.append(IndividualTransactions(index: currentPerson, transactions: personTransaction))
                    }
                    currentPerson += 1
                }) {
                    CustomButton(title: (currentPerson+1 < numberOfPeople) ? "Next person" : "Calculate!")
                }
            }
        }
        .padding()
    }
}

#Preview {
    DistributionPage(
        transactions: [
            Transaction(title: "Groceries", amount: 50.0),
            Transaction(title: "Rent", amount: 1200.0),
            Transaction(title: "Utilities", amount: 150.0)
        ],
        tipPercentage: 10,
        numberOfPeople: 2,
        colors: [.blue, .mint, .red],
        path: .constant(NavigationPath())
    )
}
