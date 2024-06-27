//
//  Transaction.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/5/18.
//

import Foundation

struct Transaction: Codable, Hashable {
    var id = UUID();
    var title: String;
    var amount: Double;
}
