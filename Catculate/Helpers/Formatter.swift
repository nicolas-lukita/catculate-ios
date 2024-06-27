//
//  Formatter.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/5/25.
//

import Foundation

func formatAmount(_ amount: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 2
    formatter.groupingSeparator = ","
    formatter.locale = Locale(identifier: "en_US")
    
    return formatter.string(from: NSNumber(value: amount)) ?? "0.00"
}
