//
//  ContentView.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/5/17.
//

import SwiftUI

enum Mode {
    case equal, custom
}

struct Home: View {
    @State private var path = NavigationPath()
//    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Spacer()
                Image(systemName: "cat.circle")
                    .resizable()
                    .scaledToFill()
                    .foregroundStyle(.tint)
                    .frame(width: 100, height: 100)
                Spacer()
                NavigationLink(value: Mode.equal) {
                    Text("Even split")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(Color.mint)
                        .cornerRadius(10)
                }
                NavigationLink(value: Mode.custom) {
                    Text("Custom split")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(Color.mint)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationDestination(for: Mode.self) { mode in
                switch (mode) {
                case Mode.equal:
                    ESAmountPage(path: $path)
                case Mode.custom:
                    AmountPage(path: $path)
                }
            }
        }
        .accentColor(.mint)
    }
}

#Preview {
    Home()
}
