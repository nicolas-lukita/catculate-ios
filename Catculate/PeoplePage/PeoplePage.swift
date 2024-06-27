//
//  PeoplePage.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/5/18.
//

import SwiftUI

struct PeoplePage: View {
    let transactions: [Transaction];
    let tipPercentage: Double
    @Binding var path: NavigationPath
    
    @State private var numberOfPeople: Int = 2
    @State private var colors: [Color] = [.mint, .blue]
    private let columns = [
        GridItem(.adaptive(minimum: 50)),
    ]
    private let maxPeoplePerRow = 5
    private let maxTotalPeople = 25
    private let minTotalPeople = 2
    
    var body: some View {
        VStack {
            HeaderText(title: "Number of people")
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: maxPeoplePerRow), alignment: .center, spacing: 10) {
                    ForEach(0..<numberOfPeople, id: \.self) { index in
                        VStack {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(4)
                                .foregroundColor(colors[index])
                            Text("\(index + 1)")
                                .font(.caption)
                        }
                    }
                }
                .padding()
            }
            Spacer()
            HStack {
                Button {
                    if numberOfPeople > minTotalPeople {
                        numberOfPeople -= 1
                        if colors.count > 2 {
                            colors.removeLast()
                        }
                    }
                } label: {
                    Image(systemName: "minus")
                        .resizable()
                        .frame(width: 20, height: 2)
                        .foregroundColor(.white)
                }
                .buttonStyle(ScaleButtonStyle(color: Color.red))
                .padding(.horizontal)
                
                Text("\(numberOfPeople)")
                    .font(.largeTitle)
                    .padding(.horizontal)
                    .frame(width: 100)
                
                Button {
                    if numberOfPeople < maxTotalPeople {
                        numberOfPeople += 1
                        colors.append(generateRandomColor())
                    }
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                }.buttonStyle(ScaleButtonStyle(color: Color.green))
                    .padding(.horizontal)
            }
            .padding(.bottom)
            NavigationLink(destination:
                            DistributionPage(
                                transactions: transactions,
                                tipPercentage: tipPercentage,
                                numberOfPeople: numberOfPeople,
                                colors: colors,
                                path: $path)) {
                                    CustomButton(title: "Continue")
                                }.padding()
        }
    }
}

#Preview {
    PeoplePage(transactions: [], tipPercentage: 10, path: .constant(NavigationPath()))
}

struct ScaleButtonStyle: ButtonStyle {
    let color: Color
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 60, height: 60)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: configuration.isPressed ? 24 : 20))
            .shadow(radius: configuration.isPressed ? 0 : 2)
            .scaleEffect(configuration.isPressed ? 0.99 : 1)
    }
}
