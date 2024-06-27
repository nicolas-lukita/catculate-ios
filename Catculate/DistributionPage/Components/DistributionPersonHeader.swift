//
//  DistributionPersonHeader.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/5/26.
//

import SwiftUI

struct DistributionPersonHeader: View {
    let title: String;
    let color: Color;
    
    var body: some View {
        Text(title)
            .font(.system(size: 35))
            .fontWeight(.semibold)
            .foregroundStyle(color)
    }
}

#Preview {
    DistributionPersonHeader(title: "Person 1", color: .mint)
}
