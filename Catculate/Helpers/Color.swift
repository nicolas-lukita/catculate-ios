//
//  Color.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/5/18.
//

import Foundation
import SwiftUI

func generateRandomColors(total: Int) -> [Color] {
   return (0..<total).map { _ in
        Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}

func generateRandomColor() -> Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }


