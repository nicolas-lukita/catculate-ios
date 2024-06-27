//
//  IndividualTransactions.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/5/18.
//

import Foundation

struct IndividualTransactions: Codable, Hashable {
    var id = UUID()
    var index: Int
    var transactions: [Transaction]
}
