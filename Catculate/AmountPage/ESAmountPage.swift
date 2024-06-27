//
//  SingleAmountPage.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/6/5.
//

import SwiftUI

struct ESAmountPage: View {
    @Binding var path: NavigationPath
    
    @State private var totalAmount: Double? = nil
    @State private var selectedTip: Double = 0
    @State private var customTip: Double? = nil
    
    let tips: [Double] = [5, 10, 15, 20]
    
    var netAmount: Double {
        guard let totalAmount = totalAmount else { return 0 }
        let tip: Double = selectedTip == -1 ? customTip ?? 0 : selectedTip
        return totalAmount + (totalAmount * tip / 100)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    VStack {
                        HeaderText(title: "Amount")
                        Text("$\(formatAmount(netAmount ?? 0))")
                        .font(.system(size: 64))
                        .fontWeight(.semibold)
                        .foregroundStyle(.mint)
                        AmountNumberField(title: "Amount", hint: "Enter amount", valueBinding: $totalAmount)
//                        AmountNumberField(title: "%", hint: "Additional surcharge %", valueBinding: $customTip)
                        Spacer().frame(height: 30)
                        VStack(alignment: .leading) {
                            Text("Include Tip :")
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
                    }
                }
            }
            Spacer()
            NavigationLink(destination: {
                let tipPerc: Double = selectedTip == -1 ? customTip ?? 0 : selectedTip
                let tip = (totalAmount ?? 0)*(tipPerc/100)
                ESPeoplePage(transactions: [Transaction(title: "Amount", amount: totalAmount ?? 0), Transaction(title: "Tip", amount: tip)], path: $path)}) {
                CustomButton(title: "Continue")
            }
        }
        .padding()
    }
}

#Preview {
    ESAmountPage(path: .constant(NavigationPath()))
}
