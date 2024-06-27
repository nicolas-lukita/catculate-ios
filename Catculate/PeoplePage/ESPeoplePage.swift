//
//  ESPeoplePage.swift
//  Catculate
//
//  Created by Nicolas Lukita on 2024/6/5.
//

import SwiftUI

struct ESPeoplePage: View {
    let transactions: [Transaction];
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
            NavigationLink(destination: {
                let individualTransactions = (0..<numberOfPeople).map { index in
                    IndividualTransactions(index: index, transactions: transactions)
                }
                ESResultPage(transactions: transactions, numberOfPeople: numberOfPeople, individualTransactions: individualTransactions, path: $path)}) {
                    CustomButton(title: "Continue")
                }.padding()
        }
    }
}

#Preview {
    ESPeoplePage(transactions: [], path: .constant(NavigationPath()))
}
